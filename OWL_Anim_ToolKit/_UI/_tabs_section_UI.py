
from PySide2 import QtWidgets

def create_tabs_section(self):
    tabs = QtWidgets.QTabWidget()
    tabs.addTab(QtWidgets.QWidget(), "Export Animation")
    tabs.addTab(QtWidgets.QWidget(), "Convert Animation")
    return tabs
