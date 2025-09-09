import maya.cmds as cmds
import maya.mel as mel
import os

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

def export_fbx_for_unity(export_path, root_joint, logger=None):

    if not cmds.objExists(root_joint):
        cmds.error(f"Root joint '{root_joint}' not found in the scene.")
        return

    current_scene = cmds.file(q=True, sceneName=True)
    if current_scene == "":
        cmds.error("Please save the scene before exporting.")
        return

    all_joints = cmds.listRelatives(root_joint, allDescendents=True, type="joint") or []
    all_joints.append(root_joint)
    all_joints = list(set(all_joints))
    all_joints.sort(key=lambda j: cmds.getAttr(j + ".translateX"))

    start_frame = int(cmds.playbackOptions(q=True, min=True))
    end_frame = int(cmds.playbackOptions(q=True, max=True))


    mel.eval('FBXResetExport;')
    mel.eval('FBXExportUpAxis "y";')
    mel.eval('FBXExportConvertUnitString "cm";')
    mel.eval('FBXExportAnimationOnly -v false;')
    mel.eval('FBXExportSkins -v true;')
    mel.eval('FBXExportShapes -v true;')
    mel.eval('FBXExportConstraints -v false;')
    #mel.eval('FBXExportBakeComplexAnimation -v true;')
    mel.eval(f'FBXExportBakeComplexStart -v {start_frame};')
    mel.eval(f'FBXExportBakeComplexEnd -v {end_frame};')
    mel.eval('FBXExportBakeComplexStep -v 1;')
    mel.eval('FBXExportQuaternion -v "euler";')
    mel.eval('FBXExportUseSceneName -v false;')
    mel.eval('FBXExportInAscii -v false;')
    mel.eval('FBXExportApplyConstantKeyReducer -v false;')

    export_path = export_path.replace('\\', '/')

    if not os.path.exists(os.path.dirname(export_path)):
        os.makedirs(os.path.dirname(export_path))

    cmds.select(root_joint, hierarchy=True, replace=True)
    mel.eval(f'FBXExport -f "{export_path}" -s;')

    if logger:
        logger.log(f"✅ Анимация экспортирована: {export_path}")


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