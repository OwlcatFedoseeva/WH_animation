import os
from PySide2 import QtWidgets, QtCore
import maya.cmds as cmds
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin
import importlib

modules_to_reload = ['_UI._logo_section_UI', '_UI._project_section_UI',
    '_UI._tabs_section_UI', '_UI._progress_section_UI',
    '_UI._logger_section_UI', '_logic.utils']

for mod_name in modules_to_reload:
    mod = importlib.import_module(mod_name)
    importlib.reload(mod)

from _UI._logo_section_UI import create_logo_section
from _UI._project_section_UI import create_project_section
from _UI._tabs_section_UI import create_tabs_section
from _UI._progress_section_UI import create_progress_section
from _UI._logger_section_UI import create_logger_section
from _logic.utils import clear_temp_files

USERAPPDIR = cmds.internalVar(userAppDir=True)
MODULE_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'OWL_Anim_ToolKit')
temp_dir = os.path.normpath(os.path.join(MODULE_DIRECTORY, "temp"))

# Очищаем временные файлы
clear_temp_files(temp_dir)
class OWLAnimKitUI(MayaQWidgetDockableMixin, QtWidgets.QDialog):
    def __init__(self):
        super().__init__()
        self.setWindowTitle('OWL Animation Kit v1.3')
        self.setObjectName("OWLAnimationKitID")
        self.setMinimumSize(500, 860)
        self.setMaximumSize(500, 860)
        self.setWindowFlags(QtCore.Qt.Tool)
        self._build_ui()

    def _build_ui(self):
        layout = QtWidgets.QVBoxLayout(self)
        layout.setAlignment(QtCore.Qt.AlignTop)
        layout.setContentsMargins(5, 5, 5, 5)
        layout.setSpacing(5)

        try:
            layout.addLayout(create_logo_section(MODULE_DIRECTORY))
            layout.addWidget(self._divider())

            project_section, self.project_combo = create_project_section(self)
            layout.addLayout(project_section)
            layout.addWidget(self._divider())

            # 🛠️ Создаём логгер, но не добавляем в layout пока
            logger_layout, self.logger_widget = create_logger_section(self)

            # ✅ Теперь передаём self.logger_widget во вкладки
            layout.addWidget(create_tabs_section(self))
            layout.addWidget(self._divider())

            self.progress_bar = create_progress_section(self)
            layout.addWidget(self.progress_bar)
            layout.addWidget(self._divider())

            # 🔽 Только теперь добавляем логгер в самый низ
            layout.addLayout(logger_layout)

        except Exception as e:
            cmds.warning(f"Error building UI: {e}")


    def _divider(self):
        line = QtWidgets.QFrame()
        line.setFrameShape(QtWidgets.QFrame.HLine)
        line.setFrameShadow(QtWidgets.QFrame.Sunken)
        return line
    
    def update_progress(self, value):
        if hasattr(self, "progress_bar") and self.progress_bar:
            self.progress_bar.setValue(value)
            QtWidgets.QApplication.processEvents()  # обновление UI



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
