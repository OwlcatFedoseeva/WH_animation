import os
import maya.cmds as cmds

VERSION = "0.1.0"

# UI const
UI_WINDOW_WIDTH = 500
UI_WINDOW_HEIGHT = 600
UI_BUTTON_HEIGHT_SMALL = 20
UI_BUTTON_HEIGHT_BIG = 40
UI_SEPARATOR_SMALL = 5
UI_SEPARATOR_BIG = 10

UI_COLOR_GREEN = (0.0, 0.4, 0.0)
UI_COLOR_RED = (0.52, 0.24, 0.25)
UI_COLOR_NEUTRAL_DEFAULT = (0.43, 0.43, 0.43)

# Project paths
def get_path_project():
    print("DEBUG_get_path_project")
    # We added two strings to the Maya.env for a reason. If we return the PYTHONPATH string, we get a long
    # string of different paths. In order not to mess with it, we added a clean path to the project icons.
    return os.getenv('PROJECTPATH', '')

def get_path_icon():
    print("DEBUG_get_path_icon")
    # The result will be X:\YourRepoPath\OwlcatMayaArtPlugin\icons
    # when used, join with the file name
    return os.path.join(get_path_project(), "icons")

# UI separators
def draw_separator_space_small():
    cmds.separator(height=UI_SEPARATOR_SMALL, style='none')

def draw_separator_space_big():
    cmds.separator(height=UI_SEPARATOR_BIG, style='none')

def draw_separator_line():
    cmds.separator(height=UI_SEPARATOR_SMALL, style='none')
    cmds.separator(style='in')
    cmds.separator(height=UI_SEPARATOR_SMALL, style='none')