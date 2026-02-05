from PySide2 import QtWidgets, QtCore, QtGui
import importlib
import maya.cmds as cmds
import os

modules_to_reload = [
    'OWL_AnimStudioLib_Tool._logic.SL_Export_Anim',
    'OWL_AnimStudioLib_Tool._utils.JSON_Export_Scene_Data',
]
for mod_name in modules_to_reload:
    mod = importlib.import_module(mod_name)
    importlib.reload(mod)

from OWL_AnimStudioLib_Tool._logic.SL_Export_Anim import batch_export_ma
from OWL_AnimStudioLib_Tool._utils.JSON_Export_Scene_Data import write_scene_metadata

class SLAnimExportWidget(QtWidgets.QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._build_ui()

    def _build_ui(self):
        # main widget and base layout
        main_layout = QtWidgets.QVBoxLayout()
        main_layout.setContentsMargins(8, 8, 8, 8)
        main_layout.setSpacing(6)
        self.setLayout(main_layout)
        src_row = QtWidgets.QHBoxLayout()
        src_row.setSpacing(6)
        self.src_field = QtWidgets.QLineEdit()
        self.src_field.setPlaceholderText("Source Folder")
        # make it visually subtle like your screenshot
        self.src_field.setMinimumHeight(22)
        src_row.addWidget(self.src_field)

        self.src_set_btn = QtWidgets.QPushButton("SET")
        self.src_set_btn.setFixedWidth(60)
        self.src_set_btn.clicked.connect(self._on_set_src)
        src_row.addWidget(self.src_set_btn)
        main_layout.addLayout(src_row)

        # --- Row: Destination ---
        dst_row = QtWidgets.QHBoxLayout()
        dst_row.setSpacing(6)
        self.dst_field = QtWidgets.QLineEdit()
        self.dst_field.setPlaceholderText("Destination Folder")
        self.dst_field.setMinimumHeight(22)
        dst_row.addWidget(self.dst_field)

        self.dst_set_btn = QtWidgets.QPushButton("SET")
        self.dst_set_btn.setFixedWidth(60)
        self.dst_set_btn.clicked.connect(self._on_set_dst)
        dst_row.addWidget(self.dst_set_btn)
        main_layout.addLayout(dst_row)

        # spacer
        main_layout.addStretch(1)

        # --- EXPORT button (big) ---
        self.export_btn = QtWidgets.QPushButton("EXPORT")
        self.export_btn.setMinimumHeight(56)
        # Make export button visually centered and full width
        self.export_btn.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Fixed)
        self.export_btn.clicked.connect(self._on_export_clicked)

        # put export button in its own layout to control margins
        export_row = QtWidgets.QHBoxLayout()
        export_row.addWidget(self.export_btn)
        main_layout.addLayout(export_row)

        # small status label below button
        self.status_label = QtWidgets.QLabel("Ready")
        self.status_label.setAlignment(QtCore.Qt.AlignCenter)
        self.status_label.setFixedHeight(18)
        main_layout.addWidget(self.status_label)

        # Prefill fields
        cur = cmds.file(q=True, sn=True) or ""
        if cur:
            self.src_field.setText(os.path.dirname(cur))
        # don't prefill dst automatically

    # ----- helper callbacks used above -----
    def _on_set_src(self):
        folder = QtWidgets.QFileDialog.getExistingDirectory(self, "Select source folder", os.path.expanduser("~"))
        if folder:
            # normalize to forward slashes to avoid unicodeescape issues in prints
            folder = folder.replace("\\", "/")
            self.src_field.setText(folder)

    def _on_set_dst(self):
        folder = QtWidgets.QFileDialog.getExistingDirectory(self, "Select destination folder", os.path.expanduser("~"))
        if folder:
            folder = folder.replace("\\", "/")
            self.dst_field.setText(folder)

    def _on_export_clicked(self):
        src = self.src_field.text().strip()
        dst = self.dst_field.text().strip()
        if not src or not os.path.isdir(src):
            QtWidgets.QMessageBox.critical(self, "Error", "Please choose a valid Source folder.")
            return
        if not dst:
            QtWidgets.QMessageBox.critical(self, "Error", "Please choose a Destination folder.")
            return

        # disable ui while running
        self.export_btn.setEnabled(False)
        self.status_label.setText("Running export…")
        try:
            # call your batch function. We assume it's imported: batch_export_ma
            batch_export_ma(src, dst, recursive=True, use_current_selection=False)
            # determine a clip name (prefer current scene name, fallback to destination folder name)
            scene_path = cmds.file(q=True, sn=True) or ""
            if scene_path:
                clip_name = os.path.splitext(os.path.basename(scene_path))[0]
            else:
                clip_name = os.path.basename(dst) or "untitled"

            # call writer with correct arg order: save_folder, clip_name, start, end, source_scene (optional)
   
            self.status_label.setText("Export finished. See Script Editor for details.")
        except Exception as e:
            import traceback
            traceback.print_exc()
            self.status_label.setText("Error — see Script Editor.")
            QtWidgets.QMessageBox.critical(self, "Export Error", str(e))
        finally:
            self.export_btn.setEnabled(True)

    def open_anim_studio_lib(self):
        pass

    def reload_ui(self):
        pass
