# _UI/_tabsUI/animation_converter_tab.py

from PySide2 import QtWidgets, QtCore
import os
import json
import maya.cmds as cmds
import importlib
import OWL_Anim_ToolKit._logic.bake_correct_export_anim as anim_utils
importlib.reload(anim_utils)


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
        self.logger_widget = logger_widget


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

        self.convert_current_ma_anim_btn = QtWidgets.QPushButton("CONVERT CURRENT MAYA FILE")
        self.convert_current_ma_anim_btn.setFixedSize(490, 40)
        self.convert_current_ma_anim_btn.clicked.connect(self.handle_convert_current_animation)
        btn_layout.addWidget(self.convert_current_ma_anim_btn)

        self.convert_current_fbx_anim_btn = QtWidgets.QPushButton("CONVERT CURRENT .FBX FILE")
        self.convert_current_fbx_anim_btn.setFixedSize(490, 40)
        self.convert_current_fbx_anim_btn.clicked.connect(self.handle_convert_current_fbx_animation)
        btn_layout.addWidget(self.convert_current_fbx_anim_btn)

        self.convert_batch_anim_btn = QtWidgets.QPushButton("CONVERT BATCH")
        self.convert_batch_anim_btn.setFixedSize(490, 40)
        self.convert_batch_anim_btn.clicked.connect(self.handle_convert_batch)
        btn_layout.addWidget(self.convert_batch_anim_btn)

        self.save_convert_skeleton_btn = QtWidgets.QPushButton("SAVE CONVERT SKELETON")
        self.save_convert_skeleton_btn.setFixedSize(490, 40)
        btn_layout.addWidget(self.save_convert_skeleton_btn)

        main_layout.addLayout(converter_layout)       
        main_layout.addLayout(anim_layout)
        main_layout.addLayout(btn_layout)

        self.source_project_combobox.currentIndexChanged.connect(self.save_user_settings)
        self.target_project_combobox.currentIndexChanged.connect(self.save_user_settings)
        self.race_field.currentIndexChanged.connect(self.save_user_settings)
        self.gender_field.currentIndexChanged.connect(self.save_user_settings)

        
    def log(self, message):
        if self.logger_widget:
            self.logger_widget.append(message)
        print(message)

    def load_projects(self):
        user_app_dir = cmds.internalVar(userAppDir=True)
        project_data_path = os.path.join(user_app_dir, "scripts", "OWL_Anim_ToolKit", "project_data")

        if not os.path.exists(project_data_path):
            print("[ConverterWidget] Project data folder not found:", project_data_path)
            return

        json_files = [f for f in os.listdir(project_data_path) if f.endswith(".json")]
        if not json_files:
            print("[ConverterWidget] No project files found.")
            return

        for filename in json_files:
            filepath = os.path.join(project_data_path, filename)
            try:
                with open(filepath, "r") as f:
                    data = json.load(f)
                    project_key = os.path.splitext(filename)[0]
                    self.project_data[project_key] = data
            except Exception as e:
                print(f"[ConverterWidget] Failed to load {filename}: {e}")

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
            print("[ConverterWidget] Template skeletons folder not found:", base_path)
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
                print(f"[ConverterWidget] Invalid template name format: {f}")
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

    def handle_export_animation(self):
        source_proj = self.source_project_combobox.currentText()
        target_proj = self.target_project_combobox.currentText()
        race = self.race_field.currentText()
        gender = self.gender_field.currentText()
        #self.log(source_proj + '_' + target_proj + '_' + race + '_' + gender + '.ma')

        if not (source_proj and target_proj and race and gender):
            QtWidgets.QMessageBox.warning(self, "Error", "Please select all required fields.")
            return

        try:
            json_path = anim_utils.prepare_anim_data_for_transfer(
                source_project=source_proj,
                target_project=target_proj,
                race=race,
                gender=gender
            )
            QtWidgets.QMessageBox.information(self, "Export Complete", f"Animation exported to:\n{json_path}")
        except Exception as e:
            QtWidgets.QMessageBox.critical(self, "Export Error", str(e))

    def handle_import_animation(self):
        race = self.race_field.currentText()
        gender = self.gender_field.currentText()
        source_proj = self.source_project_combobox.currentText()
        target_proj = self.target_project_combobox.currentText()

        if not (source_proj and target_proj and race and gender):
            QtWidgets.QMessageBox.warning(self, "Error", "Please select all required fields.")
            return

        try:
            template_path = anim_utils.get_template_path(source_proj, target_proj, race, gender)
        except Exception as e:
            QtWidgets.QMessageBox.critical(self, "Template Error", f"Failed to build template path: {e}")
            return

        if not os.path.exists(template_path):
            QtWidgets.QMessageBox.critical(self, "Template Missing", f"Template not found:\n{template_path}")
            return

        module_dir = os.path.dirname(anim_utils.__file__)
        temp_path = os.path.normpath(os.path.join(module_dir, "..", "..", "temp"))
        json_name = f"{source_proj}_{target_proj}_{race}_{gender}.json"
        json_path = os.path.join(temp_path, json_name)

        if not os.path.exists(json_path):
            QtWidgets.QMessageBox.critical(self, "JSON Missing", f"JSON not found:\n{json_path}")
            return

        try:
            anim_utils.load_template_and_apply_animation(source_proj, target_proj, race, gender)
            QtWidgets.QMessageBox.information(self, "Import Complete", "Animation imported successfully.")
        except Exception as e:
            QtWidgets.QMessageBox.critical(self, "Error", str(e))

    def handle_convert_current_animation(self):
        race = self.race_field.currentText()
        gender = self.gender_field.currentText()
        source_proj = self.source_project_combobox.currentText()
        target_proj = self.target_project_combobox.currentText()
        #self.log("🔄 Запущена конвертация текущей анимации...")
        if not (source_proj and target_proj and race and gender):
            QtWidgets.QMessageBox.warning(self, "Error", "Please select all required fields.")
            return

        try:
            self.update_progress(5)
            json_path = anim_utils.prepare_anim_data_for_transfer(
                source_project=source_proj,
                target_project=target_proj,
                race=race,
                gender=gender
            )
            self.update_progress(60)

            anim_utils.load_template_and_apply_animation(source_proj, target_proj, race, gender)
            self.update_progress(95)

            QtWidgets.QMessageBox.information(self, "Conversion Complete", "Animation converted and applied.")
            self.update_progress(100)
        except Exception as e:
            self.update_progress(0)
            QtWidgets.QMessageBox.critical(self, "Conversion Error", str(e))

        self.save_user_settings()
        #self.log("✅ Конвертация завершена.")

    def handle_convert_current_fbx_animation(self):
        race = self.race_field.currentText()
        gender = self.gender_field.currentText()
        source_proj = self.source_project_combobox.currentText()
        target_proj = self.target_project_combobox.currentText()

        #self.log("🔄 Запущена конвертация текущего FBX файла...")

        if not (source_proj and target_proj and race and gender):
            QtWidgets.QMessageBox.warning(self, "Ошибка", "Пожалуйста, выберите все поля.")
            return

        try:
            self.update_progress(5)
            anim_utils.convert_from_existing_fbx(
                race=race,
                gender=gender,
                source_project=source_proj,
                target_project=target_proj
            )
            self.update_progress(100)
            #self.log("✅ Конвертация FBX завершена.")
        except Exception as e:
            self.update_progress(0)
            #self.log(f"❌ Ошибка при конвертации FBX: {str(e)}")
            QtWidgets.QMessageBox.critical(self, "FBX Error", str(e))

    def handle_convert_batch(self):
        folder = cmds.fileDialog2(fileMode=3, dialogStyle=2, caption="Выбери папку с .ma файлами")
        if not folder:
            return

        folder_path = folder[0]
        ma_files = [f for f in os.listdir(folder_path) if f.endswith(".ma")]

        if not ma_files:
            QtWidgets.QMessageBox.information(self, "Нет файлов", "В выбранной папке нет .ma файлов.")
            return

        race = self.race_field.currentText()
        gender = self.gender_field.currentText()
        source_proj = self.source_project_combobox.currentText()
        target_proj = self.target_project_combobox.currentText()

        if not (source_proj and target_proj and race and gender):
            QtWidgets.QMessageBox.warning(self, "Error", "Please select all required fields.")
            return

        total = len(ma_files)
        for i, file_name in enumerate(ma_files):
            file_path = os.path.join(folder_path, file_name)
            try:
                self.update_progress(int((i / total) * 100))
                print(f"[{i+1}/{total}] Обрабатываем: {file_name}")
                cmds.file(file_path, open=True, force=True)

                # 🔁 Вызов той же логики, что и при одиночной конверсии
                anim_utils.prepare_anim_data_for_transfer(
                    source_project=source_proj,
                    target_project=target_proj,
                    race=race,
                    gender=gender
                )
                anim_utils.load_template_and_apply_animation(source_proj, target_proj, race, gender)
            except Exception as e:
                print(f"❌ Ошибка при обработке {file_name}: {e}")
                continue

        self.update_progress(100)
        QtWidgets.QMessageBox.information(self, "Batch Complete", f"✅ Обработано файлов: {total}")

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
            print("[ConverterWidget] Failed to save settings:", e)


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
                if key not in settings or not settings[key]:  # empty string check added
                    settings[key] = default_value

            self.apply_user_settings(settings)
        except Exception as e:
            print("[ConverterWidget] Failed to load settings:", e)
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
