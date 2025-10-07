# _UI/_widgets/clip_row.py (или рядом с exporter_tab)
from PySide2 import QtWidgets, QtCore, QtGui

class ClipRow(QtWidgets.QWidget):
    removed = QtCore.Signal(object)  # эмитится при удалении (self)

    def __init__(self, default_name="", start=0, end=0, parent=None):
        super().__init__(parent)
        self.setLayout(QtWidgets.QHBoxLayout())
        self.layout().setContentsMargins(0,0,0,0)
        self.layout().setSpacing(6)

        self.name_edit  = QtWidgets.QLineEdit(default_name)
        self.start_edit = QtWidgets.QSpinBox()
        self.end_edit   = QtWidgets.QSpinBox()
        self.remove_btn = QtWidgets.QToolButton()
        self.remove_btn.setText("–")
        self.remove_btn.setAutoRaise(True)
        self.remove_btn.setToolTip("Удалить клип")

        # FPS и таймлайн обычно до сотен/тысяч — выставь здравые пределы:
        self.start_edit.setRange(-100000, 100000)
        self.end_edit.setRange(-100000, 100000)

        self.layout().addWidget(QtWidgets.QLabel("Name"))
        self.layout().addWidget(self.name_edit, 2)
        self.layout().addWidget(QtWidgets.QLabel("Start"))
        self.layout().addWidget(self.start_edit, 1)
        self.layout().addWidget(QtWidgets.QLabel("End"))
        self.layout().addWidget(self.end_edit, 1)
        self.layout().addWidget(self.remove_btn, 0)

        self.remove_btn.clicked.connect(lambda: self.removed.emit(self))

    def value(self):
        return (self.name_edit.text().strip(),
                int(self.start_edit.value()),
                int(self.end_edit.value()))
