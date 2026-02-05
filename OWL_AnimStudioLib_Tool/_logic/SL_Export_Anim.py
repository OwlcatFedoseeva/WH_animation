import os
import maya.cmds as cmds
import importlib
import sys
import traceback

from maya import mel
from OWL_AnimStudioLib_Tool._utils import config

_MUTILS = None
_MUTILS_ERROR = None

# add candidate paths if they exist
candidates = config.get_studio_lib_candidates()

for p in candidates:
    if p and os.path.isdir(p) and p not in sys.path:
        sys.path.insert(0, p)


def _load_mutils():
    global _MUTILS, _MUTILS_ERROR
    if _MUTILS:
        return _MUTILS
    if _MUTILS_ERROR:
        raise RuntimeError(
            "mutils not found. Set Studio Library path in Settings -> Studio Library Path."
        ) from _MUTILS_ERROR
    if not candidates:
        raise RuntimeError(
            "Studio Library path is not set. Use Settings -> Studio Library Path in the tool UI "
            "or edit OWL_AnimStudioLib_Tool_settings.json in your Maya user app dir."
        )
    try:
        import mutils
        _MUTILS = mutils
        print("# mutils imported from:", getattr(mutils, "__file__", "<unknown>"))
        print("# mutils exports (sample):", sorted([n for n in dir(mutils) if not n.startswith("_")])[:40])
        _MUTILS.animation.validateAnimLayers = _patch_validate_anim_layers
        return _MUTILS
    except Exception as e:
        _MUTILS_ERROR = e
        print("# ERROR importing mutils:", e)
        print("# sys.path (first 12 entries):")
        for p in sys.path[:12]:
            print("  ", p)
        traceback.print_exc()
        raise RuntimeError(
            "mutils not found. Ensure Studio Library is installed and the path is set."
        ) from e


modules_to_reload = ['OWL_AnimStudioLib_Tool._utils.JSON_Export_Scene_Data']
for mod_name in modules_to_reload:
    mod = importlib.import_module(mod_name)
    importlib.reload(mod)


from OWL_AnimStudioLib_Tool._utils.JSON_Export_Scene_Data import write_scene_metadata

def save_current_animation(save_folder, clip_name, start=None, end=None):
    """
    Save current animation using mutils (same as Studio Library).
    """
    mutils = _load_mutils()
    if not os.path.exists(save_folder):
        os.makedirs(save_folder)

    anim_path = os.path.join(save_folder, clip_name + ".anim")

    # Get objects: use selection, or fall back to all transforms
    objects = cmds.ls(selection=True)
    if not objects:
        objects = cmds.ls(type="transform")
        if not objects:
            raise ValueError("No objects selected and no default objects found!")

    # Get time range (do not alter timeline)
    if start is None or end is None:
        start = cmds.playbackOptions(q=True, min=True)
        end = cmds.playbackOptions(q=True, max=True)

    # Create animation from objects
    anim = mutils.Animation.fromObjects(objects)

    # ✅ Set metadata one key-value pair at a time
    anim.setMetadata("name", clip_name)
    anim.setMetadata("description", "Saved via Python script")

    # Save animation
    anim.save(
        path=anim_path,
        time=(start, end),
        bakeConnected=True,
        fileType="mayaAscii"  # or "mayaBinary"
    )

    # Generate thumbnail
    thumbnail_path = os.path.join(anim_path, "thumbnail.jpg")
    cmds.playblast(
        frame=[start],
        format='image',
        filename=os.path.splitext(thumbnail_path)[0],
        width=220,
        height=130,
        viewer=False,
        offScreen=True,
        framePadding=0,
        compression='jpg',
        showOrnaments=False,
        quality=100
    )

    print(f"✅ Animation saved: {anim_path}")
    print(f"🖼️ Thumbnail saved: {thumbnail_path}")
    

# ===== Batch wrapper for your save_current_animation() =====

import traceback

def _clip_name_from_path(path):
    base = os.path.basename(path)
    name, _ = os.path.splitext(base)
    # убрать все ведущие '@' в начале имени
    name = name.lstrip('@')
    # чутка почистим имя от недопустимых символов
    cleaned = "".join(ch if ch.isalnum() or ch in ("_", "-", ".") else "_" for ch in name)
    # на всякий случай, если имя опустело
    return cleaned or "clip"


