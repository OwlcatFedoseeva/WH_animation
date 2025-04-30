# _UI/_project_section_UI.py

from PySide2 import QtWidgets, QtGui, QtCore
from _logic import project_loader

def create_project_section(ui):
    layout = QtWidgets.QHBoxLayout()

    label = QtWidgets.QLabel('Project:', alignment=QtCore.Qt.AlignCenter)
    label.setFont(QtGui.QFont("Tahoma", 12))

    ui.project_combo = QtWidgets.QComboBox()
    ui.add_project_btn = QtWidgets.QPushButton("Add New Project")

    # Подгружаем проекты из JSON
    try:
        projects = project_loader.load_projects()
        for name in projects:
            ui.project_combo.addItem(name)
        ui.project_paths = projects  # сохраняем путь по названию
    except FileNotFoundError as e:
        print(f"[ERROR] {e}")

    layout.addWidget(label)
    layout.addWidget(ui.project_combo)
    layout.addWidget(ui.add_project_btn)
    return layout
