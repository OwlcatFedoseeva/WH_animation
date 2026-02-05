from PySide2 import QtWidgets
import importlib
from OWL_AnimStudioLib_Tool._UI._tabsUI import _SL_ImportAnim_Tab_UI, _SL_ExportAnim_Tab_UI

# Перезагружаем их
importlib.reload(_SL_ImportAnim_Tab_UI)
importlib.reload(_SL_ExportAnim_Tab_UI)


# Импортируем виджеты уже после reload
from OWL_AnimStudioLib_Tool._UI._tabsUI._SL_ExportAnim_Tab_UI import SLAnimExportWidget
from OWL_AnimStudioLib_Tool._UI._tabsUI._SL_ImportAnim_Tab_UI import SLAnimImportWidget

def create_tabs_section(self, logger_widget=None):
    # Создание вкладок
    tabs = QtWidgets.QTabWidget(self)
    
    # Вкладка для экспорта анимации
    export_tab = QtWidgets.QWidget()
    tabs.addTab(export_tab, "Export Animation to SL")

    # Вкладка для конвертации анимации
    import_tab = QtWidgets.QWidget()
    tabs.addTab(import_tab, "Import Animation from SL")

    # Лэйаут для вкладки "Export Animation"
    anim_export_layout = QtWidgets.QVBoxLayout(export_tab)
    anim_import_layout_layout = QtWidgets.QVBoxLayout(import_tab)


    # Создание UI экспортера анимации и добавление его в лэйаут
    anim_export_widget = SLAnimExportWidget()
    anim_export_layout.addWidget(anim_export_widget)  # Добавляем его в лэйаут вкладки

    anim_import_widget = SLAnimImportWidget()
    anim_import_layout_layout.addWidget(anim_import_widget)



    return tabs
