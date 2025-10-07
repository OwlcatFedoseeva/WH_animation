from PySide2 import QtWidgets, QtCore, QtGui
import importlib
import maya.cmds as cmds
import os
import json
import re
import OWL_Anim_ToolKit._logic.exporter_logic as exporter_logic
import OWL_Anim_ToolKit._logic.animation_bake_wh1 as wh1_anim_bake_export
import OWL_Anim_ToolKit._logic.bake_correct_export_anim as anim_utils
import OWL_Anim_ToolKit._logic.animation_convertion as anim_utils_test
import OWL_Anim_ToolKit._logic.logging_process as logging_process
from OWL_Anim_ToolKit._logic.animation_bake_wh1 import PROJECT_DATA_DIR 
import OWL_Anim_ToolKit._logic.animation_bake_creature as creature_anim_export
import OWL_Anim_ToolKit._UI._widgets.clip_row as clip_row

import  OWL_Anim_ToolKit._logic.export_dispatcher as export_dispatcher


modules_to_reload = [
    'OWL_Anim_ToolKit._logic.exporter_logic',
    'OWL_Anim_ToolKit._logic.animation_bake_wh1',
    'OWL_Anim_ToolKit._logic.bake_correct_export_anim',
    'OWL_Anim_ToolKit._logic.animation_convertion',
    'OWL_Anim_ToolKit._logic.logging_process',
    'OWL_Anim_ToolKit._logic.export_dispatcher',
    'OWL_Anim_ToolKit._logic.animation_bake_creature',
    'OWL_Anim_ToolKit._UI._widgets.clip_row'
]

for mod_name in modules_to_reload:
    mod = importlib.import_module(mod_name)
    importlib.reload(mod)

from _logic.logging_process import UILogger

def sanitize_name(name):
    return re.sub(r'[\\/:*?"<>|]+', '_', (name or "").strip()) or "Clip"


