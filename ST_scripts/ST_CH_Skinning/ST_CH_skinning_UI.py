from maya import cmds
from PySide2 import QtCore, QtGui, QtWidgets
import os
import maya.mel as mel
import sys
import json
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin
import maya.OpenMaya as OpenMaya
import importlib

import ST_CH_Skinning._logic.export_skin_to_JSON as owl_export_skin_to_json
import ST_CH_Skinning._logic.import_skin_to_JSON as owl_import_skin_from_json_replace
import ST_CH_Skinning._utils.operation_utils as utils

importlib.reload(owl_export_skin_to_json)
importlib.reload(owl_import_skin_from_json_replace)
importlib.reload(utils)


USERAPPDIR = cmds.internalVar(userAppDir=True)
DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'ST_CH_Skinning')
BASE_SKELETON_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'ST_CH_Skinning', 'base_skeletons')
presetPathName = DIRECTORY + "/UMA_Male_Rig_AnimationExport.fbxexportpreset"


class BodyPartSkinnerUI(MayaQWidgetDockableMixin, QtWidgets.QWidget):
    def __init__(self):
        super(BodyPartSkinnerUI, self).__init__()

        self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        self.selected_objects_list = QtWidgets.QListWidget()  # Initialize the list widget
        self.selected_objects = []
        self.scene_callbacks = []      # список callback'ов на сцену (пока пустой)
        self.selected_file = ""        # путь к исходному файлу до первого Set Path

        self.init_ui()

    def init_ui(self):
        self.setWindowTitle("BodyPart skinner v 2.1")
        self.setObjectName("CHBodyPartSkinnerID")
        #self.setGeometry(300, 300, 250, 400)

        self.setMinimumSize(450, 500)
        self.setMaximumSize(550, 1000)
        self.resize(450, 600)

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

        self.import_skin_weights_btn()

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

        self.export_skin_button = QtWidgets.QPushButton("Export Skin Data")
        self.export_skin_button.clicked.connect(self.on_export_skin_weights_clicked)
        self.buttons_layout.addWidget(self.export_skin_button)

        self.main_layout.addLayout(self.buttons_layout)


        #Save Menu Button
        self.save_button_layout = QtWidgets.QHBoxLayout()

        self.save_button = QtWidgets.QPushButton("Save Maya Skeleton File")
        self.save_button.clicked.connect(self.save_maya_scene)
        self.save_button_layout.addWidget(self.save_button)
        self.main_layout.addLayout(self.save_button_layout)

        #Close Menu Button
        self.close_button_layout = QtWidgets.QHBoxLayout()

        self.close_button = QtWidgets.QPushButton("Close")
        self.close_button.clicked.connect(self.close)
        self.close_button_layout.addWidget(self.close_button)
        self.main_layout.addLayout(self.close_button_layout)

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
        self.import_skin_button = QtWidgets.QPushButton("Import skin weights from skin data")
        parent_folder = os.path.dirname(self.selected_file) if hasattr(self, 'selected_file') else None
        skin_data_dir = os.path.join(parent_folder, 'RIG', "SkinData") if parent_folder else None

        if skin_data_dir and os.path.exists(skin_data_dir):
            self.import_skin_button.setStyleSheet("background-color: green; color: white;")
        else:
            self.import_skin_button.setStyleSheet("background-color: grey; color: white;")
        
        self.import_skin_button.clicked.connect(self.import_skin_data)
        self.main_layout.addWidget(self.import_skin_button)


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
                base_body = os.path.join(BASE_SKELETON_DIRECTORY, selected_folder, "Eldar_Female_skeleton.ma")
                print("Base Eldar Female Skeleton imported.")
            elif "_SM" in file_name:
                base_body = os.path.join(BASE_SKELETON_DIRECTORY, selected_folder, "Spacemarine_Male_skeleton.ma")
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
            except Exception as e:
                cmds.error(f"Failed to open the file: {selected_file}\nError: {e}")
        else:
            print("No file selected.")


    def btn_set_path_clicked(self):
        # Open file dialog to set the animation folder path
        multipleFilters = "Maya Files (*.ma *.mb)"
        self.folder_path = cmds.fileDialog2(fileFilter=multipleFilters, dialogStyle=2, fileMode=1)
        if self.folder_path:
            self.selected_file = self.folder_path[0]
            base_name = os.path.basename(self.selected_file)
            file_name, _ = os.path.splitext(base_name)
            self.file_name_field.setText(file_name)

            print("File name:", file_name)
            return self.selected_file

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
        try:
            xform = utils.transform_from_mesh_or_shape(mesh_name)
            base_name = xform.split("|")[-1]
            json_path = os.path.join(skin_data_dir, f"{base_name}.json").replace("\\", "/")

            if not os.path.isfile(json_path):
                OpenMaya.MGlobal.displayError(f"[Skin Data] JSON файл не найден: {json_path}")
                return False

            owl_import_skin_from_json_replace.import_skin_from_json_replace(xform, json_path) 
            OpenMaya.MGlobal.displayInfo(f"[Skin Data] Import OK ← {json_path}")
            return True

        except Exception as e:
            OpenMaya.MGlobal.displayError(f"[Skin Data] Import FAIL for {mesh_name}: {e}")
            return False


    def import_skin_data(self):
        """
        Импортирует skinCluster для одного или нескольких мешей из папки skinData.
        """
        # 1) Проверка папки
        skin_data_dir = utils.ensure_skinData_dir_or_warn()
        if not skin_data_dir:
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
            QtWidgets.QMessageBox.warning(self, "Skin Data", "Список объектов пуст. Добавь меши в список.")
            return

        # 3) Один или несколько
        if len(mesh_names) == 1:
            if self.import_single_mesh_skin(mesh_names[0], skin_data_dir):
                QtWidgets.QMessageBox.information(self, "Skin Data", f"Импорт завершён.\nПапка: {skin_data_dir}")
        else:
            ok_count = sum(self.import_single_mesh_skin(m, skin_data_dir) for m in mesh_names)
            QtWidgets.QMessageBox.information(
                self,
                "Skin Data",
                f"Импорт завершён.\nУспешно: {ok_count} из {len(mesh_names)}\nПапка: {skin_data_dir}"
            )


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
        # 1) Проверка папки
        skin_data_dir = utils.ensure_skinData_dir_or_warn()
        if not skin_data_dir:
            QtWidgets.QMessageBox.information(
                self,
                "Skin Data",
                "Папка RIG не найдена рядом со сценой.\n\n"
                "Сначала нажми «Save Maya Skeleton File», чтобы создать структуру,\n"
                "а затем повтори экспорт."
            )
            return

        # 2) Список мешей
        mesh_names = (self.selected_objects or
                    utils.collect_mesh_names_from_scroll(
                        scroll_content=getattr(self, "scroll_content", None),
                        mesh_items=getattr(self, "mesh_items", None)
                    ))

        if not mesh_names:
            QtWidgets.QMessageBox.warning(self, "Skin Data", "Список объектов пуст. Добавь меши в список.")
            return

        # 3) Один или несколько
        if len(mesh_names) == 1:
            if self.export_single_mesh_skin(mesh_names[0], skin_data_dir):
                QtWidgets.QMessageBox.information(self, "Skin Data", f"Экспорт завершён.\nПапка: {skin_data_dir}")
        else:
            ok_count = sum(self.export_single_mesh_skin(m, skin_data_dir) for m in mesh_names)
            QtWidgets.QMessageBox.information(
                self,
                "Skin Data",
                f"Экспорт завершён.\nУспешно: {ok_count} из {len(mesh_names)}\nПапка: {skin_data_dir}"
            )




    def on_export_skin_weights_clicked(self):
        # Просто дергаем нормальную функцию экспорта,
        # которая уже умеет: проверить/создать RIG/SkinData,
        # собрать меши и пройтись циклом
        self.export_skin_data()


    def exportFbx(self):
        """
        Export selected objects to FBX format and save skinCluster weights as JSON files.
        """
        pelvis_joint = 'Pelvis'
        if not self.selected_file:
            print("No file selected for export.")
            return

        file_path = os.path.dirname(self.selected_file)
        parent_folder = os.path.abspath(os.path.join(file_path, os.pardir))

        # FBX Export Directory
        export_dir = os.path.join(parent_folder, 'Skinned_FBX')
        os.makedirs(export_dir, exist_ok=True)

        

        file_name = self.file_name_field.text() if self.file_name_field else "default"
        sex_dir = None

        if "_M_" in file_name:
            sex_dir = os.path.join(export_dir, 'Skinned_Male_FBX')
        elif "_F_" in file_name:
            sex_dir = os.path.join(export_dir, 'Skinned_Female_FBX')
        else:
            sex_dir = export_dir

        os.makedirs(sex_dir, exist_ok=True)

        for selected_object in self.selected_objects:
            # Check and add "Pelvis" influence if needed
            skin_clusters = cmds.ls(cmds.listHistory(selected_object), type='skinCluster')
            if skin_clusters:
                skin_cluster = skin_clusters[0]
                if pelvis_joint not in cmds.skinCluster(skin_cluster, query=True, influence=True):
                    cmds.skinCluster(skin_cluster, edit=True, ai=pelvis_joint)

            # Export FBX
            cmds.select(selected_object)
            object_name = selected_object.split('|')[-1]
            fbx_path = os.path.join(sex_dir, f'{object_name}.fbx').replace("\\", "/")
            print(f"Exporting FBX to: {fbx_path}")
            mel.eval(f'file -force -options "v=0;" -typ "FBX export" -pr -es "{fbx_path}";')
            #cmds.file(fbx_path, force=True, options="v=0;", type="FBX", preserveReferences=True, exportSelected=True)

        print("Export complete.")


    def save_maya_scene(self):
        """
        Save RIG work file in the 'RIG' directory one level up from the selected file.
        """
        if not hasattr(self, 'selected_file') or not self.selected_file:
            print("No file selected for export.")
            return

        # Get the directory of the selected file
        selected_dir = os.path.dirname(self.selected_file)

        # Create the export directory if it doesn't exist
        rig_dir = os.path.abspath(os.path.join(selected_dir, '..', 'RIG'))
        print(rig_dir)

        if not os.path.exists(rig_dir):
            os.makedirs(rig_dir)

        rig_file_name = self.file_name_field.text().split('_Scale_x001')[0]
        print(rig_file_name)

        # Print the full path before the cmds.file command
        full_path = os.path.join(rig_dir, '%s_skeleton.ma' % rig_file_name)
        print("Full Path:", full_path)

        cmds.file(rename=full_path)
        cmds.file(force=True, save=True, type='mayaAscii')

        file_path = os.path.dirname(self.selected_file)
        parent_folder = os.path.abspath(os.path.join(file_path, os.pardir))

        # правильная папка: внутри RIG
        skin_data_dir = os.path.join(rig_dir, 'SkinData')
        os.makedirs(skin_data_dir, exist_ok=True)

        # если есть выбранные меши — экспортнём их
        for selected_object in getattr(self, "selected_objects", []):
            object_name = selected_object.split('|')[-1]
            json_path = os.path.join(skin_data_dir, f'{object_name}.json').replace("\\", "/")
            self.export_single_mesh_skin(selected_object, skin_data_dir)


        return


def clean_ui():
    if cmds.window("CHBodyPartSkinnerID", exists=True):
        cmds.deleteUI("CHBodyPartSkinnerID", window=True)

    if cmds.windowPref("CHBodyPartSkinnerID", exists=True):
        cmds.windowPref("CHBodyPartSkinnerID", remove=True)


clean_ui()
win = BodyPartSkinnerUI()
win.show()
