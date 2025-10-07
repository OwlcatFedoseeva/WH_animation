import maya.cmds as cmds
import os
import maya.mel as mel
import importlib
import math

import OWL_Anim_ToolKit._logic.file_handling_utils as file_utils
import OWL_Anim_ToolKit._logic.bake_anim_utils as bake_anim_utils
import OWL_Anim_ToolKit._logic.utils as utils

importlib.reload(file_utils)
importlib.reload(bake_anim_utils)
importlib.reload(utils)


def _range_from_joints(joints):
    """Определяет диапазон кадров по ключам на переданных джойнтах.
    Если ключей нет — берёт текущие границы таймлайна.
    """
    times = cmds.keyframe(joints, q=True, tc=True) or []
    if times:
        start = int(math.floor(min(times)))
        end = int(math.ceil(max(times)))
    else:
        start = int(cmds.playbackOptions(q=True, min=True))
        end = int(cmds.playbackOptions(q=True, max=True))
    return start, end


def ensure_fps_30(logger=None):
    """Ставит 30 fps (Maya 'ntsc'). Возвращает прежнюю единицу времени."""
    cur = cmds.currentUnit(q=True, time=True)
    if cur != 'ntsc':  # 'ntsc' = 30 fps в Maya
        cmds.currentUnit(time='ntsc')
        if logger:
            logger.log(f"⏱ FPS выставлен в 30 (было: {cur})")
    return cur


def create_groups():
    """Создаёт (если нужно) служебные группы."""
    locs_GP = 'Locs' if cmds.objExists('Locs') else cmds.group(empty=True, n='Locs')
    to_del_GP = 'ToDel' if cmds.objExists('ToDel') else cmds.group(empty=True, n='ToDel')
    return locs_GP, to_del_GP


def create_locators_and_bake_animation(sel=None):
    """Делает копии-локаторы для исходного рига и БЭЙКАЕТ ТОЛЬКО ЛОКАТОРЫ."""
    top_locator = bake_anim_utils.get_top_level_locators()[0]
    cmds.select(top_locator)
    sel = cmds.ls(sl=True, fl=True)
    descendants = cmds.listRelatives(sel, ad=True) or []

    src_joints = []
    for i in descendants:
        if cmds.objectType(i) == 'joint' and "_ADJ" not in i:
            src_joints.append(i)

    locs_GP, to_del_GP = create_groups()

    locs_list = []
    for j in src_joints:
        new_name = j + '_Loc'
        loc = cmds.spaceLocator(n=new_name)[0]
        locs_list.append(loc)
        cmds.parent(loc, locs_GP)
        con = cmds.parentConstraint(j, loc, mo=False)
        cmds.parent(con, to_del_GP)

    # Диапазон анимации берём по исходным костям
    start, end = _range_from_joints(src_joints)

    # Явно указываем цели бэйка -> печётся ТОЛЬКО по локаторам
    cmds.bakeResults(
        locs_list,
        simulation=True, time=(start, end),
        sampleBy=1, disableImplicitControl=True,
        preserveOutsideKeys=True, sparseAnimCurveBake=False,
        removeBakedAttributeFromLayer=False, removeBakedAnimFromLayer=False,
        bakeOnOverrideLayer=False, minimizeRotation=True,
        at=["tx", "ty", "tz", "rx", "ry", "rz"]
    )

    return start, end, locs_list


def export_animation_to_fbx(start_frame, end_frame, fbx_path, logger=None):
    try:
        cmds.file(fbx_path, force=True, options="v=0", typ="FBX export", pr=True, es=True)
        if logger:
            logger.log(f"🎞 Анимация экспортирована в FBX: {fbx_path}")
    except Exception as e:
        cmds.error(f"❌ Ошибка при экспорте FBX: {e}")


