from PySide2 import QtWidgets
import importlib

# Импортируем модули для перезагрузки
from _UI._tabsUI import _exporter_tab, _converter_tab, _clearUnwantedAnimKeys_tab

# Перезагружаем их
importlib.reload(_exporter_tab)
importlib.reload(_converter_tab)
importlib.reload(_clearUnwantedAnimKeys_tab)

# Импортируем виджеты уже после reload
from _UI._tabsUI._exporter_tab import AnimExportWidget
from _UI._tabsUI._converter_tab import AnimationConverterWidget
from _UI._tabsUI._clearUnwantedAnimKeys_tab import CleanUnwantedAnimWidget

def create_tabs_section(self):
    # Создание вкладок
    tabs = QtWidgets.QTabWidget(self)

    # Вкладка для экспорта анимации
    export_tab = QtWidgets.QWidget()
    tabs.addTab(export_tab, "Export Animation")

    # Вкладка для конвертации анимации
    convert_tab = QtWidgets.QWidget()
    tabs.addTab(convert_tab, "Convert Animation")

    # Вкладка для чистки ненужных ключей анимации
    clean_anim_tab = QtWidgets.QWidget()
    tabs.addTab(clean_anim_tab, "Delete Animation Keys")

    # Лэйаут для вкладки "Export Animation"
    export_layout = QtWidgets.QVBoxLayout(export_tab)
    convert_layout = QtWidgets.QVBoxLayout(convert_tab)
    clear_anim_layout = QtWidgets.QVBoxLayout(clean_anim_tab)

    # Создание UI экспортера анимации и добавление его в лэйаут
    anim_export_widget = AnimExportWidget(self.project_combo)
    export_layout.addWidget(anim_export_widget)  # Добавляем его в лэйаут вкладки

    anim_convert_widget = AnimationConverterWidget(parent=convert_tab,
                                                    update_progress=self.update_progress,
                                                    logger_widget=self.logger_widget
                                                )
    convert_layout.addWidget(anim_convert_widget)

    clear_anim_widget = CleanUnwantedAnimWidget(clean_anim_tab)
    clear_anim_layout.addWidget(clear_anim_widget)


    return tabs
