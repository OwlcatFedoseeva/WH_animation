from maya import cmds
from PySide2 import QtCore, QtGui, QtWidgets
import os
from pymel.core import mel
import sys

USERAPPDIR = cmds.internalVar(userAppDir=True)
DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'ST_CH_Skinning')
BASE_SKELETON_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'ST_CH_Skinning', 'base_skeletons')
presetPathName = DIRECTORY + "/UMA_Male_Rig_AnimationExport.fbxexportpreset"


class BodyPartSkinnerUI(QtWidgets.QWidget):
    def __init__(self):
        super(BodyPartSkinnerUI, self).__init__()
        self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        self.selected_objects_list = QtWidgets.QListWidget()  # Initialize the list widget
        self.selected_objects = []

        self.init_ui()

    def init_ui(self):
        self.setWindowTitle("BodyPart skinner v 1.2")
        self.setObjectName("CHBodyPartSkinnerID")
        self.setGeometry(300, 300, 250, 400)

        self.main_layout = QtWidgets.QVBoxLayout(self)

        # Create a horizontal layout for the folder path line edit and Set Path button
        self.path_layout = QtWidgets.QHBoxLayout()

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

    def btn_build_scene_clicked(self):
        file_name = self.file_name_field.text()
        if file_name:
            if "_HM_" in file_name and "_M_" in file_name:
                base_body = os.path.join(BASE_SKELETON_DIRECTORY , 'Base_Male_Skeleton.ma')
                        # Check if the base skeleton file exists
                if not os.path.exists(base_body):
                    cmds.error("Base skeleton file not found: {}".format(base_body))
                    return

                else:
                    cmds.file(base_body, i=True)

                cmds.file(self.selected_file, i=True)

            elif "_HM_" in file_name and "_F_" in file_name:
                print("Importing Base Human Female Skeleton")

            elif "_EL_" in file_name and "_M_" in file_name:
                print("Importing Base Eldar Male Skeleton")

            elif "_EL_" in file_name and "_F_" in file_name:
                print("Importing Base Eldar Female Skeleton")

            elif "_SM_" in file_name:
                print("Importing Base Space Marine Skeleton")

            else:
                cmds.error("Name of the file doesn't fit the naming standards: {}. Rename it and try again.".format(file_name))

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


    def exportFbx(self):
        """
        Export the selected objects to FBX format in a directory one level up from the selected file.
        """
        if not hasattr(self, 'selected_file') or not self.selected_file:
            print("No file selected for export.")
            return

        # Get the directory of the selected file
        selected_dir = os.path.dirname(self.selected_file)

        # Create the export directory if it doesn't exist
        export_dir = os.path.abspath(os.path.join(selected_dir, '..', 'Skinned_FBX'))
        print (export_dir)

        if not os.path.exists(export_dir):
            os.makedirs(export_dir)

        for selected_object in self.selected_objects:
            cmds.select(selected_object)
            name = selected_object.split('|')[-1]
            new_file_path_name = os.path.join(export_dir, '{}.fbx'.format(name))
            mel.eval('file -force -options "v=0;" -typ "FBX export" -pr -es "{}";'.format(new_file_path_name))
            print("Export is complete:", new_file_path_name)

        
        return



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
        full_path = os.path.join(rig_dir, '%s_RIG.ma' % rig_file_name)
        print("Full Path:", full_path)

        cmds.file(rename=full_path)
        cmds.file(force=True, save=True, type='mayaAscii')
        return


def clean_ui():
    if cmds.window("CHBodyPartSkinnerID", exists=True):
        cmds.deleteUI("CHBodyPartSkinnerID", window=True)

    if cmds.windowPref("CHBodyPartSkinnerID", exists=True):
        cmds.windowPref("CHBodyPartSkinnerID", remove=True)


clean_ui()
win = BodyPartSkinnerUI()
win.show()
