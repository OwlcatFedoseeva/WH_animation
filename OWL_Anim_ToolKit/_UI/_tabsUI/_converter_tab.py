# _UI/_tabsUI/animation_converter_tab.py

from PySide2 import QtWidgets, QtCore
import os
import json
import maya.cmds as cmds
import importlib
import OWL_Anim_ToolKit._logic.bake_correct_export_anim as anim_utils
import OWL_Anim_ToolKit._logic.animation_convertion as anim_utils_test
import OWL_Anim_ToolKit._logic.animation_creature_convert as creature_anim_convert
import OWL_Anim_ToolKit._logic.utils as utils
import OWL_Anim_ToolKit._logic.file_handling_utils as file_utils
import _logic.logging_process as logging_process


importlib.reload(anim_utils)
importlib.reload(anim_utils_test)
importlib.reload(logging_process)
importlib.reload(creature_anim_convert)
importlib.reload(utils)
importlib.reload(file_utils)
from _logic.logging_process import UILogger

class AnimationConverterWidget(QtWidgets.QWidget):
    def __init__(self, parent=None, update_progress=None, logger_widget=None):
        super(AnimationConverterWidget, self).__init__(parent)
        self.project_data = {}
        self.settings_path = os.path.join(cmds.internalVar(userAppDir=True), "scripts", "OWL_Anim_ToolKit", "temp", "converter_settings.json")
        self.init_ui()
        self.load_projects()
        self.load_template_metadata()
        QtCore.QTimer.singleShot(0, self.load_user_settings)  # Moved here!
        self.update_progress = update_progress or (lambda x: None)
        self.logger = UILogger(widget=logger_widget)
        self.logger.log("🟢 Логгер успешно подключён!", color="green")


    def init_ui(self):
        main_layout = QtWidgets.QVBoxLayout(self)
        main_layout.setAlignment(QtCore.Qt.AlignTop)

        # Layout with combo boxes
        converter_layout = QtWidgets.QGridLayout()

        converter_layout.addWidget(QtWidgets.QLabel("From:"), 0, 0)
        converter_layout.addWidget(QtWidgets.QLabel("-->"), 0, 2)
        converter_layout.addWidget(QtWidgets.QLabel("To:"), 0, 3)


        # Source Project and Character
        self.source_project_combobox = QtWidgets.QComboBox()
        self.source_project_combobox.setPlaceholderText("Select Source Project")

        converter_layout.addWidget(self.source_project_combobox, 0, 1)

        # Target Project and Character
        self.target_project_combobox = QtWidgets.QComboBox()
        self.target_project_combobox.setPlaceholderText("Select Target Project")

        converter_layout.addWidget(self.target_project_combobox, 0, 4)


        # === New UI for bake_correct_export_anim ===
        anim_layout = QtWidgets.QFormLayout()
        anim_layout.setLabelAlignment(QtCore.Qt.AlignLeft)

        self.race_field = QtWidgets.QComboBox()
        anim_layout.addRow("Race:", self.race_field)

        self.gender_field = QtWidgets.QComboBox()
        anim_layout.addRow("Gender:", self.gender_field)
        

        # Buttons
        btn_layout = QtWidgets.QVBoxLayout()
        btn_layout.setAlignment(QtCore.Qt.AlignHCenter)
        
        btn_layout.addWidget(self._divider())

        self.convert_current_fbx_anim_btn = QtWidgets.QPushButton("CONVERT CURRENT FBX FILE")
        self.convert_current_fbx_anim_btn.setFixedSize(490, 40)
        self.convert_current_fbx_anim_btn.clicked.connect(self.handle_convert_current_fbx_animation)
        btn_layout.addWidget(self.convert_current_fbx_anim_btn)

        btn_layout.addWidget(self._divider())


        self.convert_batch_anim_btn = QtWidgets.QPushButton("CONVERT BATCH FBX FILES")
        self.convert_batch_anim_btn.setFixedSize(490, 40)
        self.convert_batch_anim_btn.clicked.connect(self.handle_convert_batch_fbx)
        btn_layout.addWidget(self.convert_batch_anim_btn)

        btn_layout.addWidget(self._divider())



        self.convert_creatre_anim_btn = QtWidgets.QPushButton("CONVERT CREATURE FBX FILE")
        self.convert_creatre_anim_btn.setFixedSize(490, 40)
        self.convert_creatre_anim_btn.clicked.connect(self.handle_convert_creature_anim_fbx)
        btn_layout.addWidget(self.convert_creatre_anim_btn)

        btn_layout.addWidget(self._divider())

        self.save_convert_skeleton_btn = QtWidgets.QPushButton("CREATE TEMPLATE SKELETON")
        self.save_convert_skeleton_btn.setFixedSize(490, 40)
        btn_layout.addWidget(self.save_convert_skeleton_btn)

        main_layout.addLayout(converter_layout)       
        main_layout.addLayout(anim_layout)
        main_layout.addLayout(btn_layout)

        self.source_project_combobox.currentIndexChanged.connect(self.save_user_settings)
        self.target_project_combobox.currentIndexChanged.connect(self.save_user_settings)
        self.race_field.currentIndexChanged.connect(self.save_user_settings)
        self.gender_field.currentIndexChanged.connect(self.save_user_settings)

    def _divider(self):
        line = QtWidgets.QFrame()
        line.setFrameShape(QtWidgets.QFrame.HLine)
        line.setFrameShadow(QtWidgets.QFrame.Sunken)
        return line

    def load_projects(self):
        user_app_dir = cmds.internalVar(userAppDir=True)
        project_data_path = os.path.join(user_app_dir, "scripts", "OWL_Anim_ToolKit", "project_data")

        if not os.path.exists(project_data_path):
            self.logger.log("[ConverterWidget] Project data folder not found:", project_data_path)
            return

        json_files = [f for f in os.listdir(project_data_path) if f.endswith(".json")]
        if not json_files:
            self.logger.log("[ConverterWidget] No project files found.")
            return

        for filename in json_files:
            filepath = os.path.join(project_data_path, filename)
            try:
                with open(filepath, "r") as f:
                    data = json.load(f)
                    project_key = os.path.splitext(filename)[0]
                    self.project_data[project_key] = data
            except Exception as e:
                self.logger.log(f"[ConverterWidget] Failed to load {filename}: {e}")

        if self.project_data:
            self.source_project_combobox.addItems(self.project_data.keys())
            self.target_project_combobox.addItems(self.project_data.keys())
        else:
            self.source_project_combobox.setPlaceholderText("No projects found")
            self.target_project_combobox.setPlaceholderText("No projects found")

    def load_template_metadata(self):
        user_app_dir = cmds.internalVar(userAppDir=True)
        base_path = os.path.join(user_app_dir, "scripts", "OWL_Anim_ToolKit", "template_skeletons")

        if not os.path.exists(base_path):
            self.logger.log("[ConverterWidget] Template skeletons folder not found:", base_path)
            return

        files = [f for f in os.listdir(base_path) if f.endswith(".ma")]
        source_set = set()
        target_set = set()
        race_set = set()
        gender_set = set()

        for f in files:
            name = os.path.splitext(f)[0]
            parts = name.split("_")
            if len(parts) != 4:
                self.logger.log(f"[ConverterWidget] Invalid template name format: {f}")
                continue
            source, target, race, gender = parts
            source_set.add(source)
            target_set.add(target)
            race_set.add(race)
            gender_set.add(gender)

        # Очистка комбобоксов перед загрузкой новых значений
        self.source_project_combobox.clear()
        self.target_project_combobox.clear()
        self.race_field.clear()
        self.gender_field.clear()

        # Добавление отсортированных значений
        self.source_project_combobox.addItems(sorted(source_set))
        self.target_project_combobox.addItems(sorted(target_set))
        self.race_field.addItems(sorted(race_set))
        self.gender_field.addItems(sorted(gender_set))

        self.race_field.setCurrentText("Human")
        self.gender_field.setCurrentText("M")


    def handle_convert_current_fbx_animation(self):
        if self.logger:
            self.logger.log("🔄 Запущена конвертация текущей анимации...", color="blue")

        race = self.race_field.currentText()
        gender = self.gender_field.currentText()
        source_proj = self.source_project_combobox.currentText()
        target_proj = self.target_project_combobox.currentText()

        try:
            self.update_progress(5)

            anim_utils_test.convert_process(
                race=race,
                gender=gender,
                source_project=source_proj,
                target_project=target_proj,
                logger=self.logger 
            )

            self.update_progress(100)
            cmds.confirmDialog(title='Успех', message='Конвертация завершена.', button=['OK'])

            if self.logger:
                self.logger.log("✅ Конвертация завершена успешно.", color="green")

        except Exception as e:
            import traceback
            traceback.print_exc()
            cmds.confirmDialog(title='Ошибка', message=f"Произошла ошибка: {e}", button=['OK'])

            if self.logger:
                self.logger.log(f"❌ Ошибка при конвертации FBX: {e}", color="red")

    def handle_convert_batch_fbx(self):
        folder = cmds.fileDialog2(fileMode=3, dialogStyle=2, caption="Выбери папку с .fbx файлами")
        if not folder:
            return

        folder_path = folder[0]
        fbx_files = [f for f in os.listdir(folder_path) if f.lower().endswith(".fbx")]

        if not fbx_files:
            QtWidgets.QMessageBox.information(self, "Нет файлов", "В выбранной папке нет .fbx файлов.")
            return

        race = self.race_field.currentText()
        gender = self.gender_field.currentText()
        source_proj = self.source_project_combobox.currentText()
        target_proj = self.target_project_combobox.currentText()

        if not (source_proj and target_proj and race and gender):
            QtWidgets.QMessageBox.warning(self, "Ошибка", "Пожалуйста, выберите все поля.")
            return

        total = len(fbx_files)

        for i, file_name in enumerate(fbx_files):
            file_path = os.path.join(folder_path, file_name)
            try:
                self.update_progress(int((i / total) * 100))

                if self.logger:
                    self.logger.log(f"[{i+1}/{total}] 📦 Обрабатываем: {file_name}", color="blue")

                cmds.file(file_path, open=True, force=True)

                for ns in cmds.namespaceInfo(listOnlyNamespaces=True):
                    if ns not in ('UI', 'shared'):
                        try:
                            cmds.namespace(removeNamespace=ns, mergeNamespaceWithRoot=True)
                        except:
                            pass

                if not cmds.objExists("Pelvis"):
                    raise RuntimeError("❌ Кость 'Pelvis' не найдена в сцене.")

                anim_utils_test.convert_process(race, gender, source_proj, target_proj, logger=self.logger)

                if self.logger:
                    self.logger.log("🟢 Конвертация завершена успешно.", color="green")
                
            except Exception as e:
                if self.logger:
                    self.logger.log(f"❌ Ошибка при обработке {file_name}: {e}", color="red")
                continue

        self.update_progress(100)
        cmds.confirmDialog(title='Успех', message='Конвертация завершена.', button=['OK'])

    def handle_convert_creature_anim_fbx(self):

        ROOT_NAME = "Position"


        if self.logger:
            self.logger.log("🔄 Запущена конвертация текущей анимации...", color="blue")

        source_proj = self.source_project_combobox.currentText()
        target_proj = self.target_project_combobox.currentText()
        try:
            if target_proj == 'WHII':
                self.update_progress(5)
                creature_anim_convert.scale_translate_keys(100)
                export_file_path = file_utils.generate_export_file_path(subfolder="Export", extension=".fbx")
                # ---- Имя сцены/клипа по умолчанию ----
                scene_name = cmds.file(q=True, sceneName=True, shortName=True) or "Scene"
                scene_base, _ = os.path.splitext(scene_name)

                s = int(cmds.playbackOptions(q=True, min=True))
                e = int(cmds.playbackOptions(q=True, max=True))

                utils.export_single_clip_fbx(
                    export_path=export_file_path,
                    clip_name=scene_base,
                    start=s,
                    end=e,
                    root_joint=ROOT_NAME
                )

        except Exception as e:
            import traceback
            traceback.print_exc()
            cmds.confirmDialog(title='Ошибка', message=f"Произошла ошибка: {e}", button=['OK'])

            if self.logger:
                self.logger.log(f"❌ Ошибка при конвертации FBX: {e}", color="red")

        pass




    def save_user_settings(self):
        settings = {
            "source_project": self.source_project_combobox.currentText() or "WHI",
            "target_project": self.target_project_combobox.currentText() or "WHII",
            "race": self.race_field.currentText() or "Human",
            "gender": self.gender_field.currentText() or "M",
        }
        try:
            with open(self.settings_path, "w") as f:
                json.dump(settings, f, indent=4)
        except Exception as e:
            self.logger.log("[ConverterWidget] Failed to save settings:", e)


    def load_user_settings(self):
        defaults = {
            "source_project": "WHI",
            "target_project": "WHII",
            "race": "Human",
            "gender": "M"
        }

        if not os.path.exists(self.settings_path):
            self.apply_user_settings(defaults)
            return

        try:
            with open(self.settings_path, "r") as f:
                settings = json.load(f)

            for key, default_value in defaults.items():
                if key not in settings or not settings[key]:  
                    settings[key] = default_value

            self.apply_user_settings(settings)
        except Exception as e:
            self.logger.log(f"❌ [ConverterWidget] Failed to load settings:", e)
            self.apply_user_settings(defaults)


    def apply_user_settings(self, settings):
        def try_set(combobox, value):
            index = combobox.findText(value)
            if index >= 0:
                combobox.setCurrentIndex(index)

        try_set(self.source_project_combobox, settings.get("source_project", "WHI"))
        try_set(self.target_project_combobox, settings.get("target_project", "WHII"))
        try_set(self.race_field, settings.get("race", "Human"))
        try_set(self.gender_field, settings.get("gender", "M"))
