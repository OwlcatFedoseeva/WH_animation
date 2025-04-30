import os
from PySide2 import QtWidgets, QtCore
import maya.cmds as cmds
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin

from _UI._logo_section_UI import create_logo_section
from _UI._project_section_UI import create_project_section
from _UI._tabs_section_UI import create_tabs_section
from _UI._progress_section_UI import create_progress_section
from _UI._logger_section_UI import create_logger_section


USERAPPDIR = cmds.internalVar(userAppDir=True)
MODULE_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'OWL_Anim_ToolKit')

class OWLAnimKitUI(MayaQWidgetDockableMixin, QtWidgets.QDialog):
    def __init__(self):
        super().__init__()
        self.setWindowTitle('OWL Animation Kit')
        self.setObjectName("OWLAnimationKitID")
        self.setMinimumSize(500, 860)
        self.setWindowFlags(QtCore.Qt.Tool)
        self._build_ui()

    def _build_ui(self):
        layout = QtWidgets.QVBoxLayout(self)
        layout.setAlignment(QtCore.Qt.AlignTop)
        layout.setContentsMargins(5, 5, 5, 5)
        layout.setSpacing(5)

        layout.addLayout(create_logo_section(MODULE_DIRECTORY))
        layout.addWidget(self._divider())
        layout.addLayout(create_project_section(self))
        layout.addWidget(self._divider())
        layout.addWidget(create_tabs_section())
        layout.addWidget(self._divider())
        layout.addWidget(create_progress_section(self))
        layout.addWidget(self._divider())
        layout.addLayout(create_logger_section(self))

    def _divider(self):
        line = QtWidgets.QFrame()
        line.setFrameShape(QtWidgets.QFrame.HLine)
        line.setFrameShadow(QtWidgets.QFrame.Sunken)
        return line

def main():
    # Удаление старого UI, если он уже существует
    for ui in ["OWLAnimationKitID"]:
        if cmds.window(ui, exists=True):
            cmds.deleteUI(ui, window=True)
        if cmds.windowPref(ui, exists=True):
            cmds.windowPref(ui, remove=True)

    global anim_kit_ui
    anim_kit_ui = OWLAnimKitUI()
    anim_kit_ui.show()
main()
