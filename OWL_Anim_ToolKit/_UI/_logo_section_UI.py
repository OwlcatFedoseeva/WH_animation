# logo_section.py
import os
from PySide2 import QtWidgets, QtGui, QtCore

def create_logo_section(module_directory):
    layout = QtWidgets.QVBoxLayout()
    layout.setContentsMargins(0, 0, 0, 0)

    label = QtWidgets.QLabel("Set Character Type", alignment=QtCore.Qt.AlignCenter)
    layout.addWidget(label)

    logo = QtWidgets.QLabel(alignment=QtCore.Qt.AlignCenter)
    logo_path = os.path.join(module_directory, 'icons', 'OwlHeader.png')
    if os.path.exists(logo_path):
        logo.setPixmap(QtGui.QPixmap(logo_path))
    else:
        logo.setText("Logo not found")

    layout.addWidget(logo)
    return layout
