import maya.cmds as cmds
import maya.mel as mel
import os
import json
import importlib
import OWL_Anim_ToolKit._logic.bake_anim_utils as bake_anim_utils
import OWL_Anim_ToolKit._logic.clear_unwanted_anim_logic as CleanAnimLogic
import OWL_Anim_ToolKit._logic.file_handling_utils as file_handling_utils
import OWL_Anim_ToolKit._logic.scale_anim as scale_anim_utils
import _logic.logging_process as logging_process

importlib.reload(bake_anim_utils)
importlib.reload(CleanAnimLogic)
importlib.reload(file_handling_utils)
importlib.reload(logging_process)

from _logic.logging_process import UILogger

def save_anim_metadata(json_path, start_frame, end_frame, fps, bones_HB2, logger=None):

    if logger is None:
        logger = UILogger()

    anim_data = {
        "start_frame": start_frame,
        "end_frame": end_frame,
        "fps": fps,
        "bones_HB2": bones_HB2
    }
    try:
        with open(json_path, "w") as f:
            json.dump(anim_data, f, indent=4)
        logger.log(f"📄 JSON saved: {json_path}")
    except Exception as e:
        cmds.error(f"❌ Error saving JSON: {e}")


def scale_translate_keys(joint_list, scale_factor=100.0):
    '''Умножает ключи translateX/Y/Z на указанный коэффициент во всех переданных костях.'''
    if logger is None:
        logger = UILogger()

    for joint in joint_list:
        for attr in ['translateX', 'translateY', 'translateZ']:
            keyframes = cmds.keyframe(joint, attribute=attr, query=True)
            if keyframes:
                for frame in keyframes:
                    val = cmds.getAttr(f"{joint}.{attr}", time=frame)
                    cmds.setKeyframe(joint, time=frame, attribute=attr, value=val * scale_factor)


def export_animation_to_json(joint_list, start_frame, end_frame, fps, output_path, logger=None):

    if logger is None:
        logger = UILogger()

    data = {
        "fps": fps,
        "start_frame": start_frame,
        "end_frame": end_frame,
        "joints": {}
    }

    for joint in joint_list:
        short_name = joint.split('|')[-1]
        joint_data = {}
        for attr in ["translateX", "translateY", "translateZ", "rotateX", "rotateY", "rotateZ"]:
            values = []
            for frame in range(int(start_frame), int(end_frame) + 1):
                val = cmds.getAttr(f"{joint}.{attr}", time=frame)
                values.append({"frame": frame, "value": val})
            if values:
                joint_data[attr] = values

        data["joints"][short_name] = joint_data

    with open(output_path, 'w') as f:
        json.dump(data, f, indent=4)
    logger.log(f"✅ Экспортировано в JSON: {output_path}")

def export_animation_to_fbx(joint_list, start_frame, end_frame, fbx_path, logger=None):

    if logger is None:
        logger = UILogger()

    # Экспорт FBX
    cmds.select(joint_list, hierarchy=True)
    try:
        cmds.file(fbx_path, force=True, options="v=0", typ="FBX export", pr=True, es=True)
        logger.log(f"🎞 Анимация экспортирована в FBX: {fbx_path}")
    except Exception as e:
        cmds.error(f"❌ Ошибка при экспорте FBX: {e}")

def prepare_anim_data_for_transfer(source_project, target_project, race, gender, root_joint="Pelvis", logger=None):
    '''
    Подготовка анимации: bake, масштаб, чистка, экспорт JSON (метаданных), экспорт FBX.
    '''

    if logger is None:
        logger = UILogger()

    scene_path = cmds.file(q=True, sn=True)
    if not scene_path:
        cmds.error("Сначала сохраните текущую сцену!")

    USERAPPDIR = cmds.internalVar(userAppDir=True)
    module_dir = os.path.join(USERAPPDIR, 'scripts', 'OWL_Anim_ToolKit')
    temp_dir = os.path.normpath(os.path.join(module_dir, "temp"))
    if not os.path.exists(temp_dir):
        os.makedirs(temp_dir)

    scene_name = os.path.splitext(os.path.basename(scene_path))[0]
    json_name = f"temp_{scene_name}.json"
    json_path = os.path.join(temp_dir, json_name)
    fbx_path = os.path.join(temp_dir, f"temp_{scene_name}.fbx")

    start = cmds.playbackOptions(q=True, min=True)
    end = cmds.playbackOptions(q=True, max=True)
    fps = mel.eval('currentUnit -q -time')

    # Bake и подготовка
    file_handling_utils.delete_non_reference_objects()
    file_handling_utils.imprtRef()
    file_handling_utils.remove_namespaces()
    bake_anim_utils.group_constraints_under_joint(root_joint="Pelvis")
    bake_anim_utils.bake_animation_from_root(root_joint, start, end)

    # Очистка ключей и входящих соединений на scale
    objects_to_clean = cmds.listRelatives("Pelvis", ad=True, fullPath=True) or []
    objects_to_clean.append("Pelvis")
    attrs_to_remove = ["scaleX", "scaleY", "scaleZ"]
    bake_anim_utils.clear_keys_and_disconnect(objects_to_clean, attrs_to_remove)

    file_handling_utils.delete_non_joint_non_locator_transforms()
    scale_anim_utils.run_scale()
    bake_anim_utils.clean_keys_for_race(race)
    bake_anim_utils.cleanUp_no_key()

    # Экспорт только метаданных
    anim_info = {
        "start_frame": start,
        "end_frame": end,
        "fps": fps
    }
    with open(json_path, "w") as f:
        json.dump(anim_info, f, indent=4)
    logger.log(f"📄 Экспортированы метаданные: {json_path}")

    # Экспорт FBX
    export_animation_to_fbx("Position", start, end, fbx_path)
    return json_path, fbx_path, scene_path, scene_name


