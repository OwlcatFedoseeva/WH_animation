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


def bake_wh2(start_frame, end_frame, rotate_set, translate_set, logger=None):
    rotJnts = cmds.sets(rotate_set, q=True) or []
    trJnts = cmds.sets(translate_set, q=True) or []

    if logger:
        logger.log("🟢 WH2: запекаем анимацию по наборам", color="green")

    if rotJnts:
        cmds.bakeResults(
            rotJnts,
            time=(start_frame, end_frame),
            sampleBy=1,
            simulation=True,
            disableImplicitControl=True,
            preserveOutsideKeys=True,
            sparseAnimCurveBake=False,
            removeBakedAttributeFromLayer=False,
            bakeOnOverrideLayer=False,
            at=["rx", "ry", "rz"]
        )
        if logger:
            logger.log(f"🔁 Запечена ротация для {len(rotJnts)} суставов", color="orange")

    if trJnts:
        cmds.bakeResults(
            trJnts,
            time=(start_frame, end_frame),
            sampleBy=1,
            simulation=True,
            disableImplicitControl=True,
            preserveOutsideKeys=True,
            sparseAnimCurveBake=False,
            removeBakedAttributeFromLayer=False,
            bakeOnOverrideLayer=False,
            at=["tx", "ty", "tz"]
        )
        if logger:
            logger.log(f"🔁 Запечена трансляция для {len(trJnts)} суставов", color="orange")

    # Очистка
    if logger:
        logger.log("✅ WH2: запекание завершено", color="green")



def wh2_cleanup(logger=None):
    obj = "Position"
    if not cmds.objExists(obj):
        cmds.warning(f"Object '{obj}' does not exist in the scene.")
        return

    cmds.select(obj, hi=True)
    to_keep = cmds.ls(sl=True, long=True)
    all_objects = cmds.ls(dag=True, long=True)
    to_delete = [o for o in all_objects if o not in to_keep]
    if to_delete:
        cmds.delete(to_delete)
        if logger:
            logger.log(f"Deleted {len(to_delete)} objects. Kept '{obj}' and its children.")


def smart_bake(start_frame, end_frame, logger=None):
    rotate_set = utils.find_set_by_suffix("Rotate_AnimSet")
    translate_set = utils.find_set_by_suffix("Translate_AnimSet")

    if rotate_set and translate_set:
        if logger:
            logger.log("🔁 Используем сеты Rotate/Translate для запекания", color="orange")
        bake_wh2(start_frame, end_frame, rotate_set, translate_set, logger=logger)
    else:
        if logger:
            logger.log("⚠️ Сеты не найдены. Используем fallback bake всей иерархии.", color="orange")
        all_joints = cmds.ls(type="joint", long=True)
        if not all_joints:
            cmds.warning("⚠️ Не найдено джойнтов для bake.")
            return
        cmds.bakeResults(
            all_joints,
            time=(start_frame, end_frame),
            sampleBy=1,
            simulation=True,
            disableImplicitControl=True,
            preserveOutsideKeys=True,
            sparseAnimCurveBake=False,
            removeBakedAttributeFromLayer=False,
            bakeOnOverrideLayer=False,
            at=["tx", "ty", "tz", "rx", "ry", "rz"]
        )

def run_wh2_export_pipeline(race: str, logger: UILogger, cleanup=False):
    """
    Выполняет экспорт пайплайна для WH2-проекта.
    """
    logger.log(f"📌 Запуск WH2 пайплайна для расы {race}")

    start_frame = int(cmds.playbackOptions(q=True, min=True))
    end_frame = int(cmds.playbackOptions(q=True, max=True))

    file_utils.imprtRef()
    file_utils.remove_namespaces()

    smart_bake(start_frame, end_frame, logger=logger)

    export_file_path = file_utils.generate_export_file_path(subfolder="Export", extension=".fbx")
 

    if cleanup:
        wh2_cleanup(logger=logger)

    cmds.select("Position", hi=True)
    cmds.file(export_file_path , force=True, options="v=0", type="FBX export", exportSelected=True)
    logger.log(f"✅ Экспорт завершён: {export_file_path }")