def _iter_ma_files(src_dir, recursive=True):
    if recursive:
        for root, _, files in os.walk(src_dir):
            for f in files:
                if f.lower().endswith(".ma"):
                    yield os.path.join(root, f)
    else:
        for f in os.listdir(src_dir):
            p = os.path.join(src_dir, f)
            if os.path.isfile(p) and f.lower().endswith(".ma"):
                yield p

def purge_flagged_scriptnodes():
    """Удаляет из сцены scriptNode'ы, которые вызывают Security Warning."""
    bad_markers = ("CgAbBlastPanelOptChangeCallback",)
    for sn in cmds.ls(type="script") or []:
        try:
            bs = cmds.getAttr(sn + ".beforeScript") or ""
        except Exception:
            bs = ""
        try:
            ascr = cmds.getAttr(sn + ".afterScript") or ""
        except Exception:
            ascr = ""
        if any(m in bs for m in bad_markers) or any(m in ascr for m in bad_markers):
            try:
                cmds.delete(sn)
                print("# Deleted scriptNode:", sn)
            except Exception:
                pass

def resolve_controls_any_namespace(ctrl_list):
    """
    Возвращает список реально существующих контролов из ctrl_list,
    независимо от namespace (ищем по коротким именам).
    """
    resolved = []
    for name in ctrl_list:
        short = name.split(':')[-1]
        # сперва точное имя, затем любой namespace:*:short
        found = cmds.ls(name) or cmds.ls("*:" + short) or cmds.ls(short)
        if found:
            # берём первый матч; можно расширить логикой, если нужно
            resolved.append(found[0])
        else:
            print("# WARN: control not found:", name)
    # Убираем дубли
    return sorted(set(resolved))

def safe_open_scene(scene_path):
    """Открыть сцену без выполнения скриптов и заглушить проблемный MEL коллбек."""
    # Заглушка на случай, если где-то всё же дернётся коллбек
    try:
        mel.eval('global proc CgAbBlastPanelOptChangeCallback(string $p) {}')
    except Exception:
        pass
    cmds.file(new=True, force=True)
    cmds.file(scene_path, o=True, force=True, esn=False)  # ключевое: не исполнять scriptNode
    purge_flagged_scriptnodes()

def merge_animation_layers(nodes=None, start=None, end=None, delete_layers=True):
    """
    Сводит (flatten) все animLayers в базовый слой:
      1) включает/размьючивает слои,
      2) бэйкает результирующую анимацию в ключи,
      3) по желанию удаляет все animLayer'ы.

    :param nodes: список объектов для бэйка. Если None — берём анимированные трансформы.
    :param start: кадр начала. Если None — берём min(frame) по ключам или playbackOptions.
    :param end: кадр конца. Если None — берём max(frame) по ключам или playbackOptions.
    :param delete_layers: True — удалить слои после бэйка.
    """
    layers = cmds.ls(type='animLayer') or []
    if not layers:
        print("# merge_animation_layers: no animLayers found — nothing to merge.")
        return

    # Если список объектов не задан — возьмём анимированные трансформы по анимкривым
    if not nodes:
        nodes = []
        anim_curves = cmds.ls(type=('animCurveTL','animCurveTA','animCurveTT','animCurveTU')) or cmds.ls(type='animCurve') or []
        if anim_curves:
            # найдём трансформы, к которым идут эти кривые
            con_nodes = cmds.listConnections(anim_curves, type='transform') or []
            nodes = sorted(set(con_nodes))
        if not nodes:
            # запасной вариант — все трансформы сцены
            nodes = cmds.ls(type='transform') or []
    if not nodes:
        print("# merge_animation_layers: no nodes to bake.")
        return

    # Диапазон кадров
    if start is None or end is None:
        # попробуем по ключам
        times = cmds.keyframe(nodes, q=True, tc=True) or []
        if times:
            start = int(min(times))
            end   = int(max(times))
        else:
            start = int(cmds.playbackOptions(q=True, min=True))
            end   = int(cmds.playbackOptions(q=True, max=True))

    # Снимем соло/мьют/лок на слоях, чтобы при бэйке учитывалась финальная смесь
    for l in layers:
        try:
            if cmds.animLayer(l, q=True, mute=True):
                cmds.animLayer(l, e=True, mute=False)
        except Exception:
            pass
        try:
            if cmds.animLayer(l, q=True, solo=True):
                cmds.animLayer(l, e=True, solo=False)
        except Exception:
            pass
        try:
            if cmds.animLayer(l, q=True, lock=True):
                cmds.animLayer(l, e=True, lock=False)
        except Exception:
            pass

    # Бэйк финального результата в базу
    bake_attrs = ["tx","ty","tz","rx","ry","rz","sx","sy","sz"]
    try:
        cmds.refresh(suspend=True)
        cmds.bakeResults(
            nodes,
            t=(start, end),
            at=bake_attrs,
            simulation=True,
            sampleBy=1,
            minimizeRotation=True,
            preserveOutsideKeys=False,
            disableImplicitControl=True,
            removeBakedAttributeFromLayer=False,  # важно: пишем в базовый слой
            bakeOnOverrideLayer=False,
            sparseAnimCurveBake=False
        )
    finally:
        cmds.refresh(suspend=False)

    # По желанию — удалить все слои
    if delete_layers and layers:
        try:
            cmds.delete(layers)
        except Exception:
            pass

    print(f"# merge_animation_layers: merged {len(layers)} layer(s) to base on {len(nodes)} node(s) [{start}-{end}].")