def setup_scene_from_json(json_path, logger=None):
    '''Настраивает fps и диапазон кадров на основе JSON файла.'''

    if logger is None:
        logger = UILogger()

    if not os.path.exists(json_path):
        cmds.error(f"❌ Файл не найден: {json_path}")

    with open(json_path, "r") as f:
        data = json.load(f)

    # Установка FPS
    fps_map = {
        "game": "game", "film": "film", "pal": "pal", "ntsc": "ntsc",
        "show": "show", "palf": "palf", "ntscf": "ntscf",
        "23.976fps": "23.976", "24fps": "24", "25fps": "25",
        "30fps": "30", "50fps": "50", "60fps": "60"
    }

    fps = data.get("fps", "pal")
    mel.eval(f'currentUnit -time "{fps_map.get(fps, fps)}";')

    # Установка диапазона кадров
    start = data.get("start_frame", 1)
    end = data.get("end_frame", 24)
    cmds.playbackOptions(min=start, max=end)
    cmds.playbackOptions(animationStartTime=start, animationEndTime=end)

    logger.log(f"🎬 Сцена настроена: fps = {fps}, кадры {start} - {end}")

    return start, end


def import_animation_from_json(json_path, logger=None):
    '''Импортирует анимацию из JSON-файла и применяет ключи к соответствующим костям.'''

    if logger is None:
        logger = UILogger()

    if not os.path.exists(json_path):
        cmds.error(f"❌ Файл не найден: {json_path}")

    with open(json_path, "r") as f:
        data = json.load(f)

    joints_data = data.get("joints", {})
    for joint_name, attrs in joints_data.items():
        if not cmds.objExists(joint_name):
            logger.log(f"⚠️ Кость '{joint_name}' не найдена в сцене, пропускаем.")
            continue

        for attr, frames in attrs.items():
            for frame_data in frames:
                frame = frame_data["frame"]
                value = frame_data["value"]
                try:
                    cmds.setKeyframe(joint_name, time=frame, attribute=attr, value=value)
                except Exception as e:
                    logger.log(f"❌ Ошибка установки ключа: {joint_name}.{attr} на кадре {frame}: {e}")
    logger.log("✅ Анимация из JSON успешно применена.")

def get_template_path(source, target, race, gender, logger=None):

    if logger is None:
        logger = UILogger()

    USERAPPDIR = cmds.internalVar(userAppDir=True)
    module_dir = os.path.join(USERAPPDIR, 'scripts', 'OWL_Anim_ToolKit')
    filename = f"{source}_{target}_{race}_{gender}.ma"
    logger.log(module_dir)
    path = os.path.normpath(os.path.join(module_dir, "template_skeletons", filename))
    logger.log(path)
    return path

