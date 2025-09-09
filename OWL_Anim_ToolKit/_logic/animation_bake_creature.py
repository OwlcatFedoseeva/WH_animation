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

def rig_scale_check(logger=None):
    candidates = cmds.ls("*:Main", "Main", type="transform")

    if not candidates:
        cmds.warning("Не найден контрол с именем 'Main' ни в одном неймспейсе.")
        return False

    main_ctrl = None

    for candidate in candidates:
        if candidate.endswith(':Main') or candidate == 'Main':
            main_ctrl = candidate
            break

    if not main_ctrl:
        cmds.warning("Контрол 'Main' найден, но не соответствует условиям.")
        return False

    if logger:
        logger.log(f"Главный контрол: {main_ctrl}")
    scale = cmds.getAttr(main_ctrl + ".scale")[0]
    
    if not all(abs(s - 1.0) < 0.001 for s in scale):
        cmds.confirmDialog(
            title='Ошибка масштаба',
            message=f'У главного контрола {main_ctrl} scale не равен 1.\nТекущий scale: {scale}. Верните его к базовой настройке и попробуйте экспорт еще.',
            button=['OK'],
            defaultButton='OK',
            icon='critical'
        )
        return False
    return True


def simple_creature_anim_bake(logger=None):
    
    if cmds.objExists('Position'):
        root_jnt = 'Position'
        if logger:
            logger.log('✅ Found Position Joint', color="green")
    else:
        if logger:
            logger.log('⚠️ No Position joint found. Creating one...', color="yellow")
        cmds.select(cl=True)
        root_jnt = cmds.joint(n='Position')
        if cmds.objExists('Root_M'):
            cmds.parent('Root_M', root_jnt)
        if logger:
            logger.log('✅ Created Position joint', color="green")
    
    start_time = cmds.playbackOptions(query=True, minTime=True)
    end_time = cmds.playbackOptions(query=True, maxTime=True)
    if logger:
        logger.log(f"Start frame: {start_time}, End Frame: {end_time}")

    cmds.select(root_jnt, hi=True)
    jnt_list = cmds.ls(sl=True, fl=True)
    if root_jnt in jnt_list:
        jnt_list.remove(root_jnt)
    
    if jnt_list:
        cmds.bakeResults(jnt_list, simulation=True, t=(start_time, end_time),
                         at=['translate', 'rotate', 'scale'])
        if logger:
            logger.log(f"✅ Bake complete", color="green")
    else:
        if logger:
            logger.log("❌ No joints found to bake", color="red")

    cmds.parent(root_jnt, world=True)
    to_delete = ['Group']
    
    for obj in to_delete:
        if cmds.objExists(obj):
            cmds.delete(obj)

    return root_jnt
        

def prep_for_export(logger=None, update_progress=None):
    if update_progress:
        update_progress(5)

    ref_paths = cmds.file(q=True, reference=True) or []
    if ref_paths:
        file_utils.imprtRef()
    else:
        if logger:
            logger.log("ℹ️ Нет внешних ссылок (references) в сцене.", color="blue")

    if update_progress:
        update_progress(15)

    all_namespaces = [x for x in cmds.namespaceInfo(listOnlyNamespaces=True, recurse=True)
                      if x not in ("UI", "shared")]
    if all_namespaces:
        file_utils.remove_namespaces()
    else:
        if logger:
            logger.log("ℹ️ В сцене нет дополнительных namespace-ов.", color="blue")

    if update_progress:
        update_progress(25)

    if not rig_scale_check(logger=logger):
        if logger:
            logger.log("⛔ Остановка экспорта из-за ошибки масштаба.", color="red")
        return

    if update_progress:
        update_progress(40)

    simple_creature_anim_bake(logger=logger)

    if update_progress:
        update_progress(70)

    export_file_path = file_utils.generate_export_file_path(subfolder="Export", extension=".fbx")
    
    
    jnt_list = ['Position', 'Root_M']

    for j in jnt_list:
        if cmds.objExists(j):
            cmds.setAttr(j + ".visibility", 1)
        else:
            pass
    
    cmds.select("Position", hi=True)
    cmds.file(export_file_path, force=True, options="v=0", type="FBX export", exportSelected=True)

    if logger:
        logger.log(f"✅ Экспорт завершён: {export_file_path}")

    if update_progress:
        update_progress(100)

    return export_file_path