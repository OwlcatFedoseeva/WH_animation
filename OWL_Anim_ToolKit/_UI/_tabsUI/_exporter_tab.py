from PySide2 import QtWidgets, QtCore, QtGui
import maya.cmds as cmds
import os


class AnimExportWidget(QtWidgets.QWidget):
    def __init__(self, parent=None):
        super(AnimExportWidget, self).__init__(parent)
        self.init_ui()

    def init_ui(self):
        # Main Layout
        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(2, 2, 2, 2)
        self.main_layout.setSpacing(5)
        self.setLayout(self.main_layout)

        # Комбобокс выбора персонажа
        self.create_character_layout()

        # Блок экспорта клипов
        self.create_options_layout()
        self.frame_range_group_layout = QtWidgets.QVBoxLayout()
        self.main_layout.addLayout(self.frame_range_group_layout)
        self.create_operation_buttons()
        self.check_scene_create()

    def create_character_layout(self):
        self.set_char_layout = QtWidgets.QHBoxLayout()
        self.main_layout.addLayout(self.set_char_layout)

        self.title_label_B = QtWidgets.QLabel("SET CHARACTER:")
        self.set_char_layout.addWidget(self.title_label_B)
        self.set_char_type_combobox()

    def create_options_layout(self):
        self.options_layout = QtWidgets.QVBoxLayout()
        self.main_layout.addLayout(self.options_layout)

        self.checkbox_export_options = QtWidgets.QCheckBox("SPLIT ANIMATION INTO CLIPS")
        self.checkbox_export_options.stateChanged.connect(self.toggle_export_clips)
        self.options_layout.addWidget(self.checkbox_export_options)
        
        # Create export clips number UI
        self.export_clips_number()

        # Initialize the UI state based on the checkbox's initial value
        self.toggle_export_clips(self.checkbox_export_options.checkState())
        
    def create_operation_buttons(self):
        self.operation_layout = QtWidgets.QVBoxLayout()
        self.main_layout.addLayout(self.operation_layout)

        self.create_buttons('EXPORT THIS ANIMATION', self.export_current, 'Export currently opened animation.', self.operation_layout, is_default=True, size=(490, 40))
        self.create_buttons('BATCH ANIMATION EXPORT', self.export_batch, 'Export many animations.', self.operation_layout, is_default=True, size=(490, 40))

        self.create_buttons('EXPORT CREATURE RIG TO PROJECT', self.export_batch, 'Export creature rig to project.', self.operation_layout, is_default=True, size=(490, 40))

    def check_scene_create(self):
        self.check_scene_create_layout = QtWidgets.QVBoxLayout()
        self.main_layout.addLayout(self.check_scene_create_layout)
        self.create_buttons('CREATE ANIMATION CHECK SCENE', self.create_check_anim_scene, 'Creates a check scene for exported animation.', self.operation_layout, is_default=True, size=(490, 40))

    def create_buttons(self, label, command, tooltip, layout, is_default=False, size=(100, 30)):
        button = QtWidgets.QPushButton(label)
        button.clicked.connect(command)
        button.setToolTip(tooltip)
        button.setFixedSize(*size)
        layout.addWidget(button)
        if is_default:
            button.setDefault(True)

    def export_clips_number(self):
        self.clips_layout = QtWidgets.QHBoxLayout()
        self.options_layout.addLayout(self.clips_layout)

        self.clips_label = QtWidgets.QLabel("Number of clips to export: ")
        self.clips_layout.addWidget(self.clips_label)

        self.clips_field = QtWidgets.QLineEdit()
        self.clips_field.setFixedWidth(50)
        self.clips_field.setValidator(QtGui.QIntValidator())
        self.clips_field.setPlaceholderText("3")
        self.clips_layout.addWidget(self.clips_field)

        self.set_number_of_clips = self.create_buttons('SET', self.create_frame_range_comboboxes, 'Set start and end frame.', self.clips_layout, is_default=True, size=(50, 20))
        self.reset_number_of_clips = self.create_buttons('RESET', self.on_reset_button_clicked, 'Reset start and end frame.', self.clips_layout, is_default=True, size=(50, 20))

    def create_check_anim_scene(self):
        pass

    def on_reset_button_clicked(self):
        self.update_clips_field()
        self.create_frame_range_comboboxes()

    def update_clips_field(self):
        clips_value = self.clips_field.text()
        self.reset_clips()
        self.clips_field.setText(clips_value)

    def reset_clips(self):
        for i in reversed(range(self.frame_range_group_layout.count())):
            layout_item = self.frame_range_group_layout.takeAt(i)
            if layout_item:
                widget = layout_item.widget()
                if widget:
                    widget.deleteLater()
                else:
                    sub_layout = layout_item.layout()
                    if sub_layout:
                        while sub_layout.count():
                            item = sub_layout.takeAt(0)
                            sub_widget = item.widget()
                            if sub_widget:
                                sub_widget.deleteLater()

    def create_frame_range_comboboxes(self):
        # Ensure the frame_range_comboboxes list exists
        if not hasattr(self, 'frame_range_comboboxes'):
            self.frame_range_comboboxes = []

        # Check if the number of clips matches the existing comboboxes
        num_clips = int(self.clips_field.text())
        if len(self.frame_range_comboboxes) == num_clips:
            # If the number of clips hasn't changed, keep the existing comboboxes
            return [layout for layout, _ in self.frame_range_comboboxes]

        # Otherwise, clean up old comboboxes
        for combobox in self.frame_range_comboboxes:
            combobox[0].deleteLater()
            combobox[1].deleteLater()
        self.frame_range_comboboxes.clear()

        # Create new comboboxes
        clips = []
        for i in range(num_clips):
            frame_range_layout = self.frame_range_combobox(i)
            self.frame_range_group_layout.addLayout(frame_range_layout)

            # Track start and end fields
            start_frame_field = frame_range_layout.itemAt(1).widget()
            end_frame_field = frame_range_layout.itemAt(3).widget()
            self.frame_range_comboboxes.append((start_frame_field, end_frame_field))

            clips.append(frame_range_layout)

        return clips
    def frame_range_combobox(self, index):
        frame_range_layout = QtWidgets.QHBoxLayout()

        frame_range_start_label = QtWidgets.QLabel(f"Clip {index + 1} Start Frame: ")
        frame_range_layout.addWidget(frame_range_start_label)

        start_frame_field = QtWidgets.QLineEdit()
        start_frame_field.setFixedWidth(50)
        start_frame_field.setValidator(QtGui.QIntValidator())
        start_frame_field.setPlaceholderText("1")
        frame_range_layout.addWidget(start_frame_field)

        frame_range_end_label = QtWidgets.QLabel(f"End Frame: ")
        frame_range_layout.addWidget(frame_range_end_label)

        end_frame_field = QtWidgets.QLineEdit()
        end_frame_field.setFixedWidth(50)
        end_frame_field.setValidator(QtGui.QIntValidator())
        end_frame_field.setPlaceholderText("10")
        frame_range_layout.addWidget(end_frame_field)

        set_range_button = QtWidgets.QPushButton("Set Range")
        set_range_button.setFixedWidth(120)
        set_range_button.clicked.connect(lambda: self.set_range(index, start_frame_field, end_frame_field))
        frame_range_layout.addWidget(set_range_button)

        return frame_range_layout

    def toggle_export_clips(self, state):
        enabled = state == QtCore.Qt.Checked
        for i in range(self.clips_layout.count()):
            widget = self.clips_layout.itemAt(i).widget()
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


    def set_project_combobox(self):
        
        preset_path = os.path.join(cmds.internalVar(userAppDir=True), 'scripts', 'OWL_Anim_ToolKit', 'project_data')
        self.combobox_project = QtWidgets.QComboBox()

        files = [file.split('.')[0] for file in os.listdir(preset_path) if file.endswith(".fbxexportpreset")]

        for file in files:
            self.combobox_project.addItem(file)

        self.combobox_project.setCurrentIndex(0)
        self.set_project_layout.addWidget(self.combobox_project)
        self.set_project_layout.setStretchFactor(self.combobox_project, 1)

    def set_char_type_combobox(self):
        self.combobox_race = QtWidgets.QComboBox()
        character_types = ["HUMAN", "ELDAR", "SPACEMARINE", "KROOT", "OGRYN", "CREATURE"]

        for char_type in character_types:
            self.combobox_race.addItem(char_type)

        self.combobox_race.setCurrentIndex(0)
        self.set_char_layout.addWidget(self.combobox_race)
        self.set_char_layout.setStretchFactor(self.combobox_race, 1)

    def btn_set_path_clicked(self):
        self.folder_path = cmds.fileDialog2(dialogStyle=2, fileMode=3)
        if self.folder_path:
            self.save_name_field.setText(self.folder_path[0])
            print("Folder path set to:", self.folder_path[0])
        else:
            print("No folder selected.")

    def export_current(self):
        pass

    def export_batch(self):
        pass

    def export_creature_rig(self):
        pass

    '''
    def export_current(self):
        print("EXPORTING CURRENT FILE")
        char_type = self.combobox_race.currentText()
        supported_char_types = {"HUMAN", "ELDAR", "SPACEMARINE", "KROOT", "OGRYN"}

        if char_type in supported_char_types:
            if self.rbtnA.isChecked():
                if self.checkbox_export_options.isChecked():
                    clips = self.create_frame_range_comboboxes()
                    num_clips = len(clips)
                    for clip_index in range(num_clips):
                        self.export_animation_process(clip_index)
                else:
                    start_frame = cmds.playbackOptions(q=True, minTime=True)
                    end_frame = cmds.playbackOptions(q=True, maxTime=True)
                    name, folder_path = owl_export_anim_common.file_save_to_default_location()
                    self.export_animation(start_frame, end_frame)
            elif self.rbtnB.isChecked():
                if self.checkbox_export_options.isChecked():
                    clips = self.create_frame_range_comboboxes()
                    num_clips = len(clips)
                    for clip_index in range(num_clips):
                        self.export_animation_process(clip_index, folder_path=self.save_name_field.text())
                else:
                    start_frame = cmds.playbackOptions(q=True, minTime=True)
                    end_frame = cmds.playbackOptions(q=True, maxTime=True)
                    self.export_animation(start_frame, end_frame, folder_path=self.save_name_field.text())

    def export_batch(self):
        print("EXPORTING BATCH FILE")

    def set_range(self, index, start_field, end_field):
        try:
            if not start_field.text() or not end_field.text():
                raise ValueError("Start and End frames cannot be empty.")
            
            start_frame = int(start_field.text())
            end_frame = int(end_field.text())

            if start_frame >= end_frame:
                raise ValueError("Start frame must be less than end frame.")

            print(f"Clip {index + 1}: Start Frame {start_frame}, End Frame {end_frame} range successfully set.")
        except ValueError as e:
            print(f"Input Error: {str(e)}")
    def export_animation_process(self, clip_index):
        owl_export_anim_common.import_reference()
        owl_export_anim_common.remove_namespaces()
        start_frame, end_frame = self.get_frame_range_values(clip_index)
        name, folder_path = owl_export_anim_common.file_save_to_default_location()

        if start_frame is None or end_frame is None:
            print("Error: Invalid start or end frame values.")
            return

        owl_anim_bake_ch_wh2.ch_anim_bake()
        clip_file_name = f"{folder_path}/{name}_Clip{clip_index + 1}.fbx"
        try:
            start_frame, end_frame = self.get_frame_range_values(clip_index)
            if start_frame is not None and end_frame is not None:
                takename = f"clip{clip_index+1}"
                cmds.FBXExportSplitAnimationIntoTakes("-v", takename, start_frame, end_frame)
                cmds.FBXExport("-f", clip_file_name, "-s")
                print(f"Clip {clip_index+1} exported to {clip_file_name}")
            else:
                print("Error: Start and end frame fields are empty")
        except Exception as e:
            print(f"Error getting frame range values: {e}")

    def export_animation(self, start_frame, end_frame):
        owl_export_anim_common.import_reference()
        owl_export_anim_common.remove_namespaces()
        owl_anim_bake_ch_wh2.ch_anim_bake()
        name, folder_path = owl_export_anim_common.file_save_to_default_location()
        file_name = f"{folder_path}/{name}.fbx"
        cmds.select('Position', hi=True)
        #mel.eval(f'FBXExport -f "{file_name}" -s')
        cmds.file(file_name, force=True, type='FBX export', options='v=0', exportSelected=True)
        print(f"File exported to {file_name}")

    
    '''