def load_template_and_apply_animation(source, target, race, gender, logger=None):
    """
    Создаёт новую сцену, импортирует шаблонный .ma файл, применяет к нему временный FBX,
    запекает ключи и экспортирует итоговый результат рядом с исходным файлом.
    """

    if logger is None:
        logger = UILogger()

    template_path = get_template_path(source, target, race, gender)
    USERAPPDIR = cmds.internalVar(userAppDir=True)
    temp_dir = os.path.normpath(os.path.join(USERAPPDIR, "scripts", "OWL_Anim_ToolKit", "temp"))

    original_scene_path = cmds.file(q=True, sn=True)
    if not original_scene_path:
        cmds.error("Сначала сохраните текущую сцену!")

    scene_name = os.path.splitext(os.path.basename(original_scene_path))[0]
    json_path = os.path.join(temp_dir, f"temp_{scene_name}.json")
    fbx_path = os.path.join(temp_dir, f"temp_{scene_name}.fbx")

    if not os.path.exists(template_path):
        cmds.error(f"❌ Template file not found: {template_path}")
    if not os.path.exists(json_path):
        cmds.error(f"❌ JSON file not found: {json_path}")
    if not os.path.exists(fbx_path):
        cmds.error(f"❌ FBX file not found: {fbx_path}")

    # Создание новой сцены
    cmds.file(new=True, force=True)
    logger.log("📄 Создана новая сцена.")

    try:
        cmds.file(template_path, i=True, ignoreVersion=True, pr=True)
        logger.log(f"📦 Импортирован шаблон: {template_path}")
    except Exception as e:
        cmds.error(f"❌ Ошибка при импорте шаблона: {e}")

    start, end = setup_scene_from_json(json_path)

    try:
        cmds.file(fbx_path, i=True, type="FBX", ignoreVersion=True, pr=True)
        logger.log(f"🎞 Импортирована временная анимация: {fbx_path}")
    except Exception as e:
        cmds.error(f"❌ Ошибка при импорте FBX: {e}")

    rotate_set = cmds.ls("*:Rotate_AnimSet", "Rotate_AnimSet")
    translate_set = cmds.ls("*:Translate_AnimSet", "Translate_AnimSet")

    bake_anim_utils.bake_wh2(start, end, rotate_set, translate_set)

    todel = ['ToDel_GP','null1', 'Position']

    for o in todel:
        if cmds.objExists(o):
            logger.log("Deleteing: " + o)
            cmds.delete(o)

        else:
            continue

    logger.log("✅ Ключи успешно запеканы.")

    file_handling_utils.remove_namespaces()
    file_handling_utils.delete_empty_display_layers()
    export_dir = os.path.dirname(original_scene_path)
    export_name = scene_name.replace("@", "_") + ".fbx"
    export_path = os.path.join(export_dir, export_name)

    cmds.select("Position", hierarchy=True)
    try:
        cmds.file(export_path, force=True, options="v=0", typ="FBX export", pr=True, es=True)
        logger.log(f"✅ Финальная анимация экспортирована: {export_path}")
    except Exception as e:
        cmds.error(f"❌ Ошибка при экспорте финального FBX: {e}")

    logger.log("✅ Анимация успешно применена к шаблону.")

def convert_from_existing_fbx(race, gender, source_project, target_project, logger=None):
    if logger is None:
        logger = UILogger()
    scene_path = cmds.file(q=True, sn=True)
    if not scene_path:
        cmds.error("Сначала сохраните текущую сцену!")

    USERAPPDIR = cmds.internalVar(userAppDir=True)
    module_dir = os.path.join(USERAPPDIR, 'scripts', 'OWL_Anim_ToolKit')
    temp_dir = os.path.normpath(os.path.join(module_dir, "temp"))
    if not os.path.exists(temp_dir):
        os.makedirs(temp_dir)

    scene_name = os.path.splitext(os.path.basename(scene_path))[0]
    json_name = f"temp_{scene_name}.json"
    json_path = os.path.join(temp_dir, json_name)
    fbx_path = os.path.join(temp_dir, f"temp_{scene_name}.fbx")

    start = cmds.playbackOptions(q=True, min=True)
    end = cmds.playbackOptions(q=True, max=True)
    fps = mel.eval('currentUnit -q -time')

    file_handling_utils.imprtRef()
    file_handling_utils.remove_namespaces()
    bake_anim_utils.group_constraints_under_joint(root_joint="Pelvis")
    file_handling_utils.delete_non_joint_non_locator_transforms()
    scale_anim_utils.run_scale()
    bake_anim_utils.clean_keys_for_race(race)
    bake_anim_utils.cleanUp_no_key()

    anim_info = {
        "start_frame": start,
        "end_frame": end,
        "fps": fps
    }
    with open(json_path, "w") as f:
        json.dump(anim_info, f, indent=4)
    logger.log(f"\U0001F4C4 Экспортированы метаданные: {json_path}")

    export_animation_to_fbx("Position", start, end, fbx_path)

    start, end = setup_scene_from_json(json_path)
    import_animation_from_json(json_path)
    load_template_and_apply_animation(source_project, target_project, race, gender)

    return json_path, fbx_path, scene_path, scene_name