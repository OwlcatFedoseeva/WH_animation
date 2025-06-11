import sys
import importlib
import os
import maya.cmds as cmds

user_scripts_dir = os.path.join(cmds.internalVar(userAppDir=True), "scripts")
toolkit_path = os.path.join(user_scripts_dir, "OWL_Anim_ToolKit")

if toolkit_path not in sys.path:
    sys.path.append(toolkit_path)
import OWL_Anim_ToolKit_UI
importlib.reload(OWL_Anim_ToolKit_UI)

OWL_Anim_ToolKit_UI.main()
