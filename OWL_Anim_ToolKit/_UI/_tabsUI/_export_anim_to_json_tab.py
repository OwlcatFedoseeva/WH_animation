from PySide2 import QtWidgets
import os
import json
import maya.cmds as cmds
import importlib
import OWL_Anim_ToolKit._logic.bake_correct_export_anim as anim_utils
import _logic.logging_process as logging_process

importlib.reload(logging_process)

# Этот модуль задумывался как дополнение к модулю _UI/_tabsUI/_exporter_tab.py 
# Но я усомнилась что такой функционал будет использоваться аниматорми. 
# Поэтому я решила выделить его в отдельный модуль и пока не использовать в основном модуле но при необходимости его можно будет добавить.

# Идея в том что можно экспортировать и импортировать анимацию в формате JSON. При условии что объекты (кости) называются одинаково.

class AnimExportImportJSON(QtWidgets.QWidget):
    def __init__(self, parent=None, logger=None):
        super(AnimExportImportJSON, self).__init__(parent)
        self.logger = logger
        self.init_ui()

    def init_ui(self):
        layout = QtWidgets.QVBoxLayout(self)

        self.source_project_combobox = QtWidgets.QComboBox()
        self.target_project_combobox = QtWidgets.QComboBox()
        self.race_field = QtWidgets.QComboBox()
        self.gender_field = QtWidgets.QComboBox()

        layout.addWidget(QtWidgets.QLabel("Source Project:"))
        layout.addWidget(self.source_project_combobox)
        layout.addWidget(QtWidgets.QLabel("Target Project:"))
        layout.addWidget(self.target_project_combobox)
        layout.addWidget(QtWidgets.QLabel("Race:"))
        layout.addWidget(self.race_field)
        layout.addWidget(QtWidgets.QLabel("Gender:"))
        layout.addWidget(self.gender_field)

        export_button = QtWidgets.QPushButton("Export Animation to JSON")
        export_button.clicked.connect(self.handle_export_animation)
        layout.addWidget(export_button)

        import_button = QtWidgets.QPushButton("Import Animation from JSON")
        import_button.clicked.connect(self.handle_import_animation)
        layout.addWidget(import_button)

    def handle_export_animation(self):
        source_proj = self.source_project_combobox.currentText()
        target_proj = self.target_project_combobox.currentText()
        race = self.race_field.currentText()
        gender = self.gender_field.currentText()

        if self.logger:
            self.logger.log(f"Экспорт анимации: {source_proj}_{target_proj}_{race}_{gender}")

        if not (source_proj and target_proj and race and gender):
            QtWidgets.QMessageBox.warning(self, "Error", "Please select all required fields.")
            return

        try:
            json_path = anim_utils.prepare_anim_data_for_transfer(
                source_project=source_proj,
                target_project=target_proj,
                race=race,
                gender=gender
            )
            QtWidgets.QMessageBox.information(self, "Export Complete", f"Animation exported to:\n{json_path}")
        except Exception as e:
            QtWidgets.QMessageBox.critical(self, "Export Error", str(e))

    def handle_import_animation(self):
        source_proj = self.source_project_combobox.currentText()
        target_proj = self.target_project_combobox.currentText()
        race = self.race_field.currentText()
        gender = self.gender_field.currentText()

        if not (source_proj and target_proj and race and gender):
            QtWidgets.QMessageBox.warning(self, "Error", "Please select all required fields.")
            return

        try:
            template_path = anim_utils.get_template_path(source_proj, target_proj, race, gender)
        except Exception as e:
            QtWidgets.QMessageBox.critical(self, "Template Error", f"Failed to build template path: {e}")
            return

        if not os.path.exists(template_path):
            QtWidgets.QMessageBox.critical(self, "Template Missing", f"Template not found:\n{template_path}")
            return

        module_dir = os.path.dirname(anim_utils.__file__)
        temp_path = os.path.normpath(os.path.join(module_dir, "..", "..", "temp"))
        json_name = f"{source_proj}_{target_proj}_{race}_{gender}.json"
        json_path = os.path.join(temp_path, json_name)

        if not os.path.exists(json_path):
            QtWidgets.QMessageBox.critical(self, "JSON Missing", f"JSON not found:\n{json_path}")
            return

        try:
            anim_utils.load_template_and_apply_animation(source_proj, target_proj, race, gender)
            QtWidgets.QMessageBox.information(self, "Import Complete", "Animation imported successfully.")
        except Exception as e:
            QtWidgets.QMessageBox.critical(self, "Error", str(e))
