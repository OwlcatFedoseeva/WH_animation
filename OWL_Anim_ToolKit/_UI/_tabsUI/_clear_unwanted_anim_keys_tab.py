# _UI/_tabsUI/clean_unwanted_anim_ui.py

from PySide2 import QtWidgets, QtCore
import os
import json
import maya.cmds as cmds

from _logic import clear_unwanted_anim_logic
import importlib
importlib.reload(clear_unwanted_anim_logic)

from _logic.clear_unwanted_anim_logic import CleanAnimLogic

class CleanUnwantedAnimWidget(QtWidgets.QWidget):
    def __init__(self, parent=None):
        super(CleanUnwantedAnimWidget, self).__init__(parent)

        # Get Maya project path
        USERAPPDIR = cmds.internalVar(userAppDir=True)
        project_path = os.path.join(USERAPPDIR, 'scripts', 'OWL_Anim_ToolKit')
        print("Project path:", project_path)

        # Ensure temp directory exists
        temp_dir = os.path.join(project_path, "temp")
        os.makedirs(temp_dir, exist_ok=True)
        print("Temp dir:", temp_dir)

        # Ensure AnimExport directory exists in user's Maya app dir
        
        new_directory = os.path.join(USERAPPDIR, "AnimExport")
        os.makedirs(new_directory, exist_ok=True)
        print("Export dir:", new_directory)

        # Paths for logic
        self.path_to_json = os.path.join(temp_dir, "joints_set.json")
        preset_path = os.path.join(project_path, "project_data", "UMA_Male_Rig_AnimationExport.fbxexportpreset") 
        print("Preset path:", preset_path)

        # Initialize logic
        self.logic = CleanAnimLogic(self.path_to_json, new_directory, preset_path)

        self.init_ui()
        QtCore.QTimer.singleShot(0, self.load_joint_list)


    def init_ui(self):
        layout = QtWidgets.QVBoxLayout(self)
        layout.setAlignment(QtCore.Qt.AlignTop)

        self.save_path_field = QtWidgets.QLineEdit()
        layout.addWidget(QtWidgets.QLabel("Animation Folder:"))
        layout.addWidget(self.save_path_field)

        btn_set_path = QtWidgets.QPushButton("Set Path")
        btn_set_path.clicked.connect(self.set_folder_path)
        layout.addWidget(btn_set_path)

        btn_select_joints = QtWidgets.QPushButton("Select Joints to Clean")
        btn_select_joints.clicked.connect(self.save_joint_selection)
        layout.addWidget(btn_select_joints)

        self.listWidget = QtWidgets.QListWidget()
        layout.addWidget(self.listWidget)

        self.chk_trans = QtWidgets.QCheckBox("Translate")
        self.chk_rot = QtWidgets.QCheckBox("Rotate")
        self.chk_scl = QtWidgets.QCheckBox("Scale")
        self.chk_trans.setChecked(True)
        self.chk_rot.setChecked(True)
        self.chk_scl.setChecked(True)

        hbox_attrs = QtWidgets.QHBoxLayout()
        hbox_attrs.addWidget(self.chk_trans)
        hbox_attrs.addWidget(self.chk_rot)
        hbox_attrs.addWidget(self.chk_scl)
        layout.addLayout(hbox_attrs)

        self.radio_origin = QtWidgets.QRadioButton("Save to Original Folder")
        self.radio_export = QtWidgets.QRadioButton("Save to AnimationExport")
        self.radio_export.setChecked(True)

        hbox_radio = QtWidgets.QHBoxLayout()
        hbox_radio.addWidget(self.radio_origin)
        hbox_radio.addWidget(self.radio_export)
        layout.addLayout(hbox_radio)

        btn_process = QtWidgets.QPushButton("Batch Fix")
        btn_process.clicked.connect(self.batch_process)
        layout.addWidget(btn_process)

    def set_folder_path(self):
        folder = QtWidgets.QFileDialog.getExistingDirectory(self, "Select Animation Folder")
        if folder:
            self.save_path_field.setText(folder)

    def save_joint_selection(self):
        selected = self.logic.set_selection()
        self.logic.save_selection_to_json(selected)
        self.listWidget.clear()
        for item in selected:
            self.listWidget.addItem(item)
        self.logic.clean_joints(self.get_selected_attributes())

    def get_selected_attributes(self):
        return self.logic.get_selected_attributes(
            translate=self.chk_trans.isChecked(),
            rotate=self.chk_rot.isChecked(),
            scale=self.chk_scl.isChecked()
        )

    def batch_process(self):
        folder = self.save_path_field.text()
        if not folder or not os.path.exists(folder):
            QtWidgets.QMessageBox.warning(self, "Error", "Please select a valid folder.")
            return
        save_to_origin = self.radio_origin.isChecked()
        self.logic.batch_process(folder, save_to_origin)

    def load_joint_list(self):
        #self.listWidget.clear()
        print("[DEBUG] load_joint_list() вызван")
        try:
            if os.path.exists(self.path_to_json):
                with open(self.path_to_json, 'r') as f:
                    joints = json.load(f)
                    for joint in joints:
                        self.listWidget.addItem(joint)
            else:
                print("[INFO] selected_joints.json не найден.")
        except Exception as e:
            print(f"[Ошибка] Не удалось загрузить selected_joints.json: {e}")

