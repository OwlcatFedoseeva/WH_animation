# _UI/_projectUI/add_project_window.py

from PySide2 import QtWidgets, QtCore, QtGui
import os
import json
import maya.cmds as cmds


class AddProjectWindow(QtWidgets.QDialog):
    def __init__(self, parent=None):
        super(AddProjectWindow, self).__init__(parent)
        self.setWindowTitle("Add New Project")
        self.setMinimumWidth(500)
        self.init_ui()

    def init_ui(self):
        layout = QtWidgets.QVBoxLayout(self)
        layout.setAlignment(QtCore.Qt.AlignTop)

        header = QtWidgets.QLabel("Add New Project")
        header.setAlignment(QtCore.Qt.AlignCenter)
        font = QtGui.QFont()
        font.setPointSize(11)
        font.setBold(True)
        font.setUnderline(True)
        header.setFont(font)
        layout.addWidget(header)

        grid = QtWidgets.QGridLayout()

        grid.addWidget(QtWidgets.QLabel("Project Name:"), 0, 0)
        self.project_name_edit = QtWidgets.QLineEdit()
        self.project_name_edit.setPlaceholderText("Enter name of new project")
        grid.addWidget(self.project_name_edit, 0, 1, 1, 2)

        grid.addWidget(QtWidgets.QLabel("Local Path:"), 1, 0)
        self.local_path_edit = QtWidgets.QLineEdit()
        self.local_path_edit.setPlaceholderText("Path to local SVN files")
        grid.addWidget(self.local_path_edit, 1, 1)
        self.local_path_btn = QtWidgets.QPushButton("Set")
        self.local_path_btn.clicked.connect(self.set_local_path)
        grid.addWidget(self.local_path_btn, 1, 2)

        grid.addWidget(QtWidgets.QLabel("Project Path:"), 2, 0)
        self.project_path_edit = QtWidgets.QLineEdit()
        self.project_path_edit.setPlaceholderText("Path to project files")
        grid.addWidget(self.project_path_edit, 2, 1)
        self.project_path_btn = QtWidgets.QPushButton("Set")
        self.project_path_btn.clicked.connect(self.set_project_path)
        grid.addWidget(self.project_path_btn, 2, 2)

        grid.addWidget(QtWidgets.QLabel("Export Folder:"), 3, 0)
        self.export_folder_edit = QtWidgets.QLineEdit()
        self.export_folder_edit.setPlaceholderText("Where to export animations")
        grid.addWidget(self.export_folder_edit, 3, 1)
        self.export_folder_btn = QtWidgets.QPushButton("Set")
        self.export_folder_btn.clicked.connect(self.set_export_path)
        grid.addWidget(self.export_folder_btn, 3, 2)

        layout.addLayout(grid)

        self.add_project_btn = QtWidgets.QPushButton("Add Project")
        self.add_project_btn.setFixedHeight(32)
        self.add_project_btn.clicked.connect(self.save_project_data)
        layout.addWidget(self.add_project_btn)

    def set_local_path(self):
        folder = QtWidgets.QFileDialog.getExistingDirectory(self, "Select Local Path")
        if folder:
            self.local_path_edit.setText(folder)

    def set_project_path(self):
        folder = QtWidgets.QFileDialog.getExistingDirectory(self, "Select Project Path")
        if folder:
            self.project_path_edit.setText(folder)

    def set_export_path(self):
        folder = QtWidgets.QFileDialog.getExistingDirectory(self, "Select Export Folder")
        if folder:
            self.export_folder_edit.setText(folder)

    def get_project_data(self):
        return {
            "project_name": self.project_name_edit.text().strip(),
            "local_path": self.local_path_edit.text().strip(),
            "project_path": self.project_path_edit.text().strip(),
            "export_path": self.export_folder_edit.text().strip(),
        }

    def save_project_data(self):
        data = self.get_project_data()
        project_name = data["project_name"]

        if not project_name:
            QtWidgets.QMessageBox.warning(self, "Missing Data", "Please enter a project name.")
            return

        # Получаем путь до папки OWL_Anim_ToolKit
        USERAPPDIR = cmds.internalVar(userAppDir=True)
        toolkit_path = os.path.join(USERAPPDIR, 'scripts', 'OWL_Anim_ToolKit')
        project_data_dir = os.path.join(toolkit_path, 'project_data')
        os.makedirs(project_data_dir, exist_ok=True)

        save_path = os.path.join(project_data_dir, f"{project_name}.json")
        try:
            with open(save_path, "w") as f:
                json.dump(data, f, indent=4)
            QtWidgets.QMessageBox.information(self, "Success", f"Project '{project_name}' saved!")
            self.accept()  # Закрываем окно
        except Exception as e:
            QtWidgets.QMessageBox.critical(self, "Error", f"Failed to save project file:\n{e}")
