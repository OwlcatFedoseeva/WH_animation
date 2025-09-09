import maya.cmds as cmds
import maya.mel as mel
import os
import json
import importlib

import OWL_Anim_ToolKit._logic.file_handling_utils as file_utils
import OWL_Anim_ToolKit._logic.bake_anim_utils as bake_anim_utils
import OWL_Anim_ToolKit._logic.utils as utils

importlib.reload(bake_anim_utils)
importlib.reload(file_utils)
importlib.reload(utils)
from _logic.logging_process import UILogger

USERAPPDIR = cmds.internalVar(userAppDir=True)
BASE_DIR = os.path.normpath(os.path.join(USERAPPDIR, 'scripts', 'OWL_Anim_ToolKit'))
PROJECT_DATA_DIR = os.path.join(BASE_DIR, 'project_data')

presetPathName = os.path.join(PROJECT_DATA_DIR, 'UMA_Male_Rig_AnimationExport.fbxexportpreset')


def bake_wh1_animation(race=None, json_jnt_list=None, json_jnt_list_path=None, logger=None):
    if json_jnt_list is None:
        if json_jnt_list_path:
            with open(json_jnt_list_path, 'r') as f:
                json_jnt_list = json.load(f)
        else:
            raise ValueError("❌ Не указан ни json_jnt_list, ни json_jnt_list_path")

    bake_transl_jnts = json_jnt_list 
    cmds.select(clear=True)
    if not cmds.objExists('Pelvis'):
        raise RuntimeError("❌ Джойнт 'Pelvis' не найден в сцене.")

    cmds.select('Pelvis', hi=True)
    allSelected = cmds.ls(sl=True)

    startTime = cmds.playbackOptions(query=True, minTime=True)
    endTime = cmds.playbackOptions(query=True, maxTime=True)

    cmds.bakeResults(allSelected, simulation=True, t=(startTime, endTime), at=['translate','rotate'])

    valid_joints = [jnt for jnt in bake_transl_jnts if cmds.objExists(jnt)]

    missing_joints = [jnt for jnt in bake_transl_jnts if not cmds.objExists(jnt)]
    for jnt in missing_joints:
        if logger:
            logger.log(f"[WARNING] Джойнт не найден: {jnt}", color="orange")

    if valid_joints:
        cmds.select(clear=True)
        cmds.select(valid_joints)
        cmds.bakeResults(valid_joints, simulation=True, t=(startTime, endTime), at=['translate', 'rotate'])

        if logger:
            logger.log(f"[INFO] Бэйк выполнен для {len(valid_joints)} джойнтов.")
    else:
        if logger:
            logger.log("[INFO] Нет валидных джойнтов для запекания.")

    for temp_node in ['Group']:
        if cmds.objExists(temp_node):
            cmds.delete(temp_node)

    if not cmds.objExists('ParentForExportDelete'):
        cmds.spaceLocator(name='ParentForExportDelete')

    if cmds.objExists('UMA_Male_Rig'):
        cmds.parent('UMA_Male_Rig', 'ParentForExportDelete')

    for node in ['ParentForExportDelete', 'UMA_Male_Rig', 'Global', 'Position']:
        if cmds.objExists(node):
            cmds.cutKey(node)

    attrs = {
        'ParentForExportDelete': (0, 0, 0),
        'UMA_Male_Rig': (-90, 0, 0),
        'Global': (90, -90, 0),
        'Position': (0, 0, 0)
    }

    for node, (rx, ry, rz) in attrs.items():
        if cmds.objExists(node):
            cmds.setAttr(f'{node}.rotateX', rx)
            cmds.setAttr(f'{node}.rotateY', ry)
            cmds.setAttr(f'{node}.rotateZ', rz)


    bake_anim_utils.cleanUp(race=race, logger=logger)
    export_wh1_to_fbx(logger)

def export_wh1_to_fbx(logger=None):
    '''
    This function for export of Human| Eldar| SpaceMarine characters as FBX file into a designated location in UI.
    '''
    if logger is None:
        logger = UILogger()

    export_file_path = file_utils.generate_export_file_path(subfolder="Export", extension=".fbx")
    objects_to_check = ['ParentForExportDelete', 'Root_M', 'Position']
    root_joint = None
    for obj in objects_to_check:
        if cmds.objExists(obj):
            cmds.select(obj)
            logger.log(f"🔄 Root joint selected: {obj}", color="blue")
            root_joint = obj
            break

    if not root_joint:
        logger.log("❌ Root joint not found. Экспорт FBX отменён.", color="red")
        return

    file_utils.delete_empty_display_layers(logger=logger)
    utils.export_fbx_for_unity(export_file_path, root_joint, logger=logger)
    logger.log("FBX file exported to: {}".format(export_file_path))



def run_wh1_export_pipeline(race: str, joint_list=None, joint_list_path=None, logger=None):
    if joint_list is None and joint_list_path is None:

        RACE_JSON_MAP = {
            "Human": "bake_transl_jnts_list_human.json",
            "Eldar": "bake_transl_jnts_list_human.json",
            "Spacemarine": "bake_transl_jnts_list_spacemarine.json"
        }
        filename = RACE_JSON_MAP.get(race)
        if not filename:
            raise ValueError(f"Unknown race '{race}'")
        joint_list_path = os.path.join(PROJECT_DATA_DIR, filename)

    if logger:
        logger.log("🔄 Baking animation from Pelvis...", color="blue")

    file_utils.imprtRef()
    file_utils.remove_namespaces()

    bake_wh1_animation(race=race, json_jnt_list=joint_list, json_jnt_list_path=joint_list_path, logger=logger)
