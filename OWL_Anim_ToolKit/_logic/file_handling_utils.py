import maya.cmds as cmds
import importlib
import os
import _logic.logging_process as logging_process

importlib.reload(logging_process)
from _logic.logging_process import UILogger
logger = UILogger()

def remove_namespaces(logger=None):
    '''Removes all non-default namespaces.'''
    if logger is None:
        logger = globals().get("logger", UILogger())

    all_namespaces = [x for x in cmds.namespaceInfo(listOnlyNamespaces=True, recurse=True)
                      if x not in ("UI", "shared")]
    all_namespaces.sort(key=len, reverse=True)
    for ns in all_namespaces:
        if cmds.namespace(exists=ns):
            cmds.namespace(removeNamespace=ns, mergeNamespaceWithRoot=True)
    logger.log("Removed namespaces.")

def imprtRef(logger=None):
    '''Imports all referenced instances into the scene.'''
    if logger is None:
        logger = globals().get("logger", UILogger())

    all_ref_paths = cmds.file(q=True, reference=True) or []
    for ref_path in all_ref_paths:
        if cmds.referenceQuery(ref_path, isLoaded=True):
            cmds.file(ref_path, importReference=True)
            new_ref_paths = cmds.file(q=True, reference=True)
            if new_ref_paths:
                for new_ref_path in new_ref_paths:
                    if new_ref_path not in all_ref_paths:
                        all_ref_paths.append(new_ref_path)
    logger.log('Imported all references.')

def delete_non_reference_objects(logger=None):
    '''Удаляет все объекты, которые не принадлежат ни одному референсу.'''
    if logger is None:
        logger = globals().get("logger", UILogger())
    all_transforms = cmds.ls(type='transform', long=True)
    for node in all_transforms:
        # Пропускаем корневые элементы интерфейса
        if node in ['|persp', '|top', '|front', '|side']:
            continue

        try:
            if not cmds.referenceQuery(node, isNodeReferenced=True):
                cmds.delete(node)
        except:
            continue  # безопасно игнорируем ошибки на случай нестабильных нод
    logger.log("🗑️ Удалены все объекты, не входящие в референсы.")

def delete_non_joint_non_locator_transforms(logger=None):
    '''Удаляет все transform-ноды, кроме суставов (joint), локаторов (locator) и камер (camera).'''

    if logger is None:
        logger = globals().get("logger", UILogger())

    all_transforms = cmds.ls(type="transform", long=True) or []
    for node in all_transforms:
        if not cmds.objExists(node):
            continue

        # Пропускаем кости
        if cmds.nodeType(node) == "joint":
            continue

        shapes = cmds.listRelatives(node, shapes=True, fullPath=True) or []
        shape_types = [cmds.nodeType(s) for s in shapes if cmds.objExists(s)]

        # Пропускаем локаторы и камеры
        if "locator" in shape_types or "camera" in shape_types:
            continue

        try:
            cmds.delete(node)
        except Exception:
            pass

    logger.log("🧹 Удалены все трансформы, кроме костей, локаторов и камер.")
def delete_empty_display_layers(logger=None):

    if logger is None:
        logger = globals().get("logger", UILogger())

    all_layers = cmds.ls(type="displayLayer")
    all_layers = [layer for layer in all_layers if layer != "defaultLayer"]
    for layer in all_layers:
        objects_in_layer = cmds.editDisplayLayerMembers(layer, query=True) or []
        if not objects_in_layer:
            cmds.delete(layer)
            logger.log(f"Deleted empty display layer: {layer}")

def set_timeline_from_joint_animation(logger=None):

    if logger is None:
        logger = globals().get("logger", UILogger())

    joints = cmds.ls(type='joint')
    if not joints:
        cmds.warning("⚠️ В сцене не найдено костей.")
        return

    min_frame = None
    max_frame = None

    for joint in joints:
        key_times = cmds.keyframe(joint, query=True, timeChange=True)
        if key_times:
            joint_min = min(key_times)
            joint_max = max(key_times)
            min_frame = joint_min if min_frame is None else min(min_frame, joint_min)
            max_frame = joint_max if max_frame is None else max(max_frame, joint_max)

    if min_frame is not None and max_frame is not None:
        cmds.playbackOptions(min=min_frame, max=max_frame)
        cmds.playbackOptions(animationStartTime=min_frame, animationEndTime=max_frame)
        logger.log(f"✅ Таймлайн установлен: {min_frame} - {max_frame}")
    else:
        cmds.warning("⚠️ Не найдено ключей анимации у костей.")

def generate_export_file_path(subfolder="Export", extension=".fbx") -> str:
    """
    Генерирует путь для сохранения экспортируемого файла.
    Путь: <текущая_сцена>/Export/<имя_сцены>.fbx
    """
    file_path = cmds.file(query=True, sceneName=True)
    if not file_path:
        raise RuntimeError("Сцена не сохранена. Сначала нужно сохранить .ma файл.")

    directory = os.path.dirname(file_path)
    folder_path = os.path.join(directory, subfolder)

    if not os.path.exists(folder_path):
        os.makedirs(folder_path)

    base_name = os.path.splitext(os.path.basename(file_path))[0]
    base_name = base_name.replace("@", "_") if "@" in base_name else base_name

    return os.path.join(folder_path, base_name + extension)