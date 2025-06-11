import os
import json
import importlib
from PySide2 import QtWidgets
from maya import cmds

# Reload updated modules (hot-reload during development)
modules_to_reload = ['_logic.project_loader', '_UI._add_project_window']
for mod_name in modules_to_reload:
    mod = importlib.import_module(mod_name)
    importlib.reload(mod)

# Only import after reloading
from _logic import project_loader
from _UI._add_project_window import AddProjectWindow


def refresh_project_combo(project_combo):
    """Заполняет QComboBox списком проектов из папки project_data."""
    project_data_dir = os.path.join(cmds.internalVar(userAppDir=True), 'scripts', 'OWL_Anim_ToolKit', 'project_data')
    print(f"[DEBUG] Looking in: {project_data_dir}")

    project_paths = {}

    if not os.path.exists(project_data_dir):
        print(f"[ERROR] Directory not found: {project_data_dir}")
        return project_paths

    try:
        project_files = [f for f in os.listdir(project_data_dir) if f.endswith('.json')]
        print(f"[DEBUG] Found project files: {project_files}")

        project_combo.clear()
        project_combo.addItem("Choose Project")

        for project_file in project_files:
            project_name = os.path.splitext(project_file)[0]
            project_combo.addItem(project_name)
            project_paths[project_name] = os.path.join(project_data_dir, project_file)

    except Exception as e:
        print(f"[ERROR] An unexpected error occurred while loading project files: {e}")

    return project_paths


def on_project_selected(project_combo, project_paths):
    """Вызывается при выборе проекта в списке."""
    project_name = project_combo.currentText()
    if project_name == "Choose Project":
        return

    print(f"[DEBUG] Selected Project: {project_name}")
    project_json_path = project_paths.get(project_name)

    if project_json_path:
        load_project_data(project_json_path)


def load_project_data(json_file_path):
    """Загружает и отображает данные проекта из JSON."""
    if not os.path.exists(json_file_path):
        print(f"[ERROR] Project data file not found: {json_file_path}")
        return

    try:
        with open(json_file_path, 'r') as f:
            project_info = json.load(f)
            print(f"[DEBUG] Loaded data for project: {project_info}")
    except Exception as e:
        print(f"[ERROR] Failed to load project: {e}")


def create_project_section(parent=None):
    """Создает секцию UI с выбором и добавлением проектов."""
    layout = QtWidgets.QHBoxLayout()

    project_combo = QtWidgets.QComboBox()
    layout.addWidget(project_combo)

    add_new_project_btn = QtWidgets.QPushButton("Add New Project")
    layout.addWidget(add_new_project_btn)

    # Загрузка проектов
    project_paths = refresh_project_combo(project_combo)
    project_combo.currentIndexChanged.connect(lambda: on_project_selected(project_combo, project_paths))

    # Кнопка: открыть окно добавления проекта
    def open_add_project_window():
        dialog = AddProjectWindow()
        dialog.exec_()
        # Обновить проекты после закрытия окна
        refreshed_paths = refresh_project_combo(project_combo)
        project_combo.currentIndexChanged.connect(lambda: on_project_selected(project_combo, refreshed_paths))

    add_new_project_btn.clicked.connect(open_add_project_window)

    return layout, project_combo
