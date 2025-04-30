import os
import json


USERAPPDIR = os.getenv('MAYA_APP_DIR') or os.path.expanduser('~/Documents/maya')
MODULE_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'OWL_Anim_ToolKit')
PROJECT_DATA_DIR = os.path.join(MODULE_DIRECTORY, 'project_data')

def load_projects():

    if not os.path.exists(PROJECT_DATA_DIR):
        raise FileNotFoundError(f"project_data directory not found: {PROJECT_DATA_DIR}")

    projects = {}
    for file in os.listdir(PROJECT_DATA_DIR):
        if file.endswith('.json'):
            project_name = os.path.splitext(file)[0]
            full_path = os.path.join(PROJECT_DATA_DIR, file)
            projects[project_name] = full_path
    return projects
