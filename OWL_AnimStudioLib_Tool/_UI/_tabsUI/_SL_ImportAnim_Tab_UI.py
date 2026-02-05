
from PySide2 import QtWidgets, QtCore, QtGui
import importlib
import maya.cmds as cmds
import os, glob, json

modules_to_reload = ['OWL_AnimStudioLib_Tool._logic.SL_Import_Anim']
for mod_name in modules_to_reload:
    mod = importlib.import_module(mod_name)
    importlib.reload(mod)

from OWL_AnimStudioLib_Tool._logic.SL_Import_Anim import batch_import_from_library

class SLAnimImportWidget(QtWidgets.QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._build_ui()

    def _build_ui(self):
        # main widget and base layout
        main_layout = QtWidgets.QVBoxLayout()
        main_layout.setContentsMargins(8, 8, 8, 8)
        main_layout.setSpacing(6)
        self.setLayout(main_layout)

        # --- RIG selection ---

        rig_row = QtWidgets.QHBoxLayout()
        rig_row.setSpacing(6)
        self.rig_field = QtWidgets.QLineEdit()
        self.rig_field.setPlaceholderText("Rig File")
        self.rig_field.setMinimumHeight(22)
        rig_row.addWidget(self.rig_field)

        self.rig_set_btn = QtWidgets.QPushButton("Select")
        self.rig_set_btn.setFixedWidth(60)
        self.rig_set_btn.clicked.connect(self._on_set_rig)
        rig_row.addWidget(self.rig_set_btn)
        main_layout.addLayout(rig_row)
        # --- Row: Source ---

        src_row = QtWidgets.QHBoxLayout()
        src_row.setSpacing(6)
        self.src_field = QtWidgets.QLineEdit()
        self.src_field.setPlaceholderText("Set Studio Library Folder")
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
        self.dst_field.setPlaceholderText("Set the Destination Folder")
        self.dst_field.setMinimumHeight(22)
        dst_row.addWidget(self.dst_field)

        self.dst_set_btn = QtWidgets.QPushButton("SET")
        self.dst_set_btn.setFixedWidth(60)
        self.dst_set_btn.clicked.connect(self._on_set_dst)
        dst_row.addWidget(self.dst_set_btn)
        main_layout.addLayout(dst_row)

        # --- Row: Scale Value ---
        scale_row = QtWidgets.QHBoxLayout()
        scale_row.setSpacing(6)
        self.scale_field = QtWidgets.QLineEdit()
        self.scale_field.setPlaceholderText("Set the Scale Value (default 1.0)")
        self.scale_field.setMinimumHeight(22)
        # allow only positive decimals (no zero). Default to 1.0
        validator = QtGui.QDoubleValidator(0.000001, 1_000_000.0, 6, self.scale_field)
        validator.setNotation(QtGui.QDoubleValidator.StandardNotation)
        validator.setLocale(QtCore.QLocale(QtCore.QLocale.C))
        self.scale_field.setValidator(validator)
        self.scale_field.setText("1.0")
        scale_row.addWidget(self.scale_field)
        main_layout.addLayout(scale_row)




        # spacer
        main_layout.addStretch(1)

        # --- EXPORT button (big) ---
        self.export_btn = QtWidgets.QPushButton("Create Animation Files")
        self.export_btn.setMinimumHeight(56)
        # Make export button visually centered and full width
        self.export_btn.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Fixed)
        self.export_btn.clicked.connect(self._on_import_clicked)

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

    def apply_timeline_from_meta(anim_item_folder):
        # 1) Find any meta json in this folder
        candidates = glob.glob(os.path.join(anim_item_folder, "*.sl_meta.json"))
        if not candidates:
            print("[SL Import] No .sl_meta.json found in:", anim_item_folder)
            return False

        meta_path = candidates[0]  # or choose best match if you want
        print("[SL Import] Using meta:", meta_path)

        # 2) Load meta
        with open(meta_path, "r", encoding="utf-8") as f:
            meta = json.load(f)

        # 3) Apply (guard keys)
        time_unit = meta.get("timeUnit") or meta.get("fps")  # depends on how you wrote it
        if time_unit:
            try:
                cmds.currentUnit(time=str(time_unit))
            except Exception as e:
                print("[SL Import] Failed to set time unit:", time_unit, e)

        start = meta.get("start")
        end   = meta.get("end")
        if start is not None and end is not None:
            cmds.playbackOptions(min=start, max=end, ast=start, aet=end)
            print(f"[SL Import] Timeline set to {start} - {end}")
            return True

        print("[SL Import] Meta missing start/end keys:", meta_path)
        return False

    def _on_set_rig(self):
        file_path, _ = QtWidgets.QFileDialog.getOpenFileName(self, "Select rig file", os.path.expanduser("~"), "Maya Files (*.ma *.mb)")
        if file_path:
            # normalize to forward slashes to avoid unicodeescape issues in prints
            file_path = file_path.replace("\\", "/")
            self.rig_field.setText(file_path)

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

    def _on_import_clicked(self):
        rig = self.rig_field.text().strip()
        src = self.src_field.text().strip()
        dst = self.dst_field.text().strip()
        scale_text = self.scale_field.text().strip()

        
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
            batch_import_from_library(rig, src, dst, scale_value=scale_text,
                              recursive=True, use_current_selection=False,
                              spacing=1, apply_json_settings=True)
            self.status_label.setText("Import finished. See Script Editor for details.")
        except Exception as e:
            import traceback
            traceback.print_exc()
            self.status_label.setText("Error — see Script Editor.")
            QtWidgets.QMessageBox.critical(self, "Import Error", str(e))
        finally:
            self.export_btn.setEnabled(True)

    def open_anim_studio_lib(self):
        pass

    def reload_ui(self):
        pass
