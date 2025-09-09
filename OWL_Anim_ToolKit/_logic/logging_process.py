import os
import sys
from PySide2 import QtWidgets, QtGui, QtCore
import maya.cmds as cmds
from datetime import datetime

class UILogger:
    def __init__(self, widget=None, log_to_console=True):
        self.widget = widget
        self.log_to_console = log_to_console

    def log(self, message, color="white"):
        timestamp = datetime.now().strftime("%H:%M:%S")
        html_message = f"<span style='color:{color}'>[{timestamp}] {message}</span>"

        # UI
        if self.widget and hasattr(self.widget, 'append_log'):
            self.widget.append_log(html_message)
        elif self.widget:  # fallback
            self.widget.append(html_message)

        # Console
        if self.log_to_console:
            print(f"[{timestamp}] {message}")
