import maya.cmds as cmds
from PySide2 import QtCore, QtGui, QtWidgets
from modelCheckerExporter import MayaSceneTools
import os

class model_checker_UI(QtWidgets.QDialog):
    def __init__(self):
        super(model_checker_UI, self).__init__()
        self.setup_ui()
        #self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)

    def setup_ui(self):
        self.setWindowTitle("WH Model Checker 1.0")
        self.setObjectName("WHModelCheckerID")
        self.setMinimumSize(350, 300)
        self.setMaximumSize(450, 300)
        self.resize(350, 300)

        # MAIN LAYOUT
        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(5, 5, 5, 5)
        self.main_layout.setSpacing(5)
        self.setLayout(self.main_layout)

        # Add a QLabel for the title text
        self.headder_layout = QtWidgets.QVBoxLayout()
        self.headder_layout.setAlignment(QtCore.Qt.AlignTop)
        self.headder_layout.setContentsMargins(3, 3, 3, 3)
        self.headder_layout.setSpacing(2)
        self.main_layout.addLayout(self.headder_layout)


        self.top_title = QtWidgets.QLabel("Check for Errors:")
        self.top_title.setAlignment(QtCore.Qt.AlignHCenter)
        self.title_font_A = self.top_title.font()
        self.title_font_A.setBold(True)
        self.title_font_A.setPointSize(12)
        self.top_title.setFont(self.title_font_A)
        self.headder_layout.addWidget(self.top_title)


        # Add Checkboxes

        self.checkbox_layout = QtWidgets.QVBoxLayout()
        self.checkbox_layout.setAlignment(QtCore.Qt.AlignTop)
        self.checkbox_layout.setContentsMargins(3, 3, 3, 3)
        self.checkbox_layout.setSpacing(2)
        self.main_layout.addLayout(self.checkbox_layout)


        self.remove_namespace_check = QtWidgets.QCheckBox("Remove Namespace")
        self.remove_namespace_check.setChecked(True)
        self.checkbox_layout.addWidget(self.remove_namespace_check)

        self.remove_extra_uvsets_check = QtWidgets.QCheckBox("Remove double UV sets")
        self.remove_extra_uvsets_check.setChecked(True)
        self.checkbox_layout.addWidget(self.remove_extra_uvsets_check)

        self.remove_model_history_check = QtWidgets.QCheckBox("Remove model construction history")
        self.remove_model_history_check.setChecked(True)
        self.checkbox_layout.addWidget(self.remove_model_history_check)

        self.remove_unused_materials_check = QtWidgets.QCheckBox("Remove unused materials and textures")
        self.remove_unused_materials_check.setChecked(True)
        self.checkbox_layout.addWidget(self.remove_unused_materials_check)

        self.correct_material_tex_name_check = QtWidgets.QCheckBox("Correct Shader and Texture name")
        self.correct_material_tex_name_check.setChecked(True)
        self.checkbox_layout.addWidget(self.correct_material_tex_name_check)

        #Add Buttons
        self.checkbox_btn_layout = QtWidgets.QHBoxLayout()
        self.checkbox_btn_layout.setAlignment(QtCore.Qt.AlignTop)
        self.checkbox_btn_layout.setContentsMargins(3, 3, 3, 3)
        self.checkbox_btn_layout.setSpacing(5)
        self.main_layout.addLayout(self.checkbox_btn_layout)

        self.sel_all_btn = QtWidgets.QPushButton("All")
        self.sel_all_btn.clicked.connect(self.sel_all_btn_clicked)
        self.sel_all_btn.setFixedSize(60, 30)
        self.checkbox_btn_layout.addWidget(self.sel_all_btn)


        self.check_btn = QtWidgets.QPushButton("Check for errors")
        self.check_btn.clicked.connect(self.check_btn_clicked)
        self.check_btn.setFixedSize(120, 30)
        self.checkbox_btn_layout.addWidget(self.check_btn)

        # Text Line
        self.text_field_layout = QtWidgets.QHBoxLayout()
        self.text_field_layout.setAlignment(QtCore.Qt.AlignTop)
        self.text_field_layout.setContentsMargins(3, 3, 3, 3)
        self.text_field_layout.setSpacing(2)
        self.main_layout.addLayout(self.text_field_layout)


        self.savePathField = QtWidgets.QLineEdit()
        self.text_field_layout.addWidget(self.savePathField)
        self.savePathField.setPlaceholderText("Select folder where you want to save the file") 

        self.btn_set_path = QtWidgets.QPushButton("Set Path")
        self.btn_set_path.clicked.connect(self.btn_set_path_clicked)
        self.text_field_layout.addWidget(self.btn_set_path)

        #Maya file settings
        self.save_set_layout = QtWidgets.QVBoxLayout()
        self.save_set_layout.setAlignment(QtCore.Qt.AlignTop)
        self.save_set_layout.setContentsMargins(3, 3, 3, 3)
        self.save_set_layout.setSpacing(2)
        self.main_layout.addLayout(self.save_set_layout)

        self.nameLabel = QtWidgets.QLabel(self)
        self.nameLabel.setText('File Export Settings:')
        self.save_set_layout.addWidget(self.nameLabel)


        self.FileNameField = QtWidgets.QLineEdit()
        self.save_set_layout.addWidget(self.FileNameField)
        self.FileNameField.setPlaceholderText("NAME") 

        self.save_file_format_layout = QtWidgets.QHBoxLayout()
        self.save_file_format_layout.setAlignment(QtCore.Qt.AlignTop)
        self.save_file_format_layout.setContentsMargins(3, 3, 3, 3)
        self.save_file_format_layout.setSpacing(2)
        self.save_set_layout.addLayout(self.save_file_format_layout)

        self.ma_radio_btn = QtWidgets.QRadioButton(".ma")
        self.save_file_format_layout.addWidget(self.ma_radio_btn)
        self.mb_radio_btn = QtWidgets.QRadioButton(".mb")
        self.mb_radio_btn.setChecked(True)
        self.save_file_format_layout.addWidget(self.mb_radio_btn)
        self.fbx_radio_btn = QtWidgets.QRadioButton(".fbx")
        self.save_file_format_layout.addWidget(self.fbx_radio_btn)


        self.export_file_btn = QtWidgets.QPushButton("SAVE")
        self.export_file_btn.clicked.connect(self.export_file_btn_clicked)
        self.main_layout.addWidget(self.export_file_btn)

    def sel_all_btn_clicked(self):
        # Check if all checkboxes are currently checked
        all_checked = all(checkbox.isChecked() for checkbox in [
            self.remove_namespace_check,
            self.remove_extra_uvsets_check,
            self.remove_model_history_check,
            self.remove_unused_materials_check,
            self.correct_material_tex_name_check
        ])
        
        # Toggle the state of all checkboxes
        for checkbox in [
            self.remove_namespace_check,
            self.remove_extra_uvsets_check,
            self.remove_model_history_check,
            self.remove_unused_materials_check,
            self.correct_material_tex_name_check
        ]:
            checkbox.setChecked(not all_checked)



    def check_btn_clicked(self):
        if self.remove_namespace_check.isChecked():
            print("Deleting Namespeces")
            MayaSceneTools.remove_namespaces()

        if self.remove_extra_uvsets_check.isChecked():
            print("Deleting Empty UV Sets")
            MayaSceneTools.clean_up_uvsets()

        if self.remove_model_history_check.isChecked():
            print("Deleting Model Constuction History")
            MayaSceneTools.model_cleanup()
            MayaSceneTools.create_model_group()

        if self.remove_unused_materials_check.isChecked():
            print("Deleting Unused Shaders and Textures")
            MayaSceneTools.optimize_scene()

        if self.correct_material_tex_name_check.isChecked():
            print("Renaming Materials and Textures")
            MayaSceneTools.shader_texture_rename_new()

        print('Clean up is finished')
    

    def btn_set_path_clicked(self):
        file_save_location = cmds.fileDialog2(dialogStyle=2, fileMode=3)
        if file_save_location:
            selected_folder_path = file_save_location[0]
            self.savePathField.setText(selected_folder_path)
            self.file_save_location = selected_folder_path  # Set the attribute here
        return file_save_location

    
    def export_file_btn_clicked(self):
        # Check if all necessary parameters are set
        if not hasattr(self, 'file_save_location') or not self.file_save_location:
            self.show_error_dialog("Please select a folder to save the file.")
            return

        file_name = self.FileNameField.text()
        if not file_name:
            self.show_error_dialog("Please enter a file name.")
            return

        # Determine file format based on radio button selection
        if self.mb_radio_btn.isChecked():
            file_format = "mayaBinary"
        elif self.ma_radio_btn.isChecked():
            file_format = "mayaAscii"
        else:
            file_format = "fbx"

        # Construct the full file path
        file_path = os.path.join(self.file_save_location, file_name)

        # Check if the file path exists
        if os.path.exists(file_path):
            self.show_error_dialog("File already exists. Please choose a different file name.")
            return

        # Check if "Model_Group" exists, otherwise create it
        model_group = cmds.ls("Model_Group", type="transform")
        if cmds.objExists("Model_Group"):
            cmds.select("Model_Group", hi=True)
            cmds.file(rename=file_path)
            if file_format == "fbx":
                cmds.file(file_path, force=True, options="v=0;", typ="FBX export", pr=True,  es=True)
                saved = True  # Set saved to True after successful export
            else:
                saved = cmds.file(rename=file_path)
                saved = cmds.file(type=file_format, force=True, options="v=0", exportSelected=True)

            if saved:
                print("File saved successfully at {}".format(file_path))
            else:
                self.show_error_dialog("Failed to save file.")
        else:
            model_group = cmds.group(empty=True, name="Model_Group")
            print("Created Model_Group.")

            # Get all mesh objects in the scene
            meshes = cmds.ls(type="mesh")

            # Parent mesh objects under "Model_Group" if they are not already under it
            for mesh in meshes:
                mesh_transform = cmds.listRelatives(mesh, parent=True, fullPath=True)[0]
                if cmds.objExists(mesh_transform) and cmds.listRelatives(mesh_transform, parent=True) != model_group:
                    cmds.parent(mesh_transform, model_group)

            cmds.select("Model_Group", hi=True)
            cmds.file(rename=file_path)
            if file_format == "fbx":
                cmds.file(file_path, force=True, options="v=0;", typ="FBX export", pr=True,  es=True)
                saved = True  # Set saved to True after successful export
            else:
                saved = cmds.file(rename=file_path)
                saved = cmds.file(type=file_format, force=True, options="v=0", exportSelected=True)

            if saved:
                print("File saved successfully at {}".format(file_path))
            else:
                self.show_error_dialog("Failed to save file.")


    def show_error_dialog(self, message):
        QtWidgets.QMessageBox.critical(self, "Error", message)



def main():
    if cmds.window("WHModelCheckerID", exists=True):
        cmds.deleteUI("WHModelCheckerID", window=True)

    if cmds.windowPref("WHModelCheckerID", exists=True):
        cmds.windowPref("WHModelCheckerID", remove=True)


    global myUI
    myUI = model_checker_UI()
    myUI.show()

main()