def apply_parent_constraints_to_locators(logger=None):
    """Вешает parentConstraint от *_Loc на одноимённые кости (без maintain offset)."""
    locators = cmds.ls('*_Loc', type='transform') or []
    to_del_GP = 'ToDel' if cmds.objExists('ToDel') else cmds.group(empty=True, n='ToDel')

    for loc in locators:
        bone_name = loc.replace('_Loc', '')
        if cmds.objExists(bone_name) and cmds.objectType(bone_name) == 'joint':
            con = cmds.parentConstraint(loc, bone_name, mo=False)
            cmds.parent(con, to_del_GP)


def find_set_by_suffix(suffix):
    """Возвращает имя первого objectSet, оканчивающегося на suffix (учитывает неймспейсы)."""
    all_sets = cmds.ls(type="objectSet") or []
    for s in all_sets:
        if s.endswith(suffix):
            return s
    return None


def get_animation_range_for_selected_object():
    """Диапазон кадров по выделенным объектам (если нужно в отладке)."""
    selected_objects = cmds.ls(sl=True)
    if not selected_objects:
        cmds.error("Пожалуйста, выберите хотя бы один объект с анимацией.")
        return

    start = None
    end = None
    for obj in selected_objects:
        keyframes = cmds.keyframe(obj, query=True, timeChange=True)
        if keyframes:
            obj_start = min(keyframes)
            obj_end = max(keyframes)
            start = obj_start if start is None else min(start, obj_start)
            end = obj_end if end is None else max(end, obj_end)
        else:
            print(f"Для объекта '{obj}' не найдено ключевых кадров.")

    if start is None or end is None:
        cmds.error("Не удалось найти анимацию для выбранных объектов.")
    return start, end


def _basename(node):
    """Короткое имя узла без пути."""
    return node.split('|')[-1] if node else node


def bake_locators(start, end, logger=None):
    """Бэйк ЦЕЛЕВОГО СКЕЛЕТА по наборам:
       - Rotate_AnimSet -> только rx, ry, rz
       - Translate_AnimSet -> только tx, ty, tz
       Узел 'Position' исключается из бэйка на всякий случай.
    """
    if not cmds.objExists('Locs'):
        if logger:
            logger.log("❌ Group 'Locs' не найдена. Импортируй временный файл или запусти процесс заново.", color="red")
        return

    # Поиск сетов по суффиксу (с учётом возможных неймспейсов)
    rotate_set = find_set_by_suffix("Rotate_AnimSet")
    translate_set = find_set_by_suffix("Translate_AnimSet")

    if not (rotate_set and translate_set):
        if logger:
            logger.log("❌ Не удалось найти Rotate_AnimSet или Translate_AnimSet", color="red")
        return

    # Получаем содержимое сетов
    rot_members = cmds.sets(rotate_set, q=True) or []
    tr_members = cmds.sets(translate_set, q=True) or []

    # Фильтрация: оставляем только джойнты, исключаем 'Position', убираем дубли
    rot_joints = list({j for j in cmds.ls(rot_members, type="joint", long=True) or [] if _basename(j) != 'Position'})
    tr_joints = list({j for j in cmds.ls(tr_members, type="joint", long=True) or [] if _basename(j) != 'Position'})

    if logger:
        logger.log(f"🟣 Rotate_AnimSet: {len(rot_joints)} костей (будут запекаться только R)")
        logger.log(f"🟢 Translate_AnimSet: {len(tr_joints)} костей (будут запекаться только T)")

    # Бэйк по наборам: отдельно для ротейтов и транслейтов
    if rot_joints:
        cmds.bakeResults(
            rot_joints,
            simulation=True, time=(start, end),
            sampleBy=1, disableImplicitControl=True,
            preserveOutsideKeys=True, sparseAnimCurveBake=False,
            removeBakedAttributeFromLayer=False, removeBakedAnimFromLayer=False,
            bakeOnOverrideLayer=False, minimizeRotation=True,
            at=["rx", "ry", "rz"]
        )

    if tr_joints:
        cmds.bakeResults(
            tr_joints,
            simulation=True, time=(start, end),
            sampleBy=1, disableImplicitControl=True,
            preserveOutsideKeys=True, sparseAnimCurveBake=False,
            removeBakedAttributeFromLayer=False, removeBakedAnimFromLayer=False,
            bakeOnOverrideLayer=False, minimizeRotation=True,
            at=["tx", "ty", "tz"]
        )

    if logger:
        logger.log("✅ Бэйк целевого скелета по наборам завершён.")