def _safe_set_members(s):
    """Безопасно вернуть участников сета (без flatten), не падая на ошибках Maya."""
    try:
        return cmds.sets(s, q=True) or []
    except Exception:
        return []

def _flatten_set(members):
    """Ручной flatten: разворачиваем вложенные objectSet'ы, игнорим битые ноды."""
    out, stack, seen = [], list(members), set()
    while stack:
        m = stack.pop()
        if not m or m in seen or not cmds.objExists(m):
            continue
        seen.add(m)
        try:
            if cmds.nodeType(m) == "objectSet":
                stack.extend(_safe_set_members(m))
            else:
                out.append(m)
        except Exception:
            # на всякий случай проглатываем странные типы
            pass
    return out

def _select_controls_from_controlset(set_name="ControlSet"):
    """
    Ищет сет ControlSet (без/с любым неймспейсом), выбирает всех его участников,
    фильтрует до DAG/трансформов и делает select. Возвращает список.
    """
    # кандидаты: "ControlSet" и "*:ControlSet"
    candidates = cmds.ls([set_name, "*:%s" % set_name], type="objectSet") or []
    # иногда куски рига могут создать дубликаты — уберём повторы и биты
    candidates = [c for c in dict.fromkeys(candidates) if cmds.objExists(c)]

    if not candidates:
        print("# WARNING: ControlSet не найден.")
        cmds.select(clear=True)
        return []

    # считаем размер через безопасный ручной flatten
    def _count(s):
        return len(_flatten_set(_safe_set_members(s)))
    
    control_set = max(candidates, key=_count)
    members = _flatten_set(_safe_set_members(control_set))
    cleaned = []
    for m in members:
        if not cmds.objExists(m):
            continue
        nt = cmds.nodeType(m)
        if nt in ("transform", "joint"):
            cleaned.append(m)
            continue
        parents = cmds.listRelatives(m, p=True, path=True) or []
        if parents:
            cleaned.append(parents[0])

    # финальная чистка + select
    cleaned = sorted(set(x for x in cleaned if cmds.objExists(x)))
    if cleaned:
        cmds.select(cleaned, r=True)
    else:
        print("# WARNING: ControlSet пустой.")
        cmds.select(clear=True)

    return cleaned

