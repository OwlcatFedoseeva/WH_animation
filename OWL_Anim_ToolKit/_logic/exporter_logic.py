import os
import maya.cmds as cmds
from PySide2 import QtCore
from .project_loader import get_project_data
from .bake_anim_utils import bake_animation_for_project
from _logic.logging_process import UILogger
import OWL_Anim_ToolKit._logic.export_dispatcher as export_dispatcher

def export_current(ui, logger, update_progress=None):
    """
    Запускает экспорт анимации на основе выбранного проекта и расы.
    Получает значения из UI и передаёт в маршрутизатор экспорта.
    """
    if logger is None:
        logger = UILogger()
    try:
        # Получаем выбранные проект и расу из комбобоксов
        project = ui.combobox_project.currentText()
        race = ui.combobox_race.currentText().lower()

        # Импорт диспетчера экспорта и запуск соответствующего пайплайна
        if update_progress:
            update_progress(0)
        export_dispatcher.dispatch_export(project=project, race=race, logger=logger)
        
        if update_progress:
            update_progress(100)

    except AttributeError as e:
        raise RuntimeError(f"[Exporter] ❌ Ошибка доступа к элементам UI: {e}")
    except Exception as e:
        raise RuntimeError(f"[Exporter] ❌ Не удалось запустить экспорт: {e}")


def export_animation(ui, start_frame, end_frame, project, export_dir, clip_index=None):
    bake_animation_for_project(project, start_frame, end_frame)

    scene_name = cmds.file(q=True, sceneName=True, shortName=True)
    name_no_ext = os.path.splitext(scene_name)[0]
    suffix = f"_{clip_index}" if clip_index is not None else ""
    export_file = os.path.join(export_dir, f"{name_no_ext}_{int(start_frame)}-{int(end_frame)}{suffix}.fbx")

    # TODO: вызвать реальный экспорт
    print(f"[EXPORT] Exported animation to: {export_file}")

def create_frame_range_comboboxes(ui):
    frame_ranges = []
    for frame_pair in ui.frame_range_comboboxes:
        start_field, end_field = frame_pair
        try:
            start = int(start_field.text())
            end = int(end_field.text())
            if start <= end:
                frame_ranges.append((start, end))
            else:
                print(f"Invalid range: {start} > {end}")
        except ValueError:
            print("Invalid frame number entered.")
    return frame_ranges

def toggle_export_clips(ui, state):
    enabled = state == QtCore.Qt.Checked
    for i in range(ui.clips_layout.count()):
        widget = ui.clips_layout.itemAt(i).widget()
        if widget:
            widget.setEnabled(enabled)
