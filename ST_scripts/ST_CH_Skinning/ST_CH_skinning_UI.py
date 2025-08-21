from maya import cmds
from PySide2 import QtCore, QtGui, QtWidgets
import os
import maya.mel as mel
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin
import maya.OpenMaya as OpenMaya
import importlib
import logging
import ST_CH_Skinning._logic.export_skin_to_JSON as owl_export_skin_to_json
import ST_CH_Skinning._logic.import_skin_to_JSON as owl_import_skin_from_json_replace
import ST_CH_Skinning._utils.operation_utils as utils
import ST_CH_Skinning._utils.fbx_export_settings as owl_fbx_export_settings   
import ST_CH_Skinning._utils.import_animation_from_json as owl_import_animation_from_json
import ST_CH_Skinning._UI._logger_section_UI as logger_ui
import ST_CH_Skinning._logic.qt_logging_handler as qtlog
import ST_CH_Skinning._utils.export_animation_to_json as anim_export


modules_to_reload = [
    'ST_CH_Skinning._logic.export_skin_to_JSON', 'ST_CH_Skinning._logic.import_skin_to_JSON',
    'ST_CH_Skinning._utils.operation_utils', 'ST_CH_Skinning._utils.fbx_export_settings',
    'ST_CH_Skinning._utils.import_animation_from_json', 'ST_CH_Skinning._UI._logger_section_UI',
    'ST_CH_Skinning._logic.qt_logging_handler', 'ST_CH_Skinning._utils.export_animation_to_json'
]
for mod_name in modules_to_reload:
    mod = importlib.import_module(mod_name)
    importlib.reload(mod)


USERAPPDIR = cmds.internalVar(userAppDir=True)
DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'ST_CH_Skinning')
BASE_SKELETON_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'ST_CH_Skinning', 'base_skeletons')
presetPathName = DIRECTORY + "/UMA_Male_Rig_AnimationExport.fbxexportpreset"