def convert_process(race, gender, source_project, target_project, logger=None):
    if logger:
        logger.log("💡 Начата конвертация...")

    ensure_fps_30(logger)

    # Масштабируем топ-локатор перед созданием локаторов и их бэйком
    scale_factor = 100.0
    top_locator = bake_anim_utils.get_top_level_locators()[0]
    for axis in ('X', 'Y', 'Z'):
        cmds.setAttr(f"{top_locator}.scale{axis}", scale_factor)

    # 1) Бэйк только локаторов (копии исходных костей)
    start, end, locs_list = create_locators_and_bake_animation()
    # Удаляем только top_locator (служебный), локаторы остаются до финала пайплайна
    cmds.delete(top_locator)

    # 2) Импорт целевого скелета по правилам проекта
    USERAPPDIR = cmds.internalVar(userAppDir=True)
    module_dir = os.path.join(USERAPPDIR, 'scripts', 'OWL_Anim_ToolKit')

    if race == 'Human' and gender == 'M' and source_project == 'WHI' and target_project == 'WHII':
        import_file = os.path.join(module_dir, 'template_skeletons', f"{source_project}_{target_project}_{race}_{gender}.ma")
    elif race == 'Human' and gender == 'F' and source_project == 'WHI' and target_project == 'WHII':
        import_file = os.path.join(module_dir, 'template_skeletons', f"{source_project}_{target_project}_{race}_{gender}.ma")
    elif race == 'Eldar' and gender == 'M' and source_project == 'WHI' and target_project == 'WHII':
        import_file = os.path.join(module_dir, 'template_skeletons', f"{source_project}_{target_project}_{race}_{gender}.ma")
    else:
        import_file = None
        if logger:
            logger.log("❌ Не найден подходящий шаблон для импорта.", color="red")

    if import_file and os.path.exists(import_file):
        cmds.file(import_file, i=True, type="mayaAscii", ignoreVersion=True)
        if logger:
            logger.log(f"📥 Файл {import_file} успешно импортирован.")
    else:
        if logger:
            logger.log(f"❌ Ошибка: Файл {import_file} не найден или не соответствует требованиям.", color="red")

    # 3) Выставляем таймлайн, навешиваем констрейнты *_Loc -> целевые кости
    file_utils.set_timeline_from_joint_animation()
    apply_parent_constraints_to_locators(logger)

    # 4) Бэйк целевого скелета ТОЛЬКО по сетам (без глобального бэйка)
    bake_locators(start, end, logger)


    # 5) Финальная зачистка сцены
    del_obj = ['Locs', 'ToDel_GP', 'null1', 'Position', 'ToDel']
    for o in del_obj:
        if cmds.objExists(o):
            cmds.delete(o)
            
    file_utils.remove_namespaces()
    file_utils.delete_empty_display_layers()


    # 6) Экспорт в FBX
    scene_path = cmds.file(q=True, sn=True)
    scene_name = os.path.splitext(os.path.basename(scene_path))[0]
    if "@" in scene_name:
        scene_name = scene_name.replace("@", "_")

    export_dir = os.path.normpath(utils.ensure_export_folder(scene_path, logger))
    fbx_path = os.path.join(export_dir, f"{scene_name}.fbx")
    root_joint = 'Position' 
    cmds.playbackOptions(min=start, max=end)
    ensure_fps_30(logger)
    utils.export_fbx_for_unity(fbx_path, root_joint, logger)

