from PySide2 import QtWidgets

def create_logger_section(self):
    layout = QtWidgets.QHBoxLayout()
    checkboxes = {}

    for label in ["DEBUG", "WARNING", "ERROR"]:
        checkbox = QtWidgets.QCheckBox(f"{label} mode")
        checkboxes[label] = checkbox
        layout.addWidget(checkbox)

    clear_log_btn = QtWidgets.QPushButton("Clear LOG")
    export_log_btn = QtWidgets.QPushButton("Export LOG")
    layout.addWidget(clear_log_btn)
    layout.addWidget(export_log_btn)

    return layout, checkboxes, clear_log_btn, export_log_btn