class BodyPartSkinnerUI(MayaQWidgetDockableMixin, QtWidgets.QDialog):
    def __init__(self, logger=None, parent=None):
        super().__init__(parent)
        self.logger = logger or logging.getLogger("ST_CH_Skinning")
        
        self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        self.selected_objects_list = QtWidgets.QListWidget()  # Initialize the list widget
        self.selected_objects = []
        self.scene_callbacks = []      # список callback'ов на сцену (пока пустой)
        self.selected_file = ""        # путь к исходному файлу до первого Set Path
        self._anim_snapshot = None      # dict: joint -> 16 чисел (OPM)
        self._anim_frame_range = None   # (start, end)
        self._anim_joints = []   

        self.init_ui()

    def init_ui(self):
        self.setWindowTitle("BodyPart skinner v 2.3")
        self.setObjectName("CHBodyPartSkinnerID")
        #self.setGeometry(300, 300, 250, 400)

        self.setMinimumSize(450, 70)
        self.setMaximumSize(550, 1300)
        self.resize(450, 750)

        self.main_layout = QtWidgets.QVBoxLayout(self)

        # Create a horizontal layout for the folder path line edit and Set Path button
        self.path_layout = QtWidgets.QHBoxLayout()
        self.create_comboboxA()
        # Animation Folder UI components
        self.file_name_field = QtWidgets.QLineEdit()
        self.file_name_field.setPlaceholderText("Select model file you want to skin.") 
        self.path_layout.addWidget(self.file_name_field) 
         
        # Set Folder button
        self.btn_set_path = QtWidgets.QPushButton("Set Path")
        self.btn_set_path.clicked.connect(self.btn_set_path_clicked)
        self.path_layout.addWidget(self.btn_set_path)
        self.main_layout.addLayout(self.path_layout)


        # Build Scene Layout
        self.build_scene_layout = QtWidgets.QVBoxLayout() 
        self.build_scene_button = QtWidgets.QPushButton("Build the work scene")
        self.build_scene_button.clicked.connect(self.btn_build_scene_clicked)
        self.build_scene_layout.addWidget(self.build_scene_button)
        self.main_layout.addLayout(self.build_scene_layout)


        # Open Scene Layout
        self.open_scene_layout = QtWidgets.QVBoxLayout() 
        self.open_scene_button = QtWidgets.QPushButton("Open existing work scene")
        self.open_scene_button.clicked.connect(self.btn_open_scene_clicked)
        self.open_scene_layout.addWidget(self.open_scene_button)
        self.main_layout.addLayout(self.open_scene_layout)


        # Select Layout
        self.select_layout = QtWidgets.QVBoxLayout() 
        self.select_label = QtWidgets.QLabel("Select Object to skin")
        self.select_layout.addWidget(self.select_label)

        self.set_button = QtWidgets.QPushButton("Set")
        self.set_button.clicked.connect(self.on_set_button_click)
        self.select_layout.addWidget(self.set_button)

        self.main_layout.addLayout(self.select_layout)

        # Scroll Layout
        self.scroll_layout = QtWidgets.QScrollArea()
        self.scroll_layout.setWidgetResizable(True)

        self.scroll_content = QtWidgets.QWidget(self.scroll_layout)
        self.scroll_layout.setWidget(self.scroll_content)

        self.objects_layout = QtWidgets.QVBoxLayout(self.scroll_content)
        self.selected_objects_list = QtWidgets.QListWidget()
        self.selected_objects_list.setSelectionMode(QtWidgets.QAbstractItemView.MultiSelection)
        self.objects_layout.addWidget(self.selected_objects_list)

        self.main_layout.addWidget(self.scroll_layout)

        #Save Menu Button
        self.save_button_layout = QtWidgets.QHBoxLayout()

        self.save_button = QtWidgets.QPushButton("Save Maya Skeleton File")
        self.save_button.clicked.connect(self.save_maya_scene)
        self.save_button_layout.addWidget(self.save_button)
        self.main_layout.addLayout(self.save_button_layout)
        

        # Buttons Layout
        self.buttons_layout = QtWidgets.QHBoxLayout()
        self.apply_button = QtWidgets.QPushButton("Apply")
        self.apply_button.clicked.connect(self.copy_w)
        self.buttons_layout.addWidget(self.apply_button)

        self.create_group_button = QtWidgets.QPushButton("Create Group and Layer")
        self.create_group_button.clicked.connect(self.organization)
        self.buttons_layout.addWidget(self.create_group_button)

        self.export_fbx_button = QtWidgets.QPushButton("Export FBX")
        self.export_fbx_button.clicked.connect(self.exportFbx)
        self.buttons_layout.addWidget(self.export_fbx_button)
        self.main_layout.addLayout(self.buttons_layout)


        # Import | Export Buttons Layout
        self.buttons_skin_data_layout = QtWidgets.QHBoxLayout()
        self.import_skin_weights_btn()

        self.export_skin_button = QtWidgets.QPushButton("Export Skin Data")
        self.export_skin_button.clicked.connect(self.on_export_skin_weights_clicked)
        self.buttons_skin_data_layout.addWidget(self.export_skin_button)
        self.main_layout.addLayout(self.buttons_skin_data_layout) 

        self.main_layout.addWidget(self._divider())

        # Create Test Animation Section
        self.test_animation_layout = QtWidgets.QHBoxLayout()

        self.create_animation_type_combobox()

        self.import_test_animation_button = QtWidgets.QPushButton("Import Test Animation")
        self.import_test_animation_button.clicked.connect(self.import_test_animation)
        self.test_animation_layout.addWidget(self.import_test_animation_button)

        # контекстное меню на правый клик
        self.import_test_animation_button.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.import_test_animation_button.customContextMenuRequested.connect(self._on_import_button_menu)


        self.clear_test_animation_button = QtWidgets.QPushButton("Delete Test Animation")
        self.clear_test_animation_button.clicked.connect(self.clear_animation)
        self.test_animation_layout.addWidget(self.clear_test_animation_button)

        self.main_layout.addLayout(self.test_animation_layout)


        self.main_layout.addWidget(self._divider())


        # 1) секция логов
        self.logger_layout, self.logger_widget = logger_ui.create_logger_section(self, logger=self.logger)

        # 2) нижняя строка с Close
        self.bottom_hbox_layout = QtWidgets.QHBoxLayout()
        self.bottom_hbox_layout.addStretch(1)

        # 3) добавляем в основной лэйаут — сначала логи, потом панель с Close
        self.main_layout.addLayout(self.logger_layout)
        self.main_layout.addLayout(self.bottom_hbox_layout)

        # 4) подключаем Qt-хэндлер логгера к виджету
        self._qt_handler = qtlog.attach_qt_handler(self.logger, self.logger_widget)
        self.logger.info("Logger wired.")
 
 
    def _divider(self):
        line = QtWidgets.QFrame()
        line.setFrameShape(QtWidgets.QFrame.HLine)
        line.setFrameShadow(QtWidgets.QFrame.Sunken)
        return line

    def closeEvent(self, event):
        # Clean up callbacks when the UI is closed
        if hasattr(self, "scene_callbacks"):
            for callback in self.scene_callbacks:
                try:
                    OpenMaya.MMessage.removeCallback(callback)
                except Exception:
                    pass
            self.scene_callbacks = []
        event.accept()

    def create_comboboxA(self):
        self.combobox_race = QtWidgets.QComboBox()
        
        # Check if BASE_SKELETON_DIRECTORY exists
        if os.path.exists(BASE_SKELETON_DIRECTORY):
            # Get all folders in the directory
            folders = [f for f in os.listdir(BASE_SKELETON_DIRECTORY) 
                    if os.path.isdir(os.path.join(BASE_SKELETON_DIRECTORY, f))]
            
            if folders:
                # Add folder names to the combobox
                for folder in folders:
                    self.combobox_race.addItem(folder)
            else:
                # Handle case when no folders are found
                self.combobox_race.addItem("No folders available")
        else:
            # Handle case when the directory doesn't exist
            self.combobox_race.addItem("Directory not found")
        
        self.combobox_race.setCurrentIndex(0)  # Set the default selection
        self.main_layout.addWidget(self.combobox_race)

    def import_skin_weights_btn(self):
        # Add a button for importing skin weights
        self.import_skin_button = QtWidgets.QPushButton("Import Skin Data")
        parent_folder = os.path.dirname(self.selected_file) if hasattr(self, 'selected_file') else None
        skin_data_dir = os.path.join(parent_folder, 'RIG', "SkinData") if parent_folder else None

        if skin_data_dir and os.path.exists(skin_data_dir):
            self.import_skin_button.setStyleSheet("background-color: green; color: white;")
        else:
            self.import_skin_button.setStyleSheet("background-color: grey; color: white;")
        
        self.import_skin_button.clicked.connect(self.import_skin_data)
        self.buttons_skin_data_layout.addWidget(self.import_skin_button)

    def update_skin_weights_button_color(self):
        """
        Updates the color of the import_skin_button based on the presence of the SkinData folder.
        The current Maya file must be saved in a "RIG" folder. The SkinData folder is expected to 
        be a sibling directory to the Maya file.
        """
        current_file = cmds.file(query=True, sceneName=True)

        if not current_file:
            # File is not saved
            self.import_skin_button.setStyleSheet("background-color: grey; color: white;")
            print("Current file is not saved. Please save the file first.")
            return

        # Ensure the current file is saved in the "RIG" folder
        current_dir = os.path.dirname(current_file)
        if "RIG" not in os.path.basename(current_dir):
            # File is not in the "RIG" folder
            self.import_skin_button.setStyleSheet("background-color: grey; color: white;")
            print("Current file is not saved in a 'RIG' folder.")
            return

        # Check for the presence of the "SkinData" folder
        skin_data_folder = os.path.join(current_dir, "SkinData")
        if os.path.exists(skin_data_folder):
            # "SkinData" folder exists
            self.import_skin_button.setStyleSheet("background-color: green; color: white;")
            print(f"'SkinData' folder found: {skin_data_folder}")
        else:
            # "SkinData" folder does not exist
            self.import_skin_button.setStyleSheet("background-color: grey; color: white;")
            print(f"'SkinData' folder not found in: {current_dir}")

    def btn_build_scene_clicked(self):
        # Create a new scene
        cmds.file(new=True, force=True)
        self.update_skin_weights_button_color() 
        file_name = self.file_name_field.text()

        if file_name:
            # Get the selected folder from the combo box
            selected_folder = self.combobox_race.currentText()
            print(selected_folder)

            if selected_folder in ["No folders available", "Directory not found"]:
                cmds.error("Invalid selection in the combobox. Please select a valid base skeleton.")
                return

            # Initialize base_body
            base_body = None

            # Determine the appropriate base skeleton based on the file name
            if "_HM" in file_name and "_M_" in file_name:
                base_body = os.path.join(BASE_SKELETON_DIRECTORY, selected_folder, "Human_Male_skeleton.ma")
                print("Base Human Male Skeleton imported.")
            elif "_HM" in file_name and "_F_" in file_name:
                base_body = os.path.join(BASE_SKELETON_DIRECTORY, selected_folder, "Human_Female_skeleton.ma")
                print("Base Human Female Skeleton imported.")
            elif "_EL" in file_name and "_M_" in file_name:
                base_body = os.path.join(BASE_SKELETON_DIRECTORY, selected_folder, "Eldar_Male_skeleton.ma")
                print("Base Eldar Male Skeleton imported.")
            elif "_EL" in file_name and "_F_" in file_name:
                base_body = os.path.join(BASE_SKELETON_DIRECTORY, selected_folder, "Eldar_Male_skeleton.ma")
                print("Base Eldar Female Skeleton imported.")
            elif "_SM" in file_name:
                base_body = os.path.join(BASE_SKELETON_DIRECTORY, selected_folder, "Spacemarine_skeleton.ma")
                print("Base Space Marine Skeleton imported.")
            elif "_KR" in file_name:
                base_body = os.path.join(BASE_SKELETON_DIRECTORY, selected_folder, "Kroot_skeleton.ma")
                print(base_body)
                print("Base Kroot Skeleton imported.")
            elif "_OG" in file_name:
                base_body = os.path.join(BASE_SKELETON_DIRECTORY, selected_folder, "Ogryn_skeleton.ma")
                print("Base Ogryn Skeleton imported.")
            else:
                cmds.error("Name of the file doesn't fit the naming standards. Rename it and try again.")
                return

            # Check if the base skeleton file exists
            if not os.path.exists(base_body):
                cmds.error(f"Base skeleton file not found: {base_body}")
                return

            # Import the base skeleton into the scene
            cmds.file(base_body, i=True)

            # Import the selected file into the scene
            if hasattr(self, 'selected_file') and self.selected_file:
                cmds.file(self.selected_file, i=True)
            else:
                print("No file selected for import.")

    def btn_open_scene_clicked(self):
        """
        Allows the user to open a file through a file dialog and imports it into a new Maya scene.
        """
        # Open a file dialog for the user to select a file
        file_filter = "Maya Files (*.ma *.mb);;All Files (*.*)"
        selected_file, _ = QtWidgets.QFileDialog.getOpenFileName(self, "Open Maya File", "", file_filter)

        if selected_file:
            try:
                # Create a new scene
                cmds.file(new=True, force=True)
                
                # Open the selected file
                cmds.file(selected_file, open=True, force=True)
                self.update_skin_weights_button_color()
                print(f"Successfully opened file: {selected_file}")
                self.update_file_name_field()
            except Exception as e:
                cmds.error(f"Failed to open the file: {selected_file}\nError: {e}")
        else:
            print("No file selected.")

    def update_file_name_field(self):
        file_name = utils.get_clean_file_name()
        self.file_name_field.setText(file_name)
    def btn_set_path_clicked(self):
        """
        Выбрать .ma/.mb через такой же Qt-диалог, как в btn_open_scene_clicked,
        и только сохранить путь/имя, не открывая сцену.
        """
        file_filter = "Maya Files (*.ma *.mb);;All Files (*.*)"
        start_dir = os.path.dirname(self.selected_file) if getattr(self, "selected_file", "") else ""
        selected_file, _ = QtWidgets.QFileDialog.getOpenFileName(
            self, "Select Maya File", start_dir, file_filter
        )

        if selected_file:
            self.selected_file = selected_file
            base_name = os.path.basename(selected_file)
            file_name, _ = os.path.splitext(base_name)
            self.file_name_field.setText(file_name)
            self.logger.info("Set Path: %s", selected_file)
            # если нужно, подсветим кнопку импорта скина:
            try:
                self.update_skin_weights_button_color()
            except Exception:
                pass
            return self.selected_file
        else:
            self.logger.info("Set Path canceled")
            return None

    def on_set_button_click(self):
        # Reference the global variable within the function
        self.selected_objects = cmds.ls(selection=True)

        if self.selected_objects:
            # Clear the QListWidget
            self.selected_objects_list.clear()

            # Add the selected objects to the QListWidget
            self.selected_objects_list.addItems(self.selected_objects)
        else:
            print("No objects selected.")

    def copy_w(self):
        source_mesh = None
        if cmds.objExists('BaseBodyMale_skinCluster'):
            source_mesh = 'BaseBodyMale_skinCluster'
            print(source_mesh)
        if cmds.objExists('BaseBody_Female_1_TS_TorsoBase_F_HM1_SkinCluster'):
            source_mesh = 'BaseBody_Female_1_TS_TorsoBase_F_HM1_SkinCluster'
            print(source_mesh)
        if cmds.objExists('BaseBodyAll_skinCluster'):
            source_mesh = 'BaseBodyAll_skinCluster'
            print(source_mesh)

        sk = []
        for obj in self.selected_objects:
            print(obj)
            cmds.select(obj)
            cmds.select('Pelvis', hi=True, add=True)

            # Check if the object already has a skinCluster
            existing_skin_clusters = cmds.ls(cmds.listHistory(obj), type='skinCluster')
            if existing_skin_clusters:
                print("Object already has a skinCluster:", existing_skin_clusters[0])
                sk.append(existing_skin_clusters[0])
            else:
                # If not, create a new skinCluster
                skin_cluster = cmds.skinCluster(tsb=True, name='%s_SkinCluster' % obj)
                sk.append(skin_cluster[0])

        for obj, skin_cluster in zip(self.selected_objects, sk):
            history_list = cmds.listHistory(obj)
            for node in history_list:
                if cmds.nodeType(node) == 'skinCluster':
                    cmds.copySkinWeights(sourceSkin=source_mesh, destinationSkin=node, noMirror=True,
                                        surfaceAssociation='closestPoint', influenceAssociation=['oneToOne'])

        for obj in self.selected_objects:
            self.remove_unused_influences(obj)

        for s in sk:
            if cmds.nodeType(s) == 'skinCluster':
                influences = cmds.skinCluster(s, query=True, influence=True)
                if 'Pelvis' not in influences:
                    cmds.skinCluster(s, edit=True, addInfluence='Pelvis')
                else:
                    print('Pelvis is already attached to the skinCluster')
        return

    def organization(self):
        # Use self.selected_objects instead of selected_objects
        if not self.selected_objects:
            print("No objects selected.")
            return

        LongName = self.selected_objects[0]
        name = LongName.split('_')[1]

        # Check if the group already exists
        existing_groups = cmds.ls("{}{}".format(name, '_group'), type='transform')
        if existing_groups:
            cmds.select(self.selected_objects)
            cmds.select(existing_groups, add=True)
            cmds.parent()
            return

        cmds.select(self.selected_objects)
        grp = cmds.group(n="{}{}".format(name, '_group'))

        displayL = cmds.createDisplayLayer(n="{}{}".format(name, '_layer'))  
        cmds.editDisplayLayerMembers(displayL, grp)
        return

    def remove_unused_influences(self, skinCls):
        '''
        Snippet to removeUnusedInfluences in Autodesk Maya using Python.
        The MEL version runs slowly, over every influence one at a time.
        This will only remove targets which are not currently being used.
        '''
        if not skinCls:
            return

        # Check if the skin cluster exists
        if cmds.objExists(skinCls):
            allInfluences = cmds.skinCluster(skinCls, q=True, inf=True)
            weightedInfluences = cmds.skinCluster(skinCls, q=True, wi=True)
            
            # Check if allInfluences and weightedInfluences are not None
            if allInfluences is not None and weightedInfluences is not None:
                unusedInfluences = [inf for inf in allInfluences if inf not in weightedInfluences]
                
                # Check if unusedInfluences is not None
                if unusedInfluences is not None:
                    cmds.skinCluster(skinCls, e=True, removeInfluence=unusedInfluences)

    def import_single_mesh_skin(self, mesh_name, skin_data_dir):
        """
        Импортирует skinCluster для одного меша из JSON-файла.
        Возвращает True, если успешно, иначе False.
        """
        import time, os
        t0 = time.perf_counter()
        log = self.logger

        try:
            log.info("[Skin Data] Import start: mesh=%s, dir=%s", mesh_name, skin_data_dir)

            xform = utils.transform_from_mesh_or_shape(mesh_name)
            if not xform:
                msg = f"Не удалось получить transform для {mesh_name}"
                OpenMaya.MGlobal.displayError(f"[Skin Data] {msg}")
                log.error("[Skin Data] %s", msg)
                return False
            log.debug("[Skin Data] Using transform: %s", xform)

            base_name = xform.split("|")[-1]
            json_path = os.path.join(skin_data_dir, f"{base_name}.json").replace("\\", "/")
            log.debug("[Skin Data] JSON path resolved: %s", json_path)

            if not os.path.isfile(json_path):
                OpenMaya.MGlobal.displayError(f"[Skin Data] JSON файл не найден: {json_path}")
                log.warning("[Skin Data] JSON not found: %s", json_path)
                return False

            # основной импорт
            owl_import_skin_from_json_replace.import_skin_from_json_replace(xform, json_path)
            OpenMaya.MGlobal.displayInfo(f"[Skin Data] Import OK ← {json_path}")
            log.info("[Skin Data] Import OK ← %s (%.2fs)", json_path, time.perf_counter() - t0)
            return True

        except Exception as e:
            OpenMaya.MGlobal.displayError(f"[Skin Data] Import FAIL for {mesh_name}: {e}")
            log.exception("[Skin Data] Import FAIL for %s (json dir=%s)", mesh_name, skin_data_dir)
            return False

    def import_skin_data(self):
        """
        Импортирует skinCluster для одного или нескольких мешей из папки skinData.
        """
        import time
        t0 = time.perf_counter()
        log = self.logger

        log.info("[Skin Data] Import: start")

        # 1) Проверка папки
        skin_data_dir = utils.ensure_skinData_dir_or_warn()
        if not skin_data_dir:
            log.warning("[Skin Data] RIG/skinData dir not found. Ask user to save skeleton first.")
            QtWidgets.QMessageBox.information(
                self,
                "Skin Data",
                "Папка RIG не найдена рядом со сценой.\n\n"
                "Сначала нажми «Save Maya Skeleton File», чтобы создать структуру,\n"
                "а затем повтори импорт."
            )
            return

        # 2) Список мешей
        mesh_names = (self.selected_objects or
                    utils.collect_mesh_names_from_scroll(
                        scroll_content=getattr(self, "scroll_content", None),
                        mesh_items=getattr(self, "mesh_items", None)
                    ))

        if not mesh_names:
            log.warning("[Skin Data] Mesh list is empty.")
            QtWidgets.QMessageBox.warning(self, "Skin Data", "Список объектов пуст. Добавь меши в список.")
            return

        # 3) Один или несколько
        if len(mesh_names) == 1:
            m = mesh_names[0]
            log.info("[Skin Data] Single import: %s → %s", m, skin_data_dir)
            ok = False
            try:
                ok = self.import_single_mesh_skin(m, skin_data_dir)
            except Exception:
                log.exception("[Skin Data] Crash on single import: %s", m)
            if ok:
                log.info("[Skin Data] Import OK: %s", m)
                QtWidgets.QMessageBox.information(self, "Skin Data", f"Импорт завершён.\nПапка: {skin_data_dir}")
            else:
                log.warning("[Skin Data] Import FAIL: %s", m)
                QtWidgets.QMessageBox.warning(self, "Skin Data", "Импорт завершился с предупреждениями. См. лог.")
        else:
            total = len(mesh_names)
            log.info("[Skin Data] Batch import: %d meshes → %s", total, skin_data_dir)
            log.debug("[Skin Data] Meshes: %s", ", ".join(mesh_names))
            ok_count = 0
            for m in mesh_names:
                try:
                    if self.import_single_mesh_skin(m, skin_data_dir):
                        ok_count += 1
                        log.info("[Skin Data] OK: %s", m)
                    else:
                        log.warning("[Skin Data] FAIL: %s", m)
                except Exception:
                    log.exception("[Skin Data] Crash on: %s", m)

            QtWidgets.QMessageBox.information(
                self,
                "Skin Data",
                f"Импорт завершён.\nУспешно: {ok_count} из {total}\nПапка: {skin_data_dir}"
            )
            log.info("[Skin Data] Done: %d/%d", ok_count, total)

        log.info("[Skin Data] Import: finish in %.2fs", time.perf_counter() - t0)

    def export_single_mesh_skin(self, mesh_name, skin_data_dir):
        """
        Экспортирует skinCluster для одного меша.
        Возвращает True если успешно, False если ошибка.
        """
        try:
            xform = utils.transform_from_mesh_or_shape(mesh_name)
            base_name = xform.split("|")[-1]
            out_path = os.path.join(skin_data_dir, f"{base_name}.json").replace("\\", "/")
            owl_export_skin_to_json.export_skin_to_json(xform, out_path)
            OpenMaya.MGlobal.displayInfo(f"[Skin Data] Export OK → {out_path}")
            return True
        except Exception as e:
            OpenMaya.MGlobal.displayError(f"[Skin Data] Export FAIL for {mesh_name}: {e}")
            return False

    def export_skin_data(self):
        """
        Проверяет папки, собирает список мешей и экспортирует их skinCluster.
        Если в списке один меш — экспортирует один, иначе несколько.
        """
        import time
        t0 = time.perf_counter()
        log = self.logger

        log.info("=== Export Skin Data: start ===")

        skin_data_dir = utils.ensure_skinData_dir_or_warn()
        if not skin_data_dir:
            log.warning("Skin Data dir is missing. User must save skeleton file first. Aborting.")
            QtWidgets.QMessageBox.information(
                self,
                "Skin Data",
                "Папка RIG не найдена рядом со сценой.\n\n"
                "Сначала нажми «Save Maya Skeleton File», чтобы создать структуру,\n"
                "а затем повтори экспорт."
            )
            return


        mesh_names = (self.selected_objects or
                    utils.collect_mesh_names_from_scroll(
                        scroll_content=getattr(self, "scroll_content", None),
                        mesh_items=getattr(self, "mesh_items", None)
                    ))

        if not mesh_names:
            log.warning("No meshes selected/found for export.")
            QtWidgets.QMessageBox.warning(self, "Skin Data", "Список объектов пуст. Добавь меши в список.")
            return

        total = len(mesh_names)
        if total == 1:
            log.info("Exporting single mesh: %s → %s", mesh_names[0], skin_data_dir)
            try:
                ok = self.export_single_mesh_skin(mesh_names[0], skin_data_dir)
                if ok:
                    log.info("Export OK: %s", mesh_names[0])
                    QtWidgets.QMessageBox.information(self, "Skin Data", f"Экспорт завершён.\nПапка: {skin_data_dir}")
                else:
                    log.warning("Export returned False for: %s", mesh_names[0])
                    QtWidgets.QMessageBox.warning(self, "Skin Data", "Экспорт завершился с предупреждениями.")
            except Exception:
                log.exception("Export crashed for: %s", mesh_names[0])
                QtWidgets.QMessageBox.critical(self, "Skin Data", "Экспорт упал с ошибкой. Подробности в логе.")
        else:
            log.info("Exporting %d meshes → %s", total, skin_data_dir)
            log.debug("Meshes: %s", ", ".join(mesh_names))
            ok_count = 0
            for m in mesh_names:
                try:
                    if self.export_single_mesh_skin(m, skin_data_dir):
                        ok_count += 1
                        log.info("OK: %s", m)
                    else:
                        log.warning("Returned False: %s", m)
                except Exception:
                    log.exception("Crash on: %s", m)
            QtWidgets.QMessageBox.information(
                self,
                "Skin Data",
                f"Экспорт завершён.\nУспешно: {ok_count} из {total}\nПапка: {skin_data_dir}"
            )
            log.info("Done: %d/%d", ok_count, total)

        log.info("=== Export Skin Data: finish in %.2fs ===", time.perf_counter() - t0)

    def on_export_skin_weights_clicked(self):
        self.export_skin_data()

    def exportFbx(self):
        """
        Export selected objects to FBX format and save skinCluster weights as JSON files.
        """
        import time
        t0 = time.perf_counter()
        log = self.logger
        log.info("FBX export: start")

        # Входные проверки
        if not self.selected_file:
            log.warning("No file selected for export. Use 'Set Path' first.")
            QtWidgets.QMessageBox.information(self, "FBX", "Не выбран файл. Сначала нажми «Set Path».")
            return
        if not self.selected_objects:
            log.warning("No objects selected for FBX export.")
            QtWidgets.QMessageBox.warning(self, "FBX", "Список объектов пуст.")
            return

        # Папки
        file_path = os.path.dirname(self.selected_file)
        parent_folder = os.path.abspath(os.path.join(file_path, os.pardir))

        # FBX: загрузка плагина и флаги (внутри ensure_fbx). Проверяем результат.
        if not owl_fbx_export_settings.set_unity_fbx_flags(log):
            QtWidgets.QMessageBox.critical(self, "FBX", "FBX plugin не загружен или флаги не применились. См. лог.")
            log.error("Abort: FBX flags not applied (plugin missing?).")
            return

        export_dir = os.path.join(parent_folder, 'Skinned_FBX')
        os.makedirs(export_dir, exist_ok=True)

        file_name = self.file_name_field.text() if self.file_name_field else "default"
        if "_M_" in file_name:
            sex_dir = os.path.join(export_dir, 'Skinned_Male_FBX')
        elif "_F_" in file_name:
            sex_dir = os.path.join(export_dir, 'Skinned_Female_FBX')
        else:
            sex_dir = export_dir
        os.makedirs(sex_dir, exist_ok=True)

        pelvis_joint = 'Pelvis'
        pelvis_exists = cmds.objExists(pelvis_joint)

        ok_count = 0
        for selected_object in self.selected_objects:
            try:
                # Добавляем Pelvis как influence при необходимости
                skin_clusters = cmds.ls((cmds.listHistory(selected_object) or []), type='skinCluster') or []
                if skin_clusters:
                    skin_cluster = skin_clusters[0]
                    if pelvis_exists:
                        infs = cmds.skinCluster(skin_cluster, q=True, influence=True) or []
                        if pelvis_joint not in infs:
                            cmds.skinCluster(skin_cluster, e=True, ai=pelvis_joint)
                            log.debug("Added Pelvis influence to %s (skinCluster=%s)", selected_object, skin_cluster)
                    else:
                        log.warning("Pelvis joint not found; skip adding influence for %s", selected_object)

                # Экспорт FBX
                object_name = selected_object.split('|')[-1]
                fbx_path = os.path.join(sex_dir, f'{object_name}.fbx').replace("\\", "/")
                cmds.select(selected_object, r=True)
                log.info("FBXExport → %s", fbx_path)
                try:
                    mel.eval(f'FBXExport -f "{fbx_path}" -s;')
                    ok_count += 1
                    log.info("OK: %s", object_name)
                except Exception:
                    log.exception("FBX export failed for %s", object_name)

            except Exception:
                log.exception("Unexpected error on object: %s", selected_object)

        QtWidgets.QMessageBox.information(
            self, "FBX",
            f"Экспорт завершён. Успешно: {ok_count} из {len(self.selected_objects)}\nПапка: {sex_dir}"
        )
        log.info("FBX export: finish in %.2fs", time.perf_counter() - t0)

    def save_maya_scene(self):
        """
        Save RIG work file in the 'RIG' directory one level up from the selected file.
        """
        log = self.logger
        
        if not hasattr(self, 'selected_file') or not self.selected_file:
            print("No file selected for export.")
            return

        # Get the directory of the selected file
        selected_dir = os.path.dirname(self.selected_file)

        # Create the export directory if it doesn't exist
        rig_dir = os.path.abspath(os.path.join(selected_dir, '..', 'RIG'))
        log.info(rig_dir)

        if not os.path.exists(rig_dir):
            os.makedirs(rig_dir)

        rig_file_name = self.file_name_field.text().split('_Scale_x001')[0]
        log.info(rig_file_name)

        # Print the full path before the cmds.file command
        full_path = os.path.join(rig_dir, '%s_skeleton.ma' % rig_file_name)
        log.info("Full Path: %s", full_path)

        cmds.file(rename=full_path)
        cmds.file(force=True, save=True, type='mayaAscii')

        return

    RACE_CODE_MAP = {
        "_HM": "Human",
        "_EL": "Eldar",
        "_SM": "Spacemarine",
        "_KR": "Kroot",
        "_OG": "Ogryn",
    }


    def _animations_dir_for_current_project(self) -> str:
        project = self.combobox_race.currentText() if hasattr(self, "combobox_race") else ""
        # script_root = DIRECTORY (у тебя уже объявлен глобально)
        return os.path.join(DIRECTORY, "animations", f"{project}_anim")


    def _detect_race_and_gender_from_filename(self, file_name: str):
        race = None
        for code, race_name in self.RACE_CODE_MAP.items():
            if code in file_name:
                race = race_name
                break

        gender = None
        if "_M_" in file_name:
            gender = "M"
        elif "_F_" in file_name:
            gender = "F"

        return race, gender
    
    def refresh_animation_types(self):
        if not hasattr(self, "combobox_animation"):
            return

        self.combobox_animation.blockSignals(True)
        self.combobox_animation.clear()

        anim_dir = self._animations_dir_for_current_project()
        file_name = self.file_name_field.text() if hasattr(self, "file_name_field") else ""

        race, gender = self._detect_race_and_gender_from_filename(file_name)


        if not os.path.isdir(anim_dir):
            self.combobox_animation.addItem("Animations folder not found")
            self.combobox_animation.model().item(0).setEnabled(False)
            self.combobox_animation.blockSignals(False)
            return

        if not race or not gender:
            self.combobox_animation.addItem("Set file name to detect race/gender")
            self.combobox_animation.model().item(0).setEnabled(False)
            self.combobox_animation.blockSignals(False)
            return

        wanted_prefix = f"{race}_{gender}_"
        found_anim_types = []

        for fname in os.listdir(anim_dir):
            if not fname.lower().endswith(".json"):
                continue
            if not fname.startswith(wanted_prefix):
                continue

            try:
                base = os.path.splitext(fname)[0]
                # base.split('_') = [Race, Gender, AnimType]
                parts = base.split("_", 2)
                if len(parts) == 3:
                    anim_type = parts[2]
                    found_anim_types.append(anim_type)
            except Exception:
                pass

        if found_anim_types:
            for anim in sorted(set(found_anim_types), key=str.lower):
                self.combobox_animation.addItem(anim)
            self.combobox_animation.setCurrentIndex(0)
        else:
            self.combobox_animation.addItem("No animations found")
            self.combobox_animation.model().item(0).setEnabled(False)

        self.combobox_animation.blockSignals(False)

    def _current_animation_json_path(self):
        anim_dir = self._animations_dir_for_current_project()
        if not os.path.isdir(anim_dir):
            QtWidgets.QMessageBox.warning(self, "Test Animation", f"Animations folder not found:\n{anim_dir}")
            self.logger.warning("Animations folder not found: %s", anim_dir)
            return None

        file_name = self.file_name_field.text() if hasattr(self, "file_name_field") else ""
        race, gender = self._detect_race_and_gender_from_filename(file_name)
        if not race or not gender:
            QtWidgets.QMessageBox.warning(self, "Test Animation",
                                        "Set file name to detect race/gender (e.g. ..._M_.../_F_... and _HM/_EL/...).")
            self.logger.warning("Race/Gender not detected from file name: %s", file_name)
            return None

        if not hasattr(self, "combobox_animation") or self.combobox_animation.count() == 0:
            QtWidgets.QMessageBox.warning(self, "Test Animation", "Animation list is empty.")
            self.logger.warning("Animation combobox is empty.")
            return None

        anim_type = self.combobox_animation.currentText()
        if anim_type in ("Animations folder not found", "Set file name to detect race/gender", "No animations found"):
            QtWidgets.QMessageBox.warning(self, "Test Animation", "No valid animation selected.")
            self.logger.warning("No valid animation selected: %s", anim_type)
            return None

        json_path = os.path.join(anim_dir, f"{race}_{gender}_{anim_type}.json").replace("\\", "/")
        if not os.path.isfile(json_path):
            QtWidgets.QMessageBox.warning(self, "Test Animation", f"Animation JSON not found:\n{json_path}")
            self.logger.warning("Animation JSON not found: %s", json_path)
            return None

        return json_path

    def import_test_animation(self):
        json_path = self._current_animation_json_path()
        if not json_path:
            return

        root = utils.detect_root_joint()
        if not root:
            QtWidgets.QMessageBox.warning(self, "Test Animation", "Root joint not found (Pelvis/Position/…).")
            self.logger.warning("Import: root joint not found.")
            return

        joints = utils.collect_joints_from_root(root)
        self._anim_snapshot = utils.snapshot_channels(joints)
        self._anim_joints = joints

        try:
            root_short = root.split(":")[-1]
            res = owl_import_animation_from_json.import_animation_from_json(
                json_path,
                auto_detect_namespace_root=root_short
            )
            self._anim_frame_range = tuple(res.get("frame_range", (
                int(cmds.playbackOptions(q=True, ast=True)),
                int(cmds.playbackOptions(q=True, aet=True))
            )))
            self.logger.info("Test anim imported: %s | ns=%s | joints=%d, missing=%d | range=%s-%s | fps=%s",
                            json_path,
                            res.get("namespace_used",""),
                            len(res.get("applied_joints", [])),
                            len(res.get("missing_joints", [])),
                            self._anim_frame_range[0], self._anim_frame_range[1],
                            res.get("fps"))
        except Exception as e:
            self.logger.exception("Import test animation failed: %s", e)
            QtWidgets.QMessageBox.critical(self, "Test Animation", f"Import failed:\n{e}")

    def clear_animation(self):
        if not self._anim_snapshot or not self._anim_joints:
            root = utils.detect_root_joint()
            if not root:
                QtWidgets.QMessageBox.warning(self, "Clear Test Animation", "Nothing to clear / root not found.")
                self.logger.warning("Clear: no snapshot and no root.")
                return
            joints = utils.collect_joints_from_root(root)
            start = int(cmds.playbackOptions(q=True, ast=True))
            end = int(cmds.playbackOptions(q=True, aet=True))
            utils.remove_keys_on_joints(joints, (start, end))
            QtWidgets.QMessageBox.information(self, "Clear Test Animation", "Keys removed (no snapshot available).")
            self.logger.info("Clear without snapshot: joints=%d, range=%d-%d", len(joints), start, end)
            return

        if self._anim_frame_range and all(isinstance(x, int) for x in self._anim_frame_range):
            start, end = self._anim_frame_range
        else:
            start = int(cmds.playbackOptions(q=True, ast=True))
            end = int(cmds.playbackOptions(q=True, aet=True))

        utils.remove_keys_on_joints(self._anim_joints, (start, end))
        utils.restore_channels(self._anim_snapshot)

        n = len(self._anim_joints)
        self._anim_snapshot = None
        self._anim_joints = []
        self._anim_frame_range = None

        self.logger.info("Clear with snapshot: joints=%d, range=%d-%d", n, start, end)


    def create_animation_type_combobox(self):
        self.combobox_animation = QtWidgets.QComboBox()
        self.test_animation_layout.addWidget(self.combobox_animation)

        # Авто-обновление при смене проекта и имени файла
        if hasattr(self, "combobox_race"):
            self.combobox_race.currentIndexChanged.connect(self.refresh_animation_types)
        if hasattr(self, "file_name_field"):
            self.file_name_field.textChanged.connect(self.refresh_animation_types)

        # Первый прогон
        self.refresh_animation_types()

    def _on_import_button_menu(self, pos):
        menu = QtWidgets.QMenu(self)
        act_export = menu.addAction("Export current scene animation to JSON…")
        act_export.triggered.connect(self.export_current_animation_json)
        menu.exec_(self.import_test_animation_button.mapToGlobal(pos))

    def export_current_animation_json(self):
        # 1) выбор подпапки внутри /animations, стартуем с текущего проекта
        project_name = self.combobox_race.currentText() if hasattr(self, "combobox_race") else ""
        target_dir = utils.pick_target_anim_subfolder(parent=self, project_name=project_name)
        if not target_dir:
            return

        # 2) имя файла = имя текущей сцены
        base_name = utils.scene_base_name()
        out_path = os.path.join(target_dir, base_name + ".json").replace("\\", "/")
        if not utils.confirm_overwrite(out_path, parent=self):
            return

        # 3) рут скелета
        root_joint = utils.detect_root_joint_safe()
        if not root_joint:
            QtWidgets.QMessageBox.warning(self, "Export Animation", "Root joint not found (Pelvis/Position/…).")
            return

        # 4) экспорт
        cmds.undoInfo(openChunk=True)
        try:
            path, data = anim_export.export_animation_to_json(out_path, root_joint=root_joint)
            joints_count = len(data.get("keys", {}))
            start = data.get("start_frame"); end = data.get("end_frame"); fps = data.get("fps")
            self.logger.info("Animation exported → %s (joints=%d, range=%s-%s, fps=%s)",
                            path, joints_count, start, end, fps)
            QtWidgets.QMessageBox.information(
                self, "Export Animation",
                f"Saved:\n{path}\n\nJoints: {joints_count}\nFrames: {start}–{end}\nFPS: {fps}"
            )
        except Exception as e:
            self.logger.exception("Export animation failed: %s", e)
            QtWidgets.QMessageBox.critical(self, "Export Animation", f"Failed:\n{e}")
        finally:
            cmds.undoInfo(closeChunk=True)



def clean_ui():
    if cmds.window("CHBodyPartSkinnerID", exists=True):
        cmds.deleteUI("CHBodyPartSkinnerID", window=True)

    if cmds.windowPref("CHBodyPartSkinnerID", exists=True):
        cmds.windowPref("CHBodyPartSkinnerID", remove=True)


clean_ui()
win = BodyPartSkinnerUI()
win.show()
