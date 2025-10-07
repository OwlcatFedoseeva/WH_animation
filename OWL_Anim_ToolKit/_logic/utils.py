import maya.cmds as cmds
import maya.mel as mel
import os
import re


# ───────────────────────── существующие помощники ─────────────────────────

def _find_root(name):
    roots = cmds.ls(name, type="transform") or []
    roots += cmds.ls("*:%s" % name, type="transform") or []
    seen = set()
    uniq = []
    for r in roots:
        if r not in seen:
            seen.add(r)
            uniq.append(r)
    return uniq[0] if uniq else None

def get_keys_info(curves):
    """Сохраняем ключи (время, значение) для сравнения"""
    data = {}
    for c in curves:
        times = cmds.keyframe(c, q=True, tc=True) or []
        values = cmds.keyframe(c, q=True, vc=True) or []
        data[c] = list(zip(times, values))
    return data

def euler_filter_on_skeleton(root_name="Position"):
    root = _find_root(root_name)
    if not root:
        cmds.warning(u"[EulerFilter] Не нашёл корневой узел '%s'." % root_name)
        return

    joints = cmds.listRelatives(root, ad=True, type="joint") or []
    joints = list(set(joints))
    if not joints:
        cmds.warning(u"[EulerFilter] У '%s' не найдено дочерних джойнтов." % root)
        return

    rot_attrs = ("rotateX", "rotateY", "rotateZ")
    curves = set()
    for j in joints:
        for a in rot_attrs:
            plug = "%s.%s" % (j, a)
            con = cmds.listConnections(plug, s=True, d=False, type="animCurveTA") or []
            for c in con:
                curves.add(c)

    curves = list(curves)
    before = get_keys_info(curves)

    # Применяем Euler Filter
    try:
        cmds.undoInfo(openChunk=True, chunkName="EulerFilter on skeleton")
        cmds.filterCurve(curves, filter="euler")
    finally:
        cmds.undoInfo(closeChunk=True)

    after = get_keys_info(curves)
    changed = [c for c in curves if before[c] != after[c]]

    if changed:
        print("Изменённые кривые:")
        for c in changed:
            print("  -", c)


def clear_temp_files(temp_dir):
    if not os.path.exists(temp_dir):
        return
    deleted_count = 0
    for filename in os.listdir(temp_dir):
        if filename.startswith("temp_"):
            file_path = os.path.join(temp_dir, filename)
            try:
                os.remove(file_path)
                deleted_count += 1
            except Exception as e:
                print(f"❌ Не удалось удалить {file_path}: {e}")
    print(f"🧹 Удалено {deleted_count} временных файлов из: {temp_dir}")

def ensure_export_folder(scene_path, logger=None):
    """
    Убеждается, что существует папка 'Export' рядом с .ma файлом.
    Возвращает путь к ней.
    """
    scene_dir = os.path.dirname(scene_path)
    export_dir = os.path.join(scene_dir, "Export")
    
    if not os.path.exists(export_dir):
        os.makedirs(export_dir)
        if logger:
            logger.log(f"📁 Папка 'Export' создана: {export_dir}")
    else:
        if logger:
            logger.log(f"📁 Папка 'Export' уже существует: {export_dir}")
    
    return os.path.normpath(export_dir)

def find_set_by_suffix(suffix: str):
    """
    Ищет первый сет в сцене, имя которого заканчивается на указанный суффикс,
    игнорируя namespace.
    """
    all_sets = cmds.ls(type="objectSet")
    for s in all_sets:
        if s.endswith(suffix):
            return s
    return None

import maya.cmds as cmds

def keep_only_parent_group(group_name="ParentForExportDelete",
                           reparent_to_world=True,
                           select_after=True):
    """
    Оставляет в сцене только указанный group и ВСЕ его дочерние ноды.
    Удаляет все остальные корневые DAG-ноды (включая камеры, меши и т.п.).

    Args:
        group_name (str): Имя корневого узла, который нужно сохранить.
        reparent_to_world (bool): Если группа не на верхнем уровне — поднять её в world.
        select_after (bool): Выделить группу после очистки.
    """
    if not cmds.objExists(group_name):
        cmds.error("Узел '{}' не найден в сцене.".format(group_name))
        return
    target = cmds.ls(group_name, long=True) or [group_name]
    target = target[0]

    if reparent_to_world and cmds.listRelatives(target, parent=True):
        cmds.parent(target, world=True)
        target = cmds.ls(target, long=True)[0]

    roots = cmds.ls(assemblies=True, long=True) or []

    to_delete = [r for r in roots if r != target]
    if to_delete:
        cmds.delete(to_delete)

    if select_after:
        cmds.select(target, r=True)

    print("[Clean] Остался только '{}', всего детей: {}".format(
        target, len(cmds.listRelatives(target, allDescendents=True, fullPath=True) or [])
    ))


# ───────────────────────── новые внутренние помощники ─────────────────────────

def _sanitize_name(name: str) -> str:
    name = (name or "").strip()
    return re.sub(r'[\\/:*?"<>|]+', '_', name) or "Clip"

def _ensure_fbx_loaded():
    try:
        if not cmds.pluginInfo('fbxmaya', q=True, loaded=True):
            cmds.loadPlugin('fbxmaya')
    except Exception as e:
        cmds.error("Не удалось загрузить плагин fbxmaya: %s" % e)

