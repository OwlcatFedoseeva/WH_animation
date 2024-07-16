import sys
import os
import logging
from PySide2 import QtCore, QtGui, QtWidgets
import maya.cmds as cmds
from modelCheckerExporter import MayaSceneTools

# Add the directory containing the script to the Python path
script_dir = os.path.dirname(__file__)
if script_dir not in sys.path:
    sys.path.append(script_dir)

# Change current working directory to the script's directory
os.chdir(script_dir)


class QTextEditLogger(QtWidgets.QMainWindow):
    def __init__(self, log_file_path, parent=None):
        super(QTextEditLogger, self).__init__(parent)
        self.setWindowTitle("Log Output")
        self.setGeometry(100, 100, 850, 400)

        self.log_file_path = log_file_path

        self.text_edit = QtWidgets.QTextEdit(self)
        self.text_edit.setReadOnly(True)
        self.setCentralWidget(self.text_edit)

        self.update_timer = QtCore.QTimer(self)
        self.update_timer.timeout.connect(self.update_log_display)
        self.update_timer.start(1000)  # Update every second

    def update_log_display(self):
        with open(self.log_file_path, 'r') as log_file:
            log_data = log_file.read()
            self.text_edit.setPlainText(log_data)

class model_checker_UI(QtWidgets.QDialog):
    def __init__(self):
        super(model_checker_UI, self).__init__()
        self.setup_ui()
        self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)

        self.log_window = None
        self.log_file_path = "model_checker.log"

        # Initialize logger
        self.logger = logging.getLogger(__name__)
        self.logger.setLevel(logging.INFO)
        self.clear_log_handlers()
        formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
        file_handler = logging.FileHandler(self.log_file_path, mode='w')  # Overwrite mode
        file_handler.setFormatter(formatter)
        self.logger.addHandler(file_handler)

    def clear_log_handlers(self):
        if self.logger.hasHandlers():
            self.logger.handlers.clear()

    def setup_ui(self):
        self.setWindowTitle("WH Model Checker 4.0")
        self.setObjectName("WHModelCheckerID")
        self.setMinimumSize(265, 450)
        self.setMaximumSize(365, 450)
        self.resize(265, 450)

        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(5, 5, 5, 5)
        self.main_layout.setSpacing(5)
        self.setLayout(self.main_layout)

        self.setup_save_ui()
        self.setup_check_ui()

    def setup_save_ui(self):
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

        self.text_field_layout = QtWidgets.QHBoxLayout()
        self.text_field_layout.setAlignment(QtCore.Qt.AlignTop)
        self.text_field_layout.setContentsMargins(3, 3, 3, 3)
        self.text_field_layout.setSpacing(2)
        self.save_set_layout.addLayout(self.text_field_layout)

        self.savePathField = QtWidgets.QLineEdit()
        self.text_field_layout.addWidget(self.savePathField)
        self.savePathField.setPlaceholderText("Select folder where you want to save the file")

        self.btn_set_path = QtWidgets.QPushButton("Set Path")
        self.btn_set_path.clicked.connect(self.btn_set_path_clicked)
        self.text_field_layout.addWidget(self.btn_set_path)

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

        self.btn_save_data = QtWidgets.QPushButton("Save data")
        self.save_set_layout.addWidget(self.btn_save_data)
        self.btn_save_data.clicked.connect(self.btn_save_data_clicked)

    def setup_check_ui(self):
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

        self.checkbox_layout = QtWidgets.QVBoxLayout()
        self.checkbox_layout.setAlignment(QtCore.Qt.AlignTop)
        self.checkbox_layout.setContentsMargins(3, 3, 3, 3)
        self.checkbox_layout.setSpacing(2)
        self.main_layout.addLayout(self.checkbox_layout)

        self.remove_namespace_chk = QtWidgets.QCheckBox("Remove Namespace")
        self.checkbox_layout.addWidget(self.remove_namespace_chk)

        spacer = QtWidgets.QSpacerItem(10, 10, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.checkbox_layout.addItem(spacer)

        self.remove_empty_uv_chk = QtWidgets.QCheckBox("Remove double UV sets")
        self.checkbox_layout.addWidget(self.remove_empty_uv_chk)

        spacer = QtWidgets.QSpacerItem(10, 10, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.checkbox_layout.addItem(spacer)

        self.remove_model_history_chk = QtWidgets.QCheckBox("Remove model history")
        self.checkbox_layout.addWidget(self.remove_model_history_chk)

        spacer = QtWidgets.QSpacerItem(10, 10, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.checkbox_layout.addItem(spacer)

        self.group_all_models_chk = QtWidgets.QCheckBox("Group for all models")
        self.checkbox_layout.addWidget(self.group_all_models_chk)

        spacer = QtWidgets.QSpacerItem(10, 10, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.checkbox_layout.addItem(spacer)

        self.correct_material_tex_name_chk = QtWidgets.QCheckBox("Correct material and texture name")
        self.checkbox_layout.addWidget(self.correct_material_tex_name_chk)

        spacer = QtWidgets.QSpacerItem(10, 10, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.checkbox_layout.addItem(spacer)

        self.correct_tex_path_name_chk = QtWidgets.QCheckBox("Correct texture path")
        self.checkbox_layout.addWidget(self.correct_tex_path_name_chk)

        spacer = QtWidgets.QSpacerItem(10, 10, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.checkbox_layout.addItem(spacer)

        self.correct_shader_assignment_chk = QtWidgets.QCheckBox("Correct shader assignment")
        self.checkbox_layout.addWidget(self.correct_shader_assignment_chk)

        spacer = QtWidgets.QSpacerItem(10, 10, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.checkbox_layout.addItem(spacer)

        self.remove_unused_materials_chk = QtWidgets.QCheckBox("Remove unused materials")
        self.checkbox_layout.addWidget(self.remove_unused_materials_chk)

        spacer = QtWidgets.QSpacerItem(10, 10, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Expanding)
        self.checkbox_layout.addItem(spacer)

        self.remove_duplicate_polygons_chk = QtWidgets.QCheckBox("Remove double polygons")
        self.checkbox_layout.addWidget(self.remove_duplicate_polygons_chk)

        self.checkbox_btn_layout = QtWidgets.QHBoxLayout()
        self.checkbox_btn_layout.setAlignment(QtCore.Qt.AlignTop)
        self.checkbox_btn_layout.setContentsMargins(3, 3, 3, 3)
        self.checkbox_btn_layout.setSpacing(5)
        self.main_layout.addLayout(self.checkbox_btn_layout)

        self.sel_all_btn = QtWidgets.QPushButton("Run All")
        self.sel_all_btn.clicked.connect(self.sel_all_btn_clicked)
        #self.sel_all_btn.setFixedSize(250, 30)
        self.checkbox_btn_layout.addWidget(self.sel_all_btn)

    def show_log_window(self):
        if not self.log_window:
            self.log_window = QTextEditLogger(self.log_file_path, self)
        self.log_window.show()

    def sel_all_btn_clicked(self):
        self.logger.info("Running all selected checks...")
        self.show_log_window()

        errors = []

        def run_check(method, description):
            try:
                method()
            except Exception as e:
                errors.append("%s failed: %s" % (description, str(e)))
                self.logger.error("%s failed: %s" % (description, str(e)))

        if self.remove_namespace_chk.isChecked():
            run_check(self.remove_namespaces, "Removing namespaces")
        if self.remove_empty_uv_chk.isChecked():
            run_check(self.delete_empty_uv_sets, "Removing double UV sets")
        if self.remove_model_history_chk.isChecked():
            run_check(self.model_cleanup, "Removing model history")
        if self.group_all_models_chk.isChecked():
            run_check(self.create_model_group, "Grouping all models")
        if self.correct_material_tex_name_chk.isChecked():
            run_check(self.correct_material_and_textures, "Correcting material and textures names")
        if self.correct_tex_path_name_chk.isChecked():
            run_check(self.correct_texture_path, "Correcting texture paths")
        if self.correct_shader_assignment_chk.isChecked():
            run_check(self.correct_shader_assignment, "Correcting shader assignment")
        if self.remove_unused_materials_chk.isChecked():
            run_check(self.scene_optimization, "Removing unused materials")
        if self.remove_duplicate_polygons_chk.isChecked():
            run_check(self.duplicate_polygon_checker, "Removing duplicate polygons")

        if errors:
            for error in errors:
                self.logger.error(error)
        else:
            self.logger.info("All processes completed successfully")

    def remove_namespaces(self):
        try:
            MayaSceneTools.remove_namespaces()
            self.logger.info("Removing namespaces... -> DONE")
        except Exception as e:
            self.logger.error("Failed to remove unwanted namespaces.")
        self.show_log_window()

    def delete_empty_uv_sets(self):
        try:
            MayaSceneTools.clean_up_uvsets()
            MayaSceneTools.uv_set_name_check()
            self.logger.info("Removing double UV sets... -> DONE")
            self.logger.info("Checking the UVset name... -> DONE")
        except Exception as e:
            self.logger.error("There are no double UV sets.")
        self.show_log_window()

    def model_cleanup(self):
        try:
            MayaSceneTools.model_cleanup()
            self.logger.info("Removing model history... -> DONE")
        except Exception as e:
            self.logger.error("Failed to remove model history.")
        self.show_log_window()

    def create_model_group(self):
        try:
            MayaSceneTools.create_model_group()
            self.logger.info("Grouping all models... -> DONE")
        except Exception as e:
            self.logger.error("Failed to group all models.")
        self.show_log_window()

    def correct_material_and_textures(self):
        try:
            MayaSceneTools.material_rename()
            self.logger.info("Correcting material and textures names... -> DONE")
        except Exception as e:
            self.logger.error("Nothing to correct here. Skipping forward.")
        self.show_log_window()
    
    def correct_texture_path(self):
        try:
            MayaSceneTools.update_texture_paths()
        except Exception as e:
            self.logger.error("Nothing to correct here. Skipping forward.")
        self.show_log_window()

    def correct_shader_assignment(self):
        try:
            MayaSceneTools.correct_shader_assignment()
        except Exception as e:
            self.logger.error("Nothing to correct here. Skipping forward.")
        self.show_log_window()

    def scene_optimization(self):
        try:
            MayaSceneTools.scene_optimization()

            self.logger.info("Removing unused materials... -> DONE")
        except Exception as e:
            self.logger.error("Failed to remove unused materials.")
        self.show_log_window()

    def duplicate_polygon_checker(self):
        try:
            MayaSceneTools.duplicate_polygon_checker()
            self.logger.info("Removing duplicate polygons... -> DONE")
        except Exception as e:
            self.logger.error("Failed to remove duplicate polygons.")
        self.show_log_window()

    def btn_set_path_clicked(self):
        save_path = QtWidgets.QFileDialog.getExistingDirectory(self, "Select Directory")
        self.savePathField.setText(save_path)
        self.logger.info("Selected save path: %s" % save_path)
        #self.show_log_window()

    def btn_save_data_clicked(self):
        file_name = self.FileNameField.text()
        save_path = self.savePathField.text()
        
        if not file_name:
            self.logger.error("File name is empty.")
            QtWidgets.QMessageBox.warning(self, "Error", "File name cannot be empty.")
            return

        if not save_path:
            self.logger.error("Save path is empty.")
            QtWidgets.QMessageBox.warning(self, "Error", "Save path cannot be empty.")
            return

        file_format = ".ma" if self.ma_radio_btn.isChecked() else ".mb" if self.mb_radio_btn.isChecked() else ".fbx"
        full_path = os.path.join(save_path, "%s%s" % (file_name, file_format))
        
        try:
            if file_format == ".ma":
                cmds.file(rename=full_path)
                cmds.file(save=True, type="mayaAscii")
            elif file_format == ".mb":
                cmds.file(rename=full_path)
                cmds.file(save=True, type="mayaBinary")
            elif file_format == ".fbx":
                cmds.file(rename=full_path)
                cmds.file(save=True, type="FBX export")

            self.logger.info("Data saved to: %s" % full_path)
            QtWidgets.QMessageBox.information(self, "Success", "File saved successfully to %s" % full_path)
        except Exception as e:
            self.logger.error("Failed to save file: %s" % str(e))
            QtWidgets.QMessageBox.critical(self, "Error", "Failed to save file: %s" % str(e))


        self.show_log_window()
