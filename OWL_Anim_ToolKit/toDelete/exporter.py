from PySide2 import QtWidgets


class AnimExportWidget(QtWidgets.QWidget):
    def __init__(self, parent=None):
        super(AnimExportWidget, self).__init__(parent)
        self.setObjectName("AnimExportWidget")
        self.setup_ui()

    def setup_ui(self):
        self.setMinimumSize(500, 250)

        main_layout = QtWidgets.QVBoxLayout(self)
        main_layout.setContentsMargins(10, 10, 10, 10)
        main_layout.setSpacing(10)

        # Character selection
        self.set_character_combo_box = QtWidgets.QFontComboBox()
        main_layout.addWidget(self.set_character_combo_box)

        # Animation clips section
        clips_layout = QtWidgets.QVBoxLayout()
        self.export_into_clips_chk_btn = QtWidgets.QCheckBox("Export Into Clips")
        clips_layout.addWidget(self.export_into_clips_chk_btn)

        clips_controls_layout = QtWidgets.QHBoxLayout()
        self.number_of_clips_label = QtWidgets.QLabel("Number of Clips: 0")
        clips_controls_layout.addWidget(self.number_of_clips_label)

        clips_controls_layout.addStretch()
        self.set_clips_btn = QtWidgets.QPushButton("Set Clips")
        self.reset_clips_btn = QtWidgets.QPushButton("Reset Clips")
        clips_controls_layout.addWidget(self.set_clips_btn)
        clips_controls_layout.addWidget(self.reset_clips_btn)

        clips_layout.addLayout(clips_controls_layout)
        main_layout.addLayout(clips_layout)

        # Export buttons
        export_btn_layout = QtWidgets.QHBoxLayout()
        self.export_cur_btn = QtWidgets.QPushButton("Export Current")
        self.export_batch_btn = QtWidgets.QPushButton("Export Batch")
        export_btn_layout.addWidget(self.export_cur_btn)
        export_btn_layout.addWidget(self.export_batch_btn)

        main_layout.addLayout(export_btn_layout)
