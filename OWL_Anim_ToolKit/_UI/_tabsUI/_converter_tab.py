# _UI/_tabsUI/animation_converter_tab.py

from PySide2 import QtWidgets, QtCore
import os
import json
import maya.cmds as cmds


class AnimationConverterWidget(QtWidgets.QWidget):
    def __init__(self, parent=None):
        super(AnimationConverterWidget, self).__init__(parent)
        self.project_data = {}
        self.init_ui()
        self.load_projects()

    def init_ui(self):
        main_layout = QtWidgets.QVBoxLayout(self)
        main_layout.setAlignment(QtCore.Qt.AlignTop)

        title_label = QtWidgets.QLabel("Animation Converter")
        title_label.setAlignment(QtCore.Qt.AlignCenter)
        main_layout.addWidget(title_label)

        # Layout with combo boxes
        converter_layout = QtWidgets.QGridLayout()

        converter_layout.addWidget(QtWidgets.QLabel("From:"), 0, 0)
        converter_layout.addWidget(QtWidgets.QLabel("-->"), 0, 2)
        converter_layout.addWidget(QtWidgets.QLabel("To:"), 0, 3)
        converter_layout.addWidget(QtWidgets.QLabel("-->"), 1, 2)

        # Source Project and Character
        self.source_project_combobox = QtWidgets.QComboBox()
        self.source_project_combobox.setPlaceholderText("Select Source Project")
        self.source_character_combobox = QtWidgets.QComboBox()
        self.source_character_combobox.setPlaceholderText("Select Source Character")

        converter_layout.addWidget(self.source_project_combobox, 0, 1)
        converter_layout.addWidget(self.source_character_combobox, 1, 1)

        # Target Project and Character
        self.target_project_combobox = QtWidgets.QComboBox()
        self.target_project_combobox.setPlaceholderText("Select Target Project")
        self.target_character_combobox = QtWidgets.QComboBox()
        self.target_character_combobox.setPlaceholderText("Select Target Character")

        converter_layout.addWidget(self.target_project_combobox, 0, 4)
        converter_layout.addWidget(self.target_character_combobox, 1, 4)

        main_layout.addLayout(converter_layout)

        # Buttons
        btn_layout = QtWidgets.QVBoxLayout()
        btn_layout.setAlignment(QtCore.Qt.AlignHCenter)

        self.convert_current_anim_btn = QtWidgets.QPushButton("Convert Current Animation")
        self.convert_current_anim_btn.setFixedSize(490, 40)
        btn_layout.addWidget(self.convert_current_anim_btn)

        self.convert_batch_anim_btn = QtWidgets.QPushButton("Convert Batch")
        self.convert_batch_anim_btn.setFixedSize(490, 40)
        btn_layout.addWidget(self.convert_batch_anim_btn)

        main_layout.addLayout(btn_layout)


    def load_projects(self):
        """Loads project data from JSON files inside /project_data"""
        user_app_dir = cmds.internalVar(userAppDir=True)
        project_data_path = os.path.join(user_app_dir, "scripts", "OWL_Anim_ToolKit", "project_data")

        if not os.path.exists(project_data_path):
            print("[ConverterWidget] Project data folder not found:", project_data_path)
            return

        json_files = [f for f in os.listdir(project_data_path) if f.endswith(".json")]
        if not json_files:
            print("[ConverterWidget] No project files found.")
            return

        for filename in json_files:
            filepath = os.path.join(project_data_path, filename)
            try:
                with open(filepath, "r") as f:
                    data = json.load(f)
                    project_key = os.path.splitext(filename)[0]
                    self.project_data[project_key] = data
            except Exception as e:
                print(f"[ConverterWidget] Failed to load {filename}: {e}")

        if self.project_data:
            self.source_project_combobox.addItems(self.project_data.keys())
            self.target_project_combobox.addItems(self.project_data.keys())
        else:
            self.source_project_combobox.setPlaceholderText("No projects found")
            self.target_project_combobox.setPlaceholderText("No projects found")
