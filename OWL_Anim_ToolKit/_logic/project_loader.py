import os
import json


USERAPPDIR = os.getenv('MAYA_APP_DIR') or os.path.expanduser('~/Documents/maya')
MODULE_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'OWL_Anim_ToolKit')
PROJECT_DATA_DIR = os.path.join(MODULE_DIRECTORY, 'project_data')

def add_new_project():
    pass