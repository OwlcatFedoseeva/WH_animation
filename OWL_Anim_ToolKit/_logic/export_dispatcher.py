import os
from maya import cmds
import importlib
import OWL_Anim_ToolKit._logic.animation_bake_wh1 as wh1_export
import OWL_Anim_ToolKit._logic.animation_bake_wh2 as wh2_export
from OWL_Anim_ToolKit._logic.animation_bake_wh1 import PROJECT_DATA_DIR
from _logic.logging_process import UILogger

importlib.reload(wh1_export)
importlib.reload(wh2_export)


def get_joint_list_path(race: str) -> str:
    """
    Формирует путь к JSON-файлу со списком джойнтов на основе имени расы.
    """
    filename = f"bake_transl_jnts_list_{race.lower()}.json"
    return os.path.join(PROJECT_DATA_DIR, filename)

def dispatch_export(project: str, race: str, logger):
    """
    Главная функция маршрутизации экспорта по проекту и расе.
    """
    if logger is None:
        raise ValueError("❌ logger не передан в dispatch_export")
    
    project = project.upper()
    race = race.capitalize()

    logger.log(f"📦 Запущен экспорт: Проект = {project}, Раса = {race}")

    if project == "WH1":
        joint_list_path = get_joint_list_path(race)
        wh1_export.run_wh1_export_pipeline(race=race, joint_list_path=joint_list_path, logger=logger)


    elif project == "WH2":
        # Заготовка — WH2 будет реализован по аналогии с WH1
        wh2_export.run_wh2_export_pipeline(race=race, logger=logger)


    else:
        raise ValueError(f"Проект '{project}' не поддерживается.")
