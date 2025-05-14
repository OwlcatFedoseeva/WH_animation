import maya.cmds as cmds
from PySide2 import QtCore, QtGui, QtWidgets


def export_batch(self):
    print("Batch export initiated")
    # Add logic for batch exporting here

def export_current(self):
    print("EXPORTING CURRENT FILE")
    char_type = self.ui.combobox_race.currentText()
    supported_char_types = {"HUMAN", "ELDAR", "SPACEMARINE", "KROOT", "OGRYN"}

    if char_type in supported_char_types:
        if self.ui.checkbox_export_options.isChecked():
            clips = self.create_frame_range_comboboxes()
            num_clips = len(clips)
            for clip_index in range(num_clips):
                self.export_animation_process(clip_index)
        else:
            start_frame = cmds.playbackOptions(q=True, minTime=True)
            end_frame = cmds.playbackOptions(q=True, maxTime=True)
            #name, folder_path = owl_export_anim_common.file_save_to_default_location()
            self.export_animation(start_frame, end_frame)
    else:
        print("ERROR")

def export_animation_process(self, clip_index):
    start_frame, end_frame = self.get_frame_range_values(clip_index)
    if start_frame is None or end_frame is None:
        print(f"Skipping export for clip {clip_index} due to invalid frame range.")
        return
    self.export_animation(start_frame, end_frame)

def export_animation(self, start_frame, end_frame):
    print(f"Exporting animation from frame {start_frame} to {end_frame}")
    try:
        # The export logic is customized for your project and will likely involve using the animation library
        # such as exporting using fbx. Please replace the following line with your export logic.
        print(f"Exporting animation with range: {start_frame} to {end_frame}")
    except Exception as e:
        print(f"Error during export: {e}")

def create_frame_range_comboboxes(self):
    # Create and return comboboxes for frame range selection
    return []

def toggle_export_clips(self, state):
    # Enable or disable the export clips controls based on the state
    enabled = state == QtCore.Qt.Checked
    for i in range(self.ui.clips_layout.count()):
        widget = self.ui.clips_layout.itemAt(i).widget()
        if widget:
            widget.setEnabled(enabled)

def get_frame_range_values(self, clip_index):
    start_frame_field, end_frame_field = self.frame_range_comboboxes[clip_index]
    if not start_frame_field.text() or not end_frame_field.text():
        print(f"Error: Start and/or end frame fields are empty for clip {clip_index}")
        return None, None

    try:
        start_frame = int(start_frame_field.text())
        end_frame = int(end_frame_field.text())
    except ValueError:
        print(f"Error: Invalid frame values entered for clip {clip_index}. Please enter valid integers.")
        return None, None

    if start_frame > end_frame:
        print(f"Error: Start frame ({start_frame}) cannot be greater than end frame ({end_frame}) for clip {clip_index}.")
        return None, None

    return start_frame, end_frame
