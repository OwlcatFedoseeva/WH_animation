from maya import cmds
from PySide2 import QtCore, QtGui, QtWidgets
import os
import json
from pymel.core import mel



USERAPPDIR = cmds.internalVar(userAppDir=True)
PRESET_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'WH_CHanimExport')
presetPathName = PRESET_DIRECTORY + "/UMA_Male_Rig_AnimationExport.fbxexportpreset"
newFileName = None
filePathName = cmds.file(query=True, sceneName=True)
DIRECTORY = os.path.dirname(filePathName)
DummyFolder = DIRECTORY + '/' +'AnimExport'

class ch_anim_export(QtWidgets.QDialog):
    
    def __init__(self):
        super(ch_anim_export, self).__init__()
        #self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        self.setup_ui()
        self.toDel = None
        self.position = 'Position'
        self.root = 'Root_M'
        self.folder_path=None


    def setup_ui(self):
        self.setWindowTitle("Character Animation Export 4.1")
        self.setObjectName("CHAnimExportID")
        self.setMinimumSize(400, 315)
        self.setMaximumSize(800, 325)
        self.resize(400, 315)
        
        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(3, 5, 3, 3)
        self.main_layout.setSpacing(5)
        self.setLayout(self.main_layout)

        # Add a QLabel for the title text
        self.title_label_A = QtWidgets.QLabel("Human| Eldar| SpaceMarine Export")
        self.title_label_A.setAlignment(QtCore.Qt.AlignHCenter)
        self.title_font_A = self.title_label_A.font()
        self.title_font_A.setBold(True)
        self.title_font_A.setPointSize(12)
        self.title_label_A.setFont(self.title_font_A)
        self.main_layout.addWidget(self.title_label_A)

        # Add a horizontal line as a divider
        divider_line = QtWidgets.QFrame()
        divider_line.setFrameShape(QtWidgets.QFrame.HLine)
        divider_line.setFrameShadow(QtWidgets.QFrame.Sunken)
        self.main_layout.addWidget(divider_line)


        self.btn_layout_A = QtWidgets.QHBoxLayout()
        self.main_layout.addLayout(self.btn_layout_A)

        self.rbtnA = QtWidgets.QRadioButton('Save to Default Folder')
        self.rbtnA.setChecked(True)
        self.rbtnB = QtWidgets.QRadioButton('Save to Specified Folder')

        self.btn_layout_A.addWidget(self.rbtnA)
        self.btn_layout_A.addWidget(self.rbtnB)

        # Create a horizontal layout for the folder path line edit and Set Path button
        self.path_layout = QtWidgets.QHBoxLayout()

        # Animation Folder UI components
        self.save_name_field = QtWidgets.QLineEdit()
        self.save_name_field.setPlaceholderText("Select folder where you want to export your file to") 
        self.path_layout.addWidget(self.save_name_field)        

        # Set Folder button
        self.btn_set_path = QtWidgets.QPushButton("Set Path")
        self.btn_set_path.clicked.connect(self.btn_set_path_clicked)
        self.path_layout.addWidget(self.btn_set_path)

        self.main_layout.addLayout(self.path_layout)
        # Call create_comboboxA() to create the combo box
        self.create_comboboxA()

        # UI content
        self.export_char_anim_btn()


        # Add a horizontal line as a divider
        divider_line = QtWidgets.QFrame()
        divider_line.setFrameShape(QtWidgets.QFrame.HLine)
        divider_line.setFrameShadow(QtWidgets.QFrame.Sunken)
        self.main_layout.addWidget(divider_line)

        # Add a QLabel for the title text
        self.title_label_B = QtWidgets.QLabel("Creature Export")
        self.title_label_B.setAlignment(QtCore.Qt.AlignHCenter)
        self.title_font_B = self.title_label_B.font()
        self.title_font_B.setBold(True)
        self.title_font_B.setPointSize(12)
        self.title_label_B.setFont(self.title_font_B)
        self.main_layout.addWidget(self.title_label_B)

        # Add a horizontal divider
        divider_line = QtWidgets.QFrame()
        divider_line.setFrameShape(QtWidgets.QFrame.HLine)
        divider_line.setFrameShadow(QtWidgets.QFrame.Sunken)
        self.main_layout.addWidget(divider_line)

        self.export_creature_rig_btn()
        self.export_creature_anim_btn()


        # Animation Folder UI components
        self.name_label = QtWidgets.QLabel('Animation Folder:')
        self.main_layout.addWidget(self.name_label)

        self.btn_layout_B = QtWidgets.QHBoxLayout()
        self.main_layout.addLayout(self.btn_layout_B)


        self.batch_path_name_field = QtWidgets.QLineEdit()
        self.batch_path_name_field.setPlaceholderText("Select folder with maya files for batch export") 
        self.btn_layout_B.addWidget(self.batch_path_name_field)
        # Set Folder button
        self.batch_btn_set_path = QtWidgets.QPushButton("Set Path")
        self.batch_btn_set_path.clicked.connect(self.batch_btn_set_path_clicked)
        self.btn_layout_B.addWidget(self.batch_btn_set_path)

        self.batch_export_creature_anim_btn()

    def createDirectory(self, directory=DIRECTORY):
        """
        Creates a given Directory if it doesn't exist
        Args:
            directory(str):The directory to create
        Returns:
            str: The path of the created directory
        """
        if not os.path.exists(directory):
            os.mkdir(directory)
        return directory

    def update_file_name(self):
        global newFileName
        filePathName = cmds.file(query=True, sceneName=True)
        fileName = filePathName.split('/')[-1]
        newFileName = fileName.split('.')[0]

    def btn_set_path_clicked(self):
        # Open file dialog to set the animation folder path
        self.folder_path = cmds.fileDialog2(dialogStyle=2, fileMode=3)
        if self.folder_path is not None:  # Check if self.folder_path is not None
            self.save_name_field.setText(self.folder_path[0])
            print("Folder path set to:", self.folder_path[0])
        else:
            print("No folder selected.")
        return None

    def create_comboboxA(self):
        self.combobox_race = QtWidgets.QComboBox()
        self.combobox_race.addItem("Human")
        self.combobox_race.addItem("SpaceMarine")

        self.combobox_race.setCurrentIndex(0)  # Set the default selection
        self.main_layout.addWidget(self.combobox_race)

    def export_char_anim_btn(self):
        '''
        In this function we create button that will bake animation on Human | Eldar| SpaceMarine characters.
        '''
        # Buttons
        self.btn_bake_ch_anim = QtWidgets.QPushButton("Export Character Animation")
        self.btn_bake_ch_anim.clicked.connect(self.runProcess)
        self.btn_bake_ch_anim.setToolTip("Click to export character animation")
        self.main_layout.addWidget(self.btn_bake_ch_anim)

    def export_creature_anim_btn(self):
        '''
        In this function we create button that will bake animation on Creatures.
        '''
        # Buttons
        self.btn_bake_creature_anim = QtWidgets.QPushButton("Export Creature Animation")
        self.btn_bake_creature_anim.clicked.connect(self.creature_export_process)
        self.btn_bake_creature_anim.setToolTip("Click to export creature animation")
        self.main_layout.addWidget(self.btn_bake_creature_anim)

    def batch_export_creature_anim_btn(self):
        '''
        In this function we create button that will bake animation on Creatures.
        '''
        # Buttons
        self.btn_batch_bake_creature_anim = QtWidgets.QPushButton("Batch Creature Animation Export")
        self.btn_batch_bake_creature_anim.clicked.connect(self.batch_creature_export_process)
        self.btn_batch_bake_creature_anim.setToolTip("Click to export creature animation")
        self.main_layout.addWidget(self.btn_batch_bake_creature_anim)

    def export_creature_rig_btn(self):
        '''
        In this function we create button that will export creature RIG (skeleton with all meshes that are skinned to it) as FBX file into work folder.
        '''

        self.btn_export_creature_rig = QtWidgets.QPushButton("Export RIG as FBX")
        self.btn_export_creature_rig.clicked.connect(self.creature_rig_export_process)
        self.btn_export_creature_rig.setToolTip("Click to export creature RIG file as FBX into your work folder")
        self.main_layout.addWidget(self.btn_export_creature_rig)

    def imprtRef(self):
        '''
        This function imports all referenced instances into the scene.
        '''
        
        all_ref_paths = cmds.file(q=True, reference=True) or []
        for ref_path in all_ref_paths:
            if cmds.referenceQuery(ref_path, isLoaded=True):
                cmds.file(ref_path, importReference=True)

                new_ref_paths = cmds.file(q=True, reference=True)
                if new_ref_paths:
                    for new_ref_path in new_ref_paths:
                        if new_ref_path not in all_ref_paths:
                            all_ref_paths.append(new_ref_path)

        print('Imported from reference all elements.')

    def remove_namespaces(self):
        '''
        This function removes namespaces from all imported instances in the scene.
        '''
        all_namespaces = [x for x in cmds.namespaceInfo(listOnlyNamespaces=True, recurse=True) if
                        x != "UI" and x != "shared"]
        if all_namespaces:
            all_namespaces.sort(key=len, reverse=True)
            for namespace in all_namespaces:
                if cmds.namespace(exists=namespace) is True:
                    cmds.namespace(removeNamespace=namespace, mergeNamespaceWithRoot=True)
        print("Namespaces removed successfully!")

    def cleanUp(self):
        '''
        This function cleans up the animation from unwanted channels in certain bones. Then deletes original Rig "Group" node.
        '''
        no_key_list = ["L_front_w____scale_05", "L_front_weapon_slot_05", "L_front_weapon_slot_05_ADJ","L_front_w____scale_04", 
                "L_front_weapon_slot_04", "L_front_weapon_slot_04_ADJ", "R_front_w____scale_02", "R_front_weapon_slot_02", 
                "R_front_weapon_slot_02_ADJ", "C_back_w_____slot_11", "C_back_weapon_slot_11", "C_back_weapon_slot_11_ADJ", 
                "R_front_w____scale_01", "R_front_weapon_slot_01", "R_front_weapon_slot_01_ADJ", "C_front_w____scale_03", 
                "C_front_weapon_slot_03", "C_front_weapon_slot_03_ADJ", "R_back_w_____slot_06", "R_back_weapon_slot_06", 
                "R_back_weapon_slot_06_ADJ", "R_back_w_____slot_09", "R_back_weapon_slot_09", "R_back_weapon_slot_09_ADJ", 
                "C_back_w_____slot_08", "C_back_weapon_slot_08", "C_back_weapon_slot_08_ADJ", "L_back_w_____slot_07", 
                "L_back_weapon_slot_07", "L_back_weapon_slot_07_ADJ", "L_back_w_____slot_10", "L_back_weapon_slot_10", 
                "L_back_weapon_slot_10_ADJ"]
        
        for i in no_key_list:
            if cmds.objExists(i):
                cmds.select(i)
                cmds.cutKey()
            else:
                pass

        if cmds.objExists('Group'):
            cmds.delete('Group')
        else:
            pass

        selected_option = self.combobox_race.currentText()

        if selected_option == "Human":
            print("Clean up for for Humans and Eldar")
            list = ['Spine_1', 'Spine_2', 'Spine_3', 'Neck', 'Head_ADJ', 'Head_Helmet_ADJ', 'Head_helmet_ADJ',
            'Skull_Scale', 'Face_Scale',  'R_eyelish_top', 'R_eyelish_top_end',
            'L_eyelish_top', 'L_eyelish_top_end', 'R_eyelish_bottom', 'R_eyelish_bottom_end', 'L_eyelish_bottom',
            'L_eyelish_bottom_end', 'R_eye', 'R_eye_end', 'L_eye', 'L_eye_end', 'Jaw_Scale', 'Neck_ADJ', 'L_Clavicle',
            'L_Up_arm', 'L_ForeArm', 'L_Hand', 'L_Toe_1_01', 'L_Toe_1_02', 'L_Toe_1_02_ADJ', 'L_Toe_1_01_ADJ',
            'L_Toe_2_01', 'L_Toe_2_02', 'L_Toe_2_02_ADJ', 'L_Toe_2_01_ADJ', 'L_Toe_3_01', 'L_Toe_3_02',
            'L_Toe_3_02_ADJ', 'L_Toe_3_01_ADJ', 'L_Hand_ADJ', 'L_ForeArm_ADJ', 'L_ForeArm_Twist_ADJ',
            'L_Up_Arm_Muscl_ADJ', 'L_Up_arm_ADJ', 'L_Clavicle_ADJ', 'L_Neck_Muscl', 'L_Neck_Muscl_ADJ', 'R_Neck_Muscl',
            'R_Neck_Muscl_ADJ', 'Spine_3_ADJ', 'L_back_w_____slot_10', 'L_back_weapon_slot_10',
            'L_back_weapon_slot_10_ADJ', 'L_back_w_____slot_07', 'L_back_weapon_slot_07', 'L_back_weapon_slot_07_ADJ',
            'C_back_w_____slot_08', 'C_back_weapon_slot_08', 'C_back_weapon_slot_08_ADJ', 'R_back_w_____slot_09',
            'R_back_weapon_slot_09', 'R_back_weapon_slot_09_ADJ', 'R_back_w_____slot_06', 'R_back_weapon_slot_06',
            'R_back_weapon_slot_06_ADJ', 'R_Clavicle', 'R_Up_arm', 'R_ForeArm', 'R_Hand', 'R_Toe_1_01', 'R_Toe_1_02',
            'R_Toe_1_02_ADJ', 'R_Toe_1_01_ADJ', 'R_Toe_2_01', 'R_Toe_2_02', 'R_Toe_2_02_ADJ', 'R_Toe_2_01_ADJ',
            'R_Toe_3_01', 'R_Toe_3_02', 'R_Toe_3_02_ADJ', 'R_Toe_3_01_ADJ', 'R_Hand_ADJ',
            'R_ForeArm_ADJ', 'R_ForeArm_Twist_ADJ', 'R_Up_Arm_Muscl_ADJ', 'R_Up_arm_ADJ', 'R_Clavicle_ADJ',
            'Spine_2_ADJ', 'C_back_w_____slot_11', 'C_back_weapon_slot_11', 'C_back_weapon_slot_11_ADJ', 'Stomach',
            'Stomach_ADJ', 'Spine_1_ADJ', 'R_leg', 'R_foot', 'R_toe',  'L_leg', 'L_foot', 'L_toe', 'L_Up_leg', 'R_Pre_Up_Leg']

            for i in list:
                if cmds.objExists(i):
                    cmds.select(i)
                    cmds.cutKey(at='translate')
                else:
                    print(i + 'is not in the scene. Skipping...')

        elif selected_option == "SpaceMarine":
            print("Clean up for Spacemarine")

            list = ['Spine_1', 'Spine_2', 'Spine_3', 'Neck', 'Head_ADJ', 'Head_Helmet_ADJ', 'Head_helmet_ADJ',
            'Skull_Scale', 'Face_Scale', 'R_eyelish_top', 'R_eyelish_top_end',
            'L_eyelish_top', 'L_eyelish_top_end', 'R_eyelish_bottom', 'R_eyelish_bottom_end', 'L_eyelish_bottom',
            'L_eyelish_bottom_end', 'R_eye', 'R_eye_end', 'L_eye', 'L_eye_end', 'Jaw_Scale', 'Neck_ADJ', 'L_Clavicle',
            'L_Up_arm', 'L_ForeArm', 'L_Hand', 'L_Toe_1_01', 'L_Toe_1_02', 'L_Toe_1_02_ADJ', 'L_Toe_1_01_ADJ',
            'L_Toe_2_01', 'L_Toe_2_02', 'L_Toe_2_02_ADJ', 'L_Toe_2_01_ADJ', 'L_Toe_3_01', 'L_Toe_3_02',
            'L_Toe_3_02_ADJ', 'L_Toe_3_01_ADJ', 'L_Hand_ADJ', 'L_ForeArm_ADJ', 'L_ForeArm_Twist_ADJ',
            'L_Up_Arm_Muscl_ADJ', 'L_Up_arm_ADJ', 'L_Clavicle_ADJ', 'L_Neck_Muscl', 'L_Neck_Muscl_ADJ', 'R_Neck_Muscl',
            'R_Neck_Muscl_ADJ', 'Spine_3_ADJ', 'L_back_w_____slot_10', 'L_back_weapon_slot_10',
            'L_back_weapon_slot_10_ADJ', 'L_back_w_____slot_07', 'L_back_weapon_slot_07', 'L_back_weapon_slot_07_ADJ',
            'C_back_w_____slot_08', 'C_back_weapon_slot_08', 'C_back_weapon_slot_08_ADJ', 'R_back_w_____slot_09',
            'R_back_weapon_slot_09', 'R_back_weapon_slot_09_ADJ', 'R_back_w_____slot_06', 'R_back_weapon_slot_06',
            'R_back_weapon_slot_06_ADJ', 'R_Clavicle', 'R_Up_arm', 'R_ForeArm', 'R_Hand', 'R_Toe_1_01', 'R_Toe_1_02',
            'R_Toe_1_02_ADJ', 'R_Toe_1_01_ADJ', 'R_Toe_2_01', 'R_Toe_2_02', 'R_Toe_2_02_ADJ', 'R_Toe_2_01_ADJ',
            'R_Toe_3_01', 'R_Toe_3_02', 'R_Toe_3_02_ADJ', 'R_Toe_3_01_ADJ', 'R_Hand_ADJ',
            'R_ForeArm_ADJ', 'R_ForeArm_Twist_ADJ', 'R_Up_Arm_Muscl_ADJ', 'R_Up_arm_ADJ', 'R_Clavicle_ADJ',
            'Spine_2_ADJ', 'C_back_w_____slot_11', 'C_back_weapon_slot_11', 'C_back_weapon_slot_11_ADJ', 'Stomach',
            'Stomach_ADJ', 'Spine_1_ADJ']

            for i in list:
                if cmds.objExists(i):
                    cmds.select(i)
                    cmds.cutKey(at='translate')
                else:
                    print(i + 'is not in the scene. Skipping...')

        print("Skeleton clean up is complete")

    def ch_fbx_export(self):
        '''
        This function for export of Human| Eldar| SpaceMarine characters as FBX file into a designated location in UI.
        '''

        # Unload the fbxmaya plugin before reloading it
        cmds.unloadPlugin("fbxmaya", force=True)
        cmds.loadPlugin("fbxmaya")


        # Load the export preset file
        cmds.loadPlugin("fbxmaya")
        mel.FBXLoadExportPresetFile(f=presetPathName)

    
        # Get the folder path from the save_name_field
        self.folder_path = self.save_name_field.text()

        
        # Call update_file_name to ensure newFileName is updated
        self.update_file_name()

        sel = cmds.listRelatives('Pelvis', c=True, ad=True)

        for obj in sel:
            shortName = obj.split("|")[-1]

            children = cmds.listRelatives(obj, c=True, f=True) or []
            if len(children) == 1:
                child = children[0]
                objType = cmds.objectType(child)
            else:
                objType = cmds.objectType(obj)

            if objType == "mesh":
                cmds.delete(obj)
            if objType == "locator":
                cmds.delete(obj)
            if objType == "parentConstraint":
                cmds.delete(obj)
            if objType == "orientConstraint":
                cmds.delete(obj)
            else:
                pass

        if cmds.objExists('Group'):
            cmds.delete('Group')
        else:
            pass

        cmds.select('ParentForExportDelete')
        cmds.listRelatives('ParentForExportDelete', c=True, ad=True)

    
        # Get the text entered in the save_name_field
        self.folder_path = self.save_name_field.text()

        # Check if the self.folder_path is empty
        if self.rbtnA.isChecked():
            print("Folder path is not set. Creating a default folder.")
            self.folder_path = self.createDirectory(DummyFolder)
            nameExport = self.folder_path + '/' + newFileName + '.fbx'
            mel.FBXExport(s=True, f=nameExport, force=True, options=True)
            print("FBX file exported to: {}".format(nameExport))
            return

        
        elif self.rbtnB.isChecked():
            nameExport = self.folder_path + '/' + newFileName + '.fbx'
            mel.FBXExport(s=True, f=nameExport, force=True, options=True)
            print("FBX file exported to: {}".format(nameExport))
            return

    def showExportLocationDialog(self):
        '''
        Shows a dialog box with the location of the exported FBX file.
        '''
        exportLocation = os.path.join(self.folder_path, newFileName + '.fbx')
        
        messageBox = QtWidgets.QMessageBox()
        messageBox.setWindowTitle("Export Complete")
        messageBox.setText("The FBX file has been successfully exported to:\n{}".format(exportLocation))
        messageBox.setIcon(QtWidgets.QMessageBox.Information)
        messageBox.exec_()

    def runProcess(self):
        '''
        This function runs above functions and initiates the export process for Human| Eldar| SpaceMarine characters.
        '''
        self.imprtRef()
        
        self.remove_namespaces()

        print('Starting Baking animation to joints process.')
        selected_option = self.combobox_race.currentText()

        if selected_option == "Human":
            print("Importing list of joints for Humans and Eldar")
            json_jnt_list = os.path.join(PRESET_DIRECTORY, 'bake_transl_jnts_list_human.json')

        elif selected_option == "SpaceMarine":
            print("Importing list of joints for Spacemarine")
            json_jnt_list = os.path.join(PRESET_DIRECTORY, 'bake_transl_jnts_list_spacemarine.json')

        jnts = []
        cons = []        

        with open(json_jnt_list, 'r') as json_file:
            bake_transl_jnts = json.load(json_file)


        # Ensure nothing is selected initially
        cmds.select(clear=True)

        # Select 'Pelvis' and its hierarchy
        cmds.select('Pelvis', hi=True)

        # Get the selected objects

        cmds.select('Pelvis', hi=True)
        allSelected = cmds.ls(sl=True)


        startTime = cmds.playbackOptions(query=True, minTime=True)
        endTime = cmds.playbackOptions(query=True, maxTime=True)

        cmds.bakeResults(allSelected, simulation=True, t=(startTime, endTime), at='translate')
        cmds.bakeResults(allSelected, simulation=True, t=(startTime, endTime), at='rotate')

        print('Baking animation to joints is complete.')
        print('Starting CleanUp process.')
        if cons:
            for constraint in cons:
                if cmds.objExists(constraint):
                    cmds.delete(constraint)
                else:
                    pass

        cmds.spaceLocator(name='ParentForExportDelete')
        cmds.parent('UMA_Male_Rig', 'ParentForExportDelete')
        locs = ['ParentForExportDelete', 'UMA_Male_Rig', 'Global', 'Position']

        for l in locs:
            cmds.cutKey(l)
        
        cmds.setAttr('ParentForExportDelete.rotateX', 0)
        cmds.setAttr('ParentForExportDelete.rotateY', 0)
        cmds.setAttr('ParentForExportDelete.rotateZ', 0)

        cmds.setAttr('UMA_Male_Rig.rotateX', -90)
        cmds.setAttr('UMA_Male_Rig.rotateY', 0)
        cmds.setAttr('UMA_Male_Rig.rotateZ', 0)

        cmds.setAttr('Global.rotateX', 90)
        cmds.setAttr('Global.rotateY', -90)
        cmds.setAttr('Global.rotateZ', 0)

        cmds.setAttr('Position.rotateX', 0)
        cmds.setAttr('Position.rotateY', 0)
        cmds.setAttr('Position.rotateZ', 0)
        
        if cmds.objExists('Group'):
            cmds.delete('Group')
        else:
            pass

        self.cleanUp()
        self.ch_fbx_export()
        # After exporting the FBX file, show the dialog with the export location
        self.showExportLocationDialog()

            
    # CREATURE EXPORT part of the scrript

    def bakeProcess(self):
        '''
        This function desribes the process of baking animation for creatures.
        '''
        defSet = 'DeformSet'
        set = cmds.sets(defSet, q=True)

        cmds.select(set, hi=True)

        allSelected = cmds.ls(sl=True)

        startTime = cmds.playbackOptions(query=True, minTime=True)
        endTime = cmds.playbackOptions(query=True, maxTime=True)

        cmds.bakeResults(allSelected, simulation=True, t=(startTime, endTime))
        if cmds.objExists('Position') == 1:
            cmds.parent('Position', world=True)
        if cmds.objExists('Position') == 0:
            cmds.select(cl=True)
            cmds.joint(n='Position')
            cmds.parent('Root_M','Position')
        cmds.showHidden(above=True)


    def creature_anim_export(self):
        '''
        This function for export of Creatures as FBX file into a designated location in UI.
        '''
        cmds.loadPlugin("fbxmaya")
        mel.FBXLoadExportPresetFile(f=presetPathName)

        cmds.select('Position')
        sel = cmds.listRelatives('Position', c=True, ad=True)

        # Get the folder path from the save_name_field
        self.folder_path = self.save_name_field.text()

        # Call update_file_name to ensure newFileName is updated
        self.update_file_name()

        for obj in sel:
            shortName = obj.split("|")[-1]

            children = cmds.listRelatives(obj, c=True, f=True) or []
            if len(children) == 1:
                child = children[0]
                objType = cmds.objectType(child)
            else:
                objType = cmds.objectType(obj)

            if objType == "mesh":
                cmds.delete(obj)
            if objType == "locator":
                cmds.delete(obj)
            if objType == "parentConstraint":
                cmds.delete(obj)
            else:
                pass

        if cmds.objExists('Group'):
            cmds.delete('Group')
        else:
            pass
        cmds.select('Position', hierarchy=True)

        if self.rbtnA.isChecked():
            print("Folder path is not set. Creating a default folder.")
            self.folder_path = self.createDirectory(DummyFolder)
            nameExport = self.folder_path + '/' + newFileName + '.fbx'
            print("Exporting FBX to:", nameExport)  # Add this line to verify the file path
            mel.FBXExport(s=True, f=nameExport, force=True, options=True)
            return

        elif self.rbtnB.isChecked():
            nameExport = self.folder_path + '/' + newFileName + '.fbx'
            mel.FBXExport(s=True, f=nameExport, force=True, options=True)
            print("FBX file exported to: {}".format(nameExport))
            return
        
        print("FBX file exported to: {}".format(nameExport))
        return

    
    def creature_export_process(self):
        self.imprtRef()
        self.remove_namespaces()
        self.bakeProcess()
        self.creature_anim_export()
        self.showExportLocationDialog()
        return
    

    def show_error_dialog(self):
        '''
        Shows a dialog box with error and way to solve it.
        '''
        
        messageBoxError = QtWidgets.QMessageBox()
        messageBoxError.setWindowTitle("RIG Export ERROR")
        messageBoxError.setText("This RIG doesn't contain Position joint. Either create it manually or rename existing joint at the origin to Position and then continue.")
        messageBoxError.setIcon(QtWidgets.QMessageBox.Information)
        messageBoxError.exec_()

    def disconnectAll(self, node, source=True, destination=True):
        connectionPairs = []
        if source:
            conns = cmds.listConnections(node, plugs=True, connections=True, destination=False)
            if conns:
                connectionPairs.extend(zip(conns[1::2], conns[::2]))
        
        if destination:
            conns = cmds.listConnections(node, plugs=True, connections=True, source=False)
            if conns:
                connectionPairs.extend(zip(conns[::2], conns[1::2]))
        
        for srcAttr, destAttr in connectionPairs:
            cmds.disconnectAttr(srcAttr, destAttr)

    def creature_rig_export_checker(self):
        
        if cmds.objExists(self.position):
            self.position = 'Position'
        else:
            if cmds.objExists(self.root):
                position = cmds.jnt(n='Position')
                cmds.parent(self.root, self.position)
            else:
                self.show_error_dialog()
           
    def creature_rig_scene_cleanup(self):
        self.creature_rig_export_checker()
            
        if cmds.objExists('ConstraintSystem'):
            cmds.delete('ConstraintSystem')
        else:
            pass
		
        blendC = cmds.ls(type='blendColors')	
        if blendC:
            print('BlindDataTemplate nodes found. Deleting...')
            cmds.delete(blendC)


        # Get a list of selected objects
        selected_objects = cmds.ls('Position', dag=True)

        for obj in selected_objects:
            # Check if there is a connection to the visibility attribute
            visibility_connections = cmds.listConnections(obj + '.visibility', source=True, destination=False)
            if visibility_connections:
                # Check if 'Main.jointVis' is among the connections
                if 'Main.jointVis' in visibility_connections:
                    # Disconnect 'Main.jointVis' from the visibility attribute
                    cmds.disconnectAttr('Main.jointVis', obj + '.visibility')
                    print("Disconnected 'Main.jointVis' from", obj + ".visibility")
                else:
                    print("No connection to 'Main.jointVis' found for", obj + ".visibility")
            else:
                print("No connections found for", obj + ".visibility")

        # Iterate over each selected object
        for obj in selected_objects:
            attr_names = ['sx', 'sy', 'sz']
            for at in attr_names:
                scale_attribute = obj + "." + at
                print(scale_attribute)
                
                # List connections for the scale attribute
                connections = cmds.listConnections(scale_attribute, d=False, s=True)
                if connections:
                    for connection in connections:
                        # Disconnect each connection
                        cmds.disconnectAttr(connection + '.' + at, scale_attribute)
                else:
                    print("No connections found for", scale_attribute)
                
                if cmds.listRelatives(self.position, parent=True):
                    cmds.parent(self.position, world=True)
                else:
                    print("Object, '{}', is already a child of the parent, 'world'.".format(self.position))

                if cmds.objExists('Group'):    
                    cmds.delete('Group')
                else:
                    print("Group node doesn't exist. If RIG group exists name it Group and run this script again.")

    def creature_rig_export(self):
            '''
            This function for export of Creatures as FBX file into a designated location in UI.
            '''
            cmds.loadPlugin("fbxmaya")
            mel.FBXLoadExportPresetFile(f=presetPathName)

            # Check if any display layers exist and delete them
            display_layers = cmds.ls(type='displayLayer')
            if display_layers:
                cmds.delete(display_layers)


            all_objects = cmds.ls()

            # Create an empty list to store polygon objects
            polygon_objects = []

            # Iterate through all objects and check if they are polygons
            for obj in all_objects:
                if cmds.objectType(obj) == 'transform':
                    # Check if the object has polygon data
                    shapes = cmds.listRelatives(obj, shapes=True)
                    if shapes:
                        for shape in shapes:
                            if cmds.nodeType(shape) == 'mesh':
                                polygon_objects.append(obj)
                                break

            # Select all polygon objects
            cmds.select(polygon_objects, replace=True)
            cmds.select(self.position, hi=True, add=True)


            # Get the folder path from the save_name_field
            self.folder_path = self.save_name_field.text()

            # Call update_file_name to ensure newFileName is updated
            self.update_file_name()


            if cmds.objExists('Group'):
                cmds.delete('Group')
            else:
                pass
 

            if self.rbtnA.isChecked():
                print("Folder path is not set. Creating a default folder.")
                self.folder_path = self.createDirectory(DummyFolder)
                nameExport = self.folder_path + '/' + newFileName + '.fbx'
                print("Exporting FBX to:", nameExport)  # Add this line to verify the file path
                mel.FBXExport(s=True, f=nameExport, force=True, options=True)
                return

            elif self.rbtnB.isChecked():
                nameExport = self.folder_path + '/' + newFileName + '.fbx'
                mel.FBXExport(s=True, f=nameExport, force=True, options=True)
                print("FBX file exported to: {}".format(nameExport))
                return
            
            print("FBX file exported to: {}".format(nameExport))
            return

    def creature_rig_export_process(self):
        self.creature_rig_scene_cleanup()
        self.creature_rig_export()


    def new_scene_maya(self):
        # Create a new Maya scene
        cmds.file(new=True, force=True)

    def batch_btn_set_path_clicked(self):
        # Open file dialog to set the animation folder path
        anim_folder_path = cmds.fileDialog2(dialogStyle=2, fileMode=3)
        if anim_folder_path:
            selected_folder_path = anim_folder_path[0]
            self.batch_path_name_field.setText(selected_folder_path)
            self.anim_folder_path = selected_folder_path  # Set the attribute here
            self.folder_path = selected_folder_path  # Update folder_path here
            return selected_folder_path


    def batch_creature_export_process(self):
        # Get the folder path from the UI
        if not self.folder_path:
            print("Folder path is not set. Creating a default folder.")
            self.folder_path = self.createDirectory(DummyFolder)

        # Get a list of creatures or rigs to export
        path = self.anim_folder_path
        files = [os.path.join(path, f) for f in os.listdir(path) if f.lower().endswith(".ma")]

        for creature in files:
            # Open or create a new scene in Maya
            self.new_scene_maya()

            # Import the creature or rig
            cmds.file(creature, i=True)

            # Remove namespaces
            self.remove_namespaces()

            # Run the export process for the creature or rig
            self.creature_rig_export_process()

            # Construct the export file name
            export_file_name = creature + '.fbx'
            export_file_path = os.path.join(self.folder_path, export_file_name)

            # Export the creature or rig as FBX
            mel.FBXExport(s=True, f=export_file_path, force=True, options=True)

            print("Exported {} to {}".format(creature, export_file_path))

        print("Batch export completed.")





# Call the function to run the process

def clean_ui():
    if cmds.window("AnimationTransferID", exists=True):
        cmds.deleteUI("AnimationTransferID", window=True)

    if cmds.windowPref("AnimationTransferID", exists=True):
        cmds.windowPref("AnimationTransferID", remove=True)


clean_ui()
win = ch_anim_export()
win.show()





