from PySide2 import QtWidgets
from _logic import logging_process

def create_logger_section(parent):
    parent.log_display = QtWidgets.QTextEdit(parent)
    parent.log_display.setReadOnly(True)
    parent.log_display.setPlaceholderText("Log messages will appear here...")

    clear_log_btn = QtWidgets.QPushButton("Clear LOG")
    export_log_btn = QtWidgets.QPushButton("Export LOG")

    clear_log_btn.clicked.connect(logging_process.clear_log)
    export_log_btn.clicked.connect(logging_process.export_log)

    logger_setting_layout = QtWidgets.QVBoxLayout()
    logger_setting_layout.addWidget(parent.log_display)
    logger_setting_layout.addWidget(clear_log_btn)
    logger_setting_layout.addWidget(export_log_btn)

    return logger_setting_layout
