from PySide2 import QtWidgets
from _logic import logging_process

from PySide2 import QtWidgets

class LoggerWidget(QtWidgets.QTextEdit):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setReadOnly(True)
        self.setMinimumHeight(100)

    def append_log(self, html_message):
        self.append(html_message)
        QtWidgets.QApplication.processEvents()

def create_logger_section(parent=None):
    logger_widget = LoggerWidget(parent)
    layout = QtWidgets.QVBoxLayout()
    layout.addWidget(logger_widget)
    return layout, logger_widget