def _compute_time_range(objs=None):
    """Возвращает (start, end) по ключам объектов. Фоллбек — playbackOptions."""
    objs = objs or []
    # соберём тайминги с ключей
    times = []
    if objs:
        t = cmds.keyframe(objs, q=True, tc=True) or []
        if not t:
            # иногда ключи не висят прямо на трансформе. Поищем анимкривые через коннекшены
            curves = cmds.listConnections(objs, type=('animCurveTL','animCurveTA','animCurveTT','animCurveTU')) or []
            if curves:
                t = cmds.keyframe(curves, q=True, tc=True) or []
        times = t

    if times:
        start = int(min(times))
        end   = int(max(times))
        # чуть расширим рамки на 0–1 кадр, если нужно
        # start -= 0; end += 0
        return start, end

    # фоллбек — что у таймлайна сейчас выставлено
    return (
        int(cmds.playbackOptions(q=True, min=True)),
        int(cmds.playbackOptions(q=True, max=True)),
    )


def _patch_validate_anim_layers():
    """
    Патч для Studio Library: не падает, если в сцене нет animLayer'ов.
    """
    if cmds.about(q=True, batch=True):
        return

    try:
        animLayers = mel.eval('$gSelectedAnimLayers=$gSelectedAnimLayers')
    except Exception:
        animLayers = []

    if not animLayers:
        # нет слоёв — считаем, что всё ок
        return

    if len(animLayers) > 1:
        raise _MUTILS.animation.AnimationTransferError(
            "More than one animation layer is selected! "
            "Please select only one animation layer for export!"
        )

    if cmds.animLayer(animLayers[0], q=True, lock=True):
        raise _MUTILS.animation.AnimationTransferError(
            "Cannot export an animation layer that is locked! "
            "Please unlock the anim layer before exporting animation!"
        )

def batch_export_ma(source_dir, export_dir, recursive=True, use_current_selection=False):
    """
    Обходит все .ma и вызывает save_current_animation() на каждой.
    - source_dir: где искать .ma
    - export_dir: куда складывать .anim айтемы Studio Library
    - recursive: искать рекурсивно (подпапки)
    - use_current_selection: если False, перед экспортом очищаем выделение
    """
    if not os.path.exists(export_dir):
        os.makedirs(export_dir)

    report = []
    files = list(_iter_ma_files(source_dir, recursive=recursive))
    if not files:
        print(f"# No .ma files found in: {source_dir}")
        return

    print(f"# Found {len(files)} .ma file(s). Starting export...")

    for i, scene_path in enumerate(files, 1):
        print(f"\n[{i}/{len(files)}] # Opening: {scene_path}")
        try:
            # открыть сцену
            cmds.file(new=True, force=True)
            cmds.file(scene_path, o=True, force=True, esn=False)
            merge_animation_layers()
            

            # выбрать контролы
            if not use_current_selection:
                cmds.select(clear=True)
            _selected = _select_controls_from_controlset("ControlSet")

            # если ControlSet не найден — пропускаем
            if not _selected:
                print(f"# WARNING: No ControlSet in {scene_path}")
                continue

            # === определяем реальный диапазон кадров ===
            times = cmds.keyframe(_selected, q=True, tc=True) or []
            if times:
                start, end = int(min(times)), int(max(times))
            else:
                # fallback — берём таймлайн
                start = int(cmds.playbackOptions(q=True, min=True))
                end = int(cmds.playbackOptions(q=True, max=True))
            # Do not alter timeline range; keep original playback settings.

            # имя клипа
            clip_name = _clip_name_from_path(scene_path)

            # вызвать экспорт
            save_current_animation(export_dir, clip_name, start=start, end=end)
            write_scene_metadata(export_dir, clip_name, start, end)  # чтобы не забыть импорт
            print(f"# Exported: {clip_name} [{start}-{end}]")
            report.append((scene_path, "OK"))
        except Exception as e:
            print("# ERROR:", e)
            traceback.print_exc()
            report.append((scene_path, f"ERROR: {e}"))

    print("\n=== BATCH REPORT ===")
    for path, status in report:
        print(status, "->", path)

'''
SRC_DIR = "E:/Art/Characters/Races/SpaceMarine/SpaceMarine_Animation/Done/SpaceMarine_1H_Brutal/Attack"
DST_DIR = "C:/Users/OGFedoseeva/Documents/StudioLibrary_Anim/WH1_Anim/SpaceMarine/1H_Brutal/Attack"
batch_export_ma(SRC_DIR, DST_DIR, recursive=True, use_current_selection=False)
'''