def _ensure_scene_saved():
    if not cmds.file(q=True, sceneName=True):
        cmds.error("Please save the scene before exporting.")

def _normalize_frames(start, end):
    s = int(round(float(start)))
    e = int(round(float(end)))
    if e < s:
        s, e = e, s
    return s, e

def _fbx_common_preamble(no_bake=True):
    # Общие настройки FBX без повторного запекания/ресемплинга
    mel.eval('FBXResetExport;')
    mel.eval('FBXExportUpAxis "y";')
    mel.eval('FBXExportConvertUnitString "cm";')
    mel.eval('FBXExportAnimationOnly -v false;')
    mel.eval('FBXExportSkins -v true;')
    mel.eval('FBXExportShapes -v true;')
    mel.eval('FBXExportConstraints -v false;')

    mel.eval(f'FBXExportBakeComplexAnimation -v {"false" if no_bake else "true"};')

    # Эти команды есть не во всех версиях плагина — вызываем только если существуют
    if int(mel.eval('exists "FBXExportResampleAnimation"')):
        mel.eval('FBXExportResampleAnimation -v false;')

    if int(mel.eval('exists "FBXExportApplyConstantKeyReducer"')):
        mel.eval('FBXExportApplyConstantKeyReducer -v false;')

    mel.eval('FBXExportQuaternion -v "euler";')
    mel.eval('FBXExportUseSceneName -v false;')
    mel.eval('FBXExportInAscii -v false;')


def _prepare_export_path(path):
    path = path.replace('\\', '/')
    folder = os.path.dirname(path)
    if folder and not os.path.exists(folder):
        os.makedirs(folder)
    return path

def _select_hierarchy(root_joint, selection_only=True):
    if selection_only:
        cmds.select(root_joint, hierarchy=True, replace=True)
    else:
        cmds.select(clear=True)


# ───────────────────────── новый атомарный экспорт клипа ─────────────────────────

def export_single_clip_fbx(export_path,
                           clip_name,
                           start,
                           end,
                           root_joint="Position",
                           logger=None,
                           selection_only=True):
    """
    Экспорт одного клипа в отдельный FBX:
      • создаёт РОВНО один именованный take (без 'Take 001')
      • НЕ делает повторный bake/resample (считаем, что всё уже запекли выше)
    """
    if not cmds.objExists(root_joint):
        cmds.error(f"Root joint '{root_joint}' not found in the scene.")
        return

    _ensure_scene_saved()
    _ensure_fbx_loaded()

    clip_name = _sanitize_name(clip_name)
    s, e = _normalize_frames(start, end)

    _fbx_common_preamble(no_bake=True)

    # один именованный take
    mel.eval('FBXExportSplitAnimationIntoTakes -clear;')
    mel.eval('FBXExportSplitAnimationIntoTakes -v "{}" {} {};'.format(clip_name, s, e))

    # путь и экспорт
    export_path = _prepare_export_path(export_path)
    _select_hierarchy(root_joint, selection_only=selection_only)
    mel.eval(f'FBXExport -f "{export_path}" -s;')

    if logger:
        logger.log(f"📦 FBX: {export_path}  🎬 Take: {clip_name}  ⌛ {s}-{e}")


# ───────────────────────── обновлённый back-compat экспорт ─────────────────────────

def export_fbx_for_unity(export_path,
                         clip_name,
                         root_joint,
                         logger=None,
                         selection_only=True,
                         **kwargs):
    """
    Совместимо со старым кодом:
      • если переданы start/end -> экспорт ОДНОГО клипа через export_single_clip_fbx
      • если НЕ переданы -> экспорт цельной анимации целиком, но с ОДНИМ именованным take=clip_name
        на весь таймлайн (чтобы Unity не показывал Take 001)
    """
    # режим клипа (отрезка)
    s_kw = kwargs.get("start")
    e_kw = kwargs.get("end")
    if s_kw is not None and e_kw is not None:
        return export_single_clip_fbx(
            export_path=export_path,
            clip_name=clip_name,
            start=s_kw,
            end=e_kw,
            root_joint=root_joint,
            logger=logger,
            selection_only=selection_only
        )

    # режим цельной анимации
    objects_to_check = ['ParentForExportDelete', 'Root_M', 'Position']
    root_joint = None
    for obj in objects_to_check:
        if cmds.objExists(obj):
            root_joint = obj
            break
    if not root_joint:
        logger.log("❌ Root joint not found. Экспорт FBX отменён.", color="red")
        return

    _ensure_scene_saved()
    _ensure_fbx_loaded()

    # Берём таймлайн
    start_frame = int(round(float(cmds.playbackOptions(q=True, minTime=True))))
    end_frame   = int(round(float(cmds.playbackOptions(q=True, maxTime=True))))

    _fbx_common_preamble(no_bake=True)

    # создаём один именованный take на весь таймлайн
    safe_name = _sanitize_name(clip_name)
    mel.eval('FBXExportSplitAnimationIntoTakes -clear;')
    mel.eval('FBXExportSplitAnimationIntoTakes -v "{}" {} {};'.format(safe_name, start_frame, end_frame))

    export_path = _prepare_export_path(export_path)
    _select_hierarchy(root_joint, selection_only=selection_only)
    mel.eval(f'FBXExport -f "{export_path}" -s;')

    if logger:
        logger.log(f"✅ Анимация экспортирована (whole as single take '{safe_name}'): {export_path}")
