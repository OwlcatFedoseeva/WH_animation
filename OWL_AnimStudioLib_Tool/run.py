import sys
import importlib
import os
import maya.cmds as cmds


USERAPPDIR = cmds.internalVar(userAppDir=True)
SCRIPTS_DIR = os.path.join(USERAPPDIR, 'scripts')
if SCRIPTS_DIR not in sys.path:
    sys.path.insert(0, SCRIPTS_DIR)

from OWL_AnimStudioLib_Tool import OWL_AnimStudioLib_Tool_UI

OWL_AnimStudioLib_Tool_UI.main()