class AnimExportWidget(QtWidgets.QWidget):
    def __init__(self, parent=None, logger_widget=None, update_progress=None):
        super().__init__(parent)
        self.projects_data = self.load_projects_data()
        self.update_progress = update_progress
        self.logger = UILogger(widget=logger_widget)
        self.logger.log("🟢 Логгер успешно подключён!", color="green")
        self.init_ui()

    def init_ui(self):
        # Main Layout
        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(2, 2, 2, 2)
        self.main_layout.setSpacing(5)
        self.setLayout(self.main_layout)

        # Комбобокс выбора персонажа
        self.create_character_layout()

        # Блок экспорта клипов
        self.create_options_layout()
        self.frame_range_group_layout = QtWidgets.QVBoxLayout()
        self.main_layout.addLayout(self.frame_range_group_layout)
        self.create_operation_buttons()
        self.check_scene_create()

    def create_character_layout(self):
        self.set_char_layout = QtWidgets.QHBoxLayout()
        self.main_layout.addLayout(self.set_char_layout)

        self.title_label_B = QtWidgets.QLabel("SET PROJECT:")
        self.set_char_layout.addWidget(self.title_label_B)
        self.set_project_combobox()
        self.title_label_C = QtWidgets.QLabel("SET CHARACTER:")
        self.set_char_layout.addWidget(self.title_label_C)
        self.set_char_type_combobox()

    def create_options_layout(self):
        self.options_layout = QtWidgets.QVBoxLayout()
        self.main_layout.addLayout(self.options_layout)

        self.checkbox_export_options = QtWidgets.QCheckBox("SPLIT ANIMATION INTO CLIPS")
        self.checkbox_export_options.stateChanged.connect(self.toggle_export_clips)
        self.options_layout.addWidget(self.checkbox_export_options)
        
        # Create export clips number UI
        self.export_clips_number()

        # Initialize the UI state based on the checkbox's initial value
        self.toggle_export_clips(self.checkbox_export_options.checkState())

    def load_projects_data(self):
        json_path = os.path.join(cmds.internalVar(userAppDir=True), 'scripts', 'OWL_Anim_ToolKit', 'project_data', 'project_character_data.json')
        with open(json_path, 'r') as f:
            data = json.load(f)
        return data['projects_data']        
    

    def create_operation_buttons(self):
        self.operation_layout = QtWidgets.QVBoxLayout()
        self.main_layout.addLayout(self.operation_layout)

        self.create_buttons(
            'EXPORT THIS ANIMATION',
            self.export_current_with_creature_check,
            'Export currently opened animation.',
            self.operation_layout,
            is_default=False,
            size=(490, 40)
        )
        self.create_buttons(
            'BATCH ANIMATION EXPORT', 
            self.export_batch, 
            'Export many animations.', 
            self.operation_layout,
            is_default=False, 
            size=(490, 40))

        #self.create_buttons('EXPORT CREATURE ANIMATION', self.export_creature_animation, 'Export creature animation.', self.operation_layout, is_default=True, size=(490, 40))

    def check_scene_create(self):
        self.check_scene_create_layout = QtWidgets.QVBoxLayout()
        self.main_layout.addLayout(self.check_scene_create_layout)
        self.create_buttons('CREATE ANIMATION CHECK SCENE', self.create_check_anim_scene, 'Creates a check scene for exported animation.', self.operation_layout, is_default=True, size=(490, 40))

    def create_buttons(self, label, command, tooltip, layout, is_default=False, size=(100, 30)):
        button = QtWidgets.QPushButton(label)
        button.clicked.connect(command)
        button.setToolTip(tooltip)
        button.setFixedSize(*size)
        button.setAutoDefault(False)          # <-- добавь это
        layout.addWidget(button)
        if is_default:
            button.setDefault(True)
        return button


    def export_clips_number(self):
        self.clips_layout = QtWidgets.QHBoxLayout()
        self.options_layout.addLayout(self.clips_layout)

        self.clips_label = QtWidgets.QLabel("Number of clips to export: ")
        self.clips_layout.addWidget(self.clips_label)

        self.clips_field = QtWidgets.QLineEdit()
        self.clips_field.setFixedWidth(50)
        self.clips_field.setValidator(QtGui.QIntValidator())
        self.clips_field.setPlaceholderText("3")
        self.clips_layout.addWidget(self.clips_field)

        self.set_number_of_clips = self.create_buttons('SET', self.create_frame_range_comboboxes, 'Set start and end frame.', self.clips_layout, is_default=False, size=(50, 20))
        self.reset_number_of_clips = self.create_buttons('RESET', self.on_reset_button_clicked, 'Reset start and end frame.', self.clips_layout, is_default=False, size=(50, 20))

    def create_check_anim_scene(self):
        pass

    def on_reset_button_clicked(self):
        self.update_clips_field()
        self.create_frame_range_comboboxes()

    def update_clips_field(self):
        clips_value = self.clips_field.text()
        self.reset_clips()
        self.clips_field.setText(clips_value)

    def reset_clips(self):
        for i in reversed(range(self.frame_range_group_layout.count())):
            layout_item = self.frame_range_group_layout.takeAt(i)
            if layout_item:
                widget = layout_item.widget()
                if widget:
                    widget.deleteLater()
                else:
                    sub_layout = layout_item.layout()
                    if sub_layout:
                        while sub_layout.count():
                            item = sub_layout.takeAt(0)
                            sub_widget = item.widget()
                            if sub_widget:
                                sub_widget.deleteLater()

    def get_all_clips(self):
        """
        Возвращает список [(name, start, end), ...] для всех клипов.
        Пропускает клипы с пустыми или некорректными значениями.
        """
        clips = []
        for idx, (name_field, start_field, end_field) in enumerate(self.frame_range_comboboxes):
            name = name_field.text().strip() or f"Clip{idx+1}"
            try:
                start = int(start_field.text())
                end   = int(end_field.text())
            except ValueError:
                continue
            if start > end:
                start, end = end, start
            clips.append((name, start, end))
        return clips


    def create_frame_range_comboboxes(self):
        """
        Создаёт строки клипов с полями: Name / Start / End.
        Хранит ссылки на поля в self.frame_range_comboboxes как список
        кортежей: (name_field, start_field, end_field).
        Повторный вызов пересоздаёт строки под новое количество клипов.
        """
        # контейнер для ссылок на поля
        self.frame_range_comboboxes = []

        # очистка предыдущих строк
        self.reset_clips()

        # кол-во клипов из поля
        try:
            num_clips = int(self.clips_field.text())
        except (TypeError, ValueError):
            num_clips = 0

        # базовое имя из файла сцены
        scene_name = cmds.file(q=True, sceneName=True, shortName=True) or "Scene"
        scene_base, _ = os.path.splitext(scene_name)

        # дефолтный диапазон — весь таймлайн
        try:
            default_start = int(cmds.playbackOptions(q=True, min=True))
            default_end   = int(cmds.playbackOptions(q=True, max=True))
        except Exception:
            default_start, default_end = 1, 10

        # создаём строки
        for i in range(num_clips):
            default_name = f"{scene_base}_Clip{i+1:02d}"
            layout, name_field, start_field, end_field = self.frame_range_combobox(
                index=i,
                default_name=default_name,
                default_start=default_start,
                default_end=default_end
            )
            self.frame_range_group_layout.addLayout(layout)
            self.frame_range_comboboxes.append((name_field, start_field, end_field))

        return self.frame_range_comboboxes

    def frame_range_combobox(self, index, default_name="Clip", default_start=1, default_end=10):
        """
        Строка клипа с полями: Name / Start / End + кнопка Set Range (ставит текущий таймлайн).
        Возвращает: (layout, name_field, start_field, end_field)
        """
        layout = QtWidgets.QHBoxLayout()

        # Name
        name_label = QtWidgets.QLabel(f"Clip {index + 1} Name:")
        layout.addWidget(name_label)

        name_field = QtWidgets.QLineEdit()
        name_field.setFixedWidth(130)
        name_field.setPlaceholderText(default_name)
        name_field.setText(default_name)
        layout.addWidget(name_field)

        # Start
        start_field = QtWidgets.QLineEdit()
        start_field.setFixedWidth(40)
        start_field.setValidator(QtGui.QIntValidator(-100000, 100000))
        start_field.setPlaceholderText(str(default_start))
        start_field.setText(str(default_start))
        start_field._userEdited = False
        start_field.textEdited.connect(lambda _: setattr(start_field, "_userEdited", True))
        layout.addWidget(start_field)

        # End
        end_field = QtWidgets.QLineEdit()
        end_field.setFixedWidth(40)
        end_field.setValidator(QtGui.QIntValidator(-100000, 100000))
        end_field.setPlaceholderText(str(default_end))
        end_field.setText(str(default_end))
        end_field._userEdited = False
        end_field.textEdited.connect(lambda _: setattr(end_field, "_userEdited", True))
        layout.addWidget(end_field)

        # Кнопка "Set Range" — подставляет текущий таймлайн
        set_btn = QtWidgets.QPushButton("Set Range")
        set_btn.setFixedWidth(110)

        def _apply_timeline_range():
            try:
                s = int(round(float(cmds.playbackOptions(q=True, minTime=True))))
                e = int(round(float(cmds.playbackOptions(q=True, maxTime=True))))
                # заполняем только нетронутые/пустые поля
                if not start_field._userEdited or not start_field.text().strip():
                    start_field.setText(str(s))
                if not end_field._userEdited or not end_field.text().strip():
                    end_field.setText(str(e))
            except Exception as ex:
                print("[Set Range] Failed to read timeline:", ex)


        set_btn.clicked.connect(_apply_timeline_range)
        layout.addWidget(set_btn)

        return layout, name_field, start_field, end_field


    def toggle_export_clips(self, state):
        enabled = state == QtCore.Qt.Checked
        for i in range(self.clips_layout.count()):
            widget = self.clips_layout.itemAt(i).widget()
            if widget:
                widget.setEnabled(enabled)

    def get_frame_range_values(self, clip_index):
        name_field, start_field, end_field = self.frame_range_comboboxes[clip_index]

        if not start_field.text() or not end_field.text():
            print(f"Error: Start and/or end frame fields are empty for clip {clip_index}")
            return None, None, None

        try:
            start_frame = int(start_field.text())
            end_frame = int(end_field.text())
        except ValueError:
            print(f"Error: Invalid frame values entered for clip {clip_index}. Please enter valid integers.")
            return None, None, None

        if start_frame > end_frame:
            print(f"Error: Start frame ({start_frame}) cannot be greater than end frame ({end_frame}) for clip {clip_index}.")
            return None, None, None

        clip_name = name_field.text().strip() or f"Clip{clip_index+1}"
        return clip_name, start_frame, end_frame


    def set_project_combobox(self):
        self.combobox_project = QtWidgets.QComboBox()
        self.combobox_project.addItems(self.projects_data.keys())
        self.combobox_project.setCurrentIndex(0)
        self.combobox_project.currentIndexChanged.connect(self.update_characters_based_on_project)
        self.set_char_layout.addWidget(self.combobox_project)
        self.set_char_layout.setStretchFactor(self.combobox_project, 1)

    def set_char_type_combobox(self):
        self.combobox_race = QtWidgets.QComboBox()
        self.set_char_layout.addWidget(self.combobox_race)
        self.set_char_layout.setStretchFactor(self.combobox_race, 1)
        self.update_characters_based_on_project()  # инициализировать расу по умолчанию

    def update_characters_based_on_project(self):
        selected_project = self.combobox_project.currentText()
        self.combobox_race.clear()
        races = self.projects_data.get(selected_project, [])
        self.combobox_race.addItems([race.capitalize() for race in races])


    def btn_set_path_clicked(self):
        self.folder_path = cmds.fileDialog2(dialogStyle=2, fileMode=3)
        if self.folder_path:
            self.save_name_field.setText(self.folder_path[0])
            print("Folder path set to:", self.folder_path[0])
        else:
            print("No folder selected.")


    def export_batch(self):
        folder = cmds.fileDialog2(fileMode=3, dialogStyle=2, caption="Выбери папку с .ma файлами")
        if not folder:
            return

        folder_path = folder[0]
        ma_files = [f for f in os.listdir(folder_path) if f.endswith(".ma")]

        if not ma_files:
            QtWidgets.QMessageBox.information(self, "Нет файлов", "В выбранной папке нет .ma файлов.")
            return

        total = len(ma_files)
        for i, file_name in enumerate(ma_files):
            file_path = os.path.join(folder_path, file_name)
            try:
                if self.update_progress:
                    self.update_progress(int((i / total) * 100))

                print(f"[{i+1}/{total}] Обрабатывается: {file_name}")
                cmds.file(file_path, open=True, force=True)

                # определяем, Creature ли это
                selected_race = self.combobox_race.currentText().strip().lower()
                if selected_race == "creature":
                    creature_anim_export.prep_for_export(
                        logger=self.logger,
                        update_progress=self.update_progress
                    )
                else:
                    exporter_logic.export_current(
                        self,
                        logger=self.logger,
                        update_progress=self.update_progress
                    )

            except Exception as e:
                print(f"❌ Ошибка при обработке {file_name}: {e}")
                continue

        if self.update_progress:
            self.update_progress(100)

        QtWidgets.QMessageBox.information(self, "Готово", f"✅ Успешно экспортировано: {total} файлов")


    def export_creature_animation(self):
        creature_anim_export.prep_for_export(logger=self.logger, update_progress=self.update_progress)

    def export_current_with_creature_check(self):
        selected_race = self.combobox_race.currentText().strip().lower()
        if selected_race == "creature":
            creature_anim_export.prep_for_export(
                logger=self.logger,
                update_progress=self.update_progress
            )
        else:
            exporter_logic.export_current(
                self,
                logger=self.logger,
                update_progress=self.update_progress
            )
    def handle_convert_current_animation(self):
        race = self.race_field.currentText()
        gender = self.gender_field.currentText()
        source_proj = self.source_project_combobox.currentText()
        target_proj = self.target_project_combobox.currentText()
        self.logger.log("🔄 Запущена конвертация текущей анимации...")
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
            cmds.confirmDialog(title='Успех', message='Конвертация завершена.', button=['OK'])
        except Exception as e:
            self.update_progress(0)
            QtWidgets.QMessageBox.critical(self, "Conversion Error", str(e))
            cmds.confirmDialog(title='Ошибка', message=f"Произошла ошибка: {e}", button=['OK'])

        self.save_user_settings()
        self.logger.log("✅ Конвертация завершена.")

    def handle_convert_batch_maya(self):
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
