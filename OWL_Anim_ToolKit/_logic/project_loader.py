import os
import json


USERAPPDIR = os.getenv('MAYA_APP_DIR') or os.path.expanduser('~/Documents/maya')
MODULE_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'OWL_Anim_ToolKit')
PROJECT_DATA_DIR = os.path.join(MODULE_DIRECTORY, 'project_data')

def add_new_project():
    pass


def get_project_data(project_name):
    this_dir = os.path.dirname(__file__)  # путь до _logic
    project_data_dir = os.path.normpath(os.path.join(this_dir, "..", "project_data"))
    project_file = os.path.join(project_data_dir, f"{project_name}.json")

    if not os.path.exists(project_file):
        raise FileNotFoundError(f"[ProjectLoader] JSON not found: {project_file}")

    with open(project_file, "r", encoding="utf-8") as f:
        return json.load(f)