import os
import maya.cmds as cmds
from PySide2 import QtCore
from .project_loader import get_project_data
from .bake_anim_utils import bake_animation_for_project

def export_current(ui):
    print("EXPORTING CURRENT FILE")

    project = ui.project_combo.currentText()
    try:
        project_data = get_project_data(project)
    except Exception as e:
        print(f"[ERROR] Could not load project data: {e}")
        return

    export_dir = project_data.get("export_path")
    if not export_dir:
        print(f"[ERROR] Project config missing 'export_path'")
        return

    char_type = ui.combobox_race.currentText()
    supported_char_types = {"HUMAN", "ELDAR", "SPACEMARINE", "KROOT", "OGRYN"}

    if char_type not in supported_char_types:
        print(f"[ERROR] Unsupported character type: {char_type}")
        return

    if ui.checkbox_export_options.isChecked():
        frame_ranges = create_frame_range_comboboxes(ui)
        for clip_index, (start_frame, end_frame) in enumerate(frame_ranges):
            export_animation(ui, start_frame, end_frame, project, export_dir, clip_index)
    else:
        start_frame = cmds.playbackOptions(q=True, minTime=True)
        end_frame = cmds.playbackOptions(q=True, maxTime=True)
        export_animation(ui, start_frame, end_frame, project, export_dir)

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
