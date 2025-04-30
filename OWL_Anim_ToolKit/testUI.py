import maya.cmds as cmds
import sys
import os

from PySide2 import QtCore, QtGui, QtWidgets
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin
import importlib
import json

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(500, 860)

        self.centralwidget = QtWidgets.QWidget(MainWindow)
        MainWindow.setCentralWidget(self.centralwidget)

        self.setup_header()
        self.setup_project_selector()
        self.setup_tabs()
        self.setup_progress_bar()
        self.setup_logging_controls()
        self.setup_logger_window()

        self.retranslateUi(MainWindow)
        self.tabWidget.setCurrentIndex(0)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def setup_header(self):
        self.logo = QtWidgets.QLabel(self.centralwidget)
        self.logo.setGeometry(QtCore.QRect(0, 0, 501, 81))
        self.logo.setPixmap(QtGui.QPixmap("C:\\Users\\OGFedoseeva\\Documents\\maya\\scripts\\OWL_Anim_ToolKit\\icons/OwlHeader.png"))
        self.logo.setObjectName("logo")

        self.under_logo_line = QtWidgets.QFrame(self.centralwidget)
        self.under_logo_line.setGeometry(QtCore.QRect(0, 80, 500, 16))
        self.under_logo_line.setFrameShape(QtWidgets.QFrame.HLine)
        self.under_logo_line.setFrameShadow(QtWidgets.QFrame.Sunken)

    def setup_project_selector(self):
        container = QtWidgets.QWidget(self.centralwidget)
        container.setGeometry(QtCore.QRect(0, 90, 501, 31))
        layout = QtWidgets.QHBoxLayout(container)
        layout.setContentsMargins(0, 0, 0, 0)

        self.label = QtWidgets.QLabel("Project:")
        font = QtGui.QFont("Tahoma", 12)
        self.label.setFont(font)
        self.label.setAlignment(QtCore.Qt.AlignCenter)
        layout.addWidget(self.label)

        self.set_project_combo_box = QtWidgets.QComboBox()
        layout.addWidget(self.set_project_combo_box)

        self.add_project_btn = QtWidgets.QPushButton("Add New Project")
        layout.addWidget(self.add_project_btn)

        self.project_separator = QtWidgets.QFrame(self.centralwidget)
        self.project_separator.setGeometry(QtCore.QRect(0, 120, 501, 16))
        self.project_separator.setFrameShape(QtWidgets.QFrame.HLine)
        self.project_separator.setFrameShadow(QtWidgets.QFrame.Sunken)

    def setup_tabs(self):
        container = QtWidgets.QWidget(self.centralwidget)
        container.setGeometry(QtCore.QRect(-1, 139, 501, 351))
        layout = QtWidgets.QVBoxLayout(container)
        layout.setContentsMargins(0, 0, 0, 0)

        self.tabWidget = QtWidgets.QTabWidget()
        self.export_anim_tab = QtWidgets.QWidget()
        self.convert_anim_tab = QtWidgets.QWidget()
        self.tabWidget.addTab(self.export_anim_tab, "Export Animation")
        self.tabWidget.addTab(self.convert_anim_tab, "Convert Animation")
        layout.addWidget(self.tabWidget)

    def setup_progress_bar(self):
        separator = QtWidgets.QFrame(self.centralwidget)
        separator.setGeometry(QtCore.QRect(0, 490, 501, 16))
        separator.setFrameShape(QtWidgets.QFrame.HLine)
        separator.setFrameShadow(QtWidgets.QFrame.Sunken)

        container = QtWidgets.QWidget(self.centralwidget)
        container.setGeometry(QtCore.QRect(0, 510, 501, 31))
        layout = QtWidgets.QVBoxLayout(container)
        layout.setContentsMargins(0, 0, 0, 0)

        self.progressBar = QtWidgets.QProgressBar()
        self.progressBar.setValue(24)
        layout.addWidget(self.progressBar)

    def setup_logging_controls(self):

        self.logging_controls_layout = QtWidgets.QHBoxLayout()
        self.logging_controls_layout.setContentsMargins(0, 0, 0, 0)
        self.main_layout.addLayout(self.logging_controls_layout)

        container = QtWidgets.QWidget(self.centralwidget)
        container.setGeometry(QtCore.QRect(0, 550, 501, 31))
        self.logging_controls_layout = QtWidgets.QGridLayout(container)
        self.logging_controls_layout.addWidget(self.export_log_btn)

        self.debug_check_btn = QtWidgets.QCheckBox("DEBUG mode")
        self.logging_controls_layout.addWidget(self.debug_check_btn)

        self.warning_check_btn = QtWidgets.QCheckBox("WARNING mode")
        self.logging_controls_layout.addWidget(self.warning_check_btn)

        self.error_check_btn = QtWidgets.QCheckBox("ERROR mode")
        self.logging_controls_layout.addWidget(self.error_check_btn)

        self.clear_log_btn = QtWidgets.QPushButton("Clear LOG")
        self.logging_controls_layout.addWidget(self.clear_log_btn)

        self.export_log_btn = QtWidgets.QPushButton("Export LOG")
        self.logging_controls_layout.addWidget(self.export_log_btn)

    def setup_logger_window(self):
        container = QtWidgets.QWidget(self.centralwidget)
        container.setGeometry(QtCore.QRect(-1, 589, 501, 271))
        layout = QtWidgets.QVBoxLayout(container)
        layout.setContentsMargins(0, 0, 0, 0)

        self.logger_scroll_area = QtWidgets.QScrollArea()
        self.logger_scroll_area.setWidgetResizable(True)
        layout.addWidget(self.logger_scroll_area)

        self.scrollAreaWidgetContents = QtWidgets.QWidget()
        self.scrollAreaWidgetContents.setGeometry(QtCore.QRect(0, 0, 497, 267))
        self.logger_scroll_area.setWidget(self.scrollAreaWidgetContents)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "OWL Animation Toolkit"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())
