import os
from PySide2 import QtWidgets, QtCore
import maya.cmds as cmds
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin
import importlib

from OWL_AnimStudioLib_Tool._utils import config

modules_to_reload = ['OWL_AnimStudioLib_Tool._UI._tabs_section_UI']
for mod_name in modules_to_reload:
    mod = importlib.import_module(mod_name)
    importlib.reload(mod)

from OWL_AnimStudioLib_Tool._UI._tabs_section_UI import create_tabs_section

USERAPPDIR = cmds.internalVar(userAppDir=True)
MODULE_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'OWL_AnimStudioLib_Tool')


class OWL_AnimStudioLib_Tool_UI(MayaQWidgetDockableMixin, QtWidgets.QMainWindow):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle('OWL AnimStudioLib Tool v1.0')
        self.setObjectName("OWLAnimStudioLibToolID")
        # Подбери размер под дизайн
        self.setMinimumSize(420, 180)
        self.setMaximumSize(1200, 800)
        self.setWindowFlags(QtCore.Qt.Tool)

        # Построить интерфейс (внутри _build_ui создаётся centralWidget)
        self._build_menu()
        self._build_ui()

    def _build_menu(self):
        menu = self.menuBar().addMenu("Settings")
        action = QtWidgets.QAction("Studio Library Path...", self)
        action.triggered.connect(self._set_studio_lib_path)
        menu.addAction(action)

    def _set_studio_lib_path(self):
        current = config.get_studio_lib_src() or os.path.expanduser("~")
        folder = QtWidgets.QFileDialog.getExistingDirectory(
            self, "Select Studio Library src folder", current
        )
        if not folder:
            return
        folder = folder.replace("\\", "/")
        if config.set_studio_lib_src(folder):
            QtWidgets.QMessageBox.information(
                self,
                "Studio Library Path",
                "Saved. Please reopen the tool if it is already running.",
            )
        else:
            QtWidgets.QMessageBox.critical(
                self,
                "Studio Library Path",
                "Failed to save settings. Check file permissions.",
            )

    def _build_ui(self):
        

        central_widget = QtWidgets.QWidget()
        self.setCentralWidget(central_widget)
        main_layout = QtWidgets.QVBoxLayout(central_widget)
        main_layout.setContentsMargins(4, 4, 4, 4)
        main_layout.setSpacing(4)

        # Создание вкладок и добавление их в главный лэйаут
        tabs_section = create_tabs_section(self)
        main_layout.addWidget(tabs_section)
    


def main():
    # Удаление старого UI, если он уже существует
    for ui in ["OWLAnimStudioLibToolID"]:
        if cmds.window(ui, exists=True):
            cmds.deleteUI(ui, window=True)
        if cmds.windowPref(ui, exists=True):
            cmds.windowPref(ui, remove=True)

    global anim_kit_ui
    SL_Anim_kit_ui = OWL_AnimStudioLib_Tool_UI()
    SL_Anim_kit_ui.show()

main()



