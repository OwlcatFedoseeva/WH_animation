from maya import cmds
from PySide2 import QtCore, QtGui, QtWidgets
import os
import json
from pymel.core import mel
import logging

log_dir = os.path.dirname(__file__)
log_file = os.path.join(log_dir, "logs", "exporter.log")


logger = logging.getLogger("ExportLogs")
logger.setLevel(logging.DEBUG)

#clean handler from old data
for hnd in logger.handlers:
    print("Removing {} handler".format(hnd))
    logger.removeHandler(hnd)

file_handler = logging.FileHandler(log_file, mode=w)
file_handler_format = logging.Formatter('[%(module)s.%(funcName)s.%(lineno)d]%(levelname)s:%(message)s')
file_handler.setFormatter(file_handler_format)

logger.addHandler(file_handler)

USERAPPDIR = cmds.internalVar(userAppDir=True)
PRESET_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'WH_CHanimExport')
presetPathName = PRESET_DIRECTORY + "/UMA_Male_Rig_AnimationExport.fbxexportpreset"
newFileName = None
filePathName = cmds.file(query=True, sceneName=True)
DIRECTORY = os.path.dirname(filePathName)


class ch_anim_export(QtWidgets.QDialog):
    
    def __init__(self):
        super(ch_anim_export, self).__init__()
        self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        self.setup_ui()
        self.toDel = None

    def setup_ui(self):
        self.setWindowTitle("Character Animation Export 2.0")
        self.setObjectName("CHAnimExportID")
        self.setMinimumSize(400, 200)
        self.setMaximumSize(800, 40)
        self.resize(400, 200)
        
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

        self.export_creature_anim_btn()

    def update_file_name(self):
        global newFileName
        filePathName = cmds.file(query=True, sceneName=True)
        fileName = filePathName.split('/')[-1]
        newFileName = fileName.split('.')[0]

    def btn_set_path_clicked(self):
        # Open file dialog to set the animation folder path
        folder_path = cmds.fileDialog2(dialogStyle=2, fileMode=3)
        if folder_path:
            self.save_name_field.setText(folder_path[0])
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
        folder_path = self.save_name_field.text()

        if not folder_path:
            cmds.warning("Please select an animation folder.")
            return
        
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

        nameExport = folder_path + '/' + newFileName + '.fbx'
        mel.FBXExport(s=True, f=nameExport, force=True, options=True)
        print("FBX file exported to: {}".format(nameExport))

    def runProcess(self):
        '''
        This function runs above functions and initiates the export process for Human| Eldar| SpaceMarine characters.
        '''
        self.imprtRef()
        self.remove_namespaces()


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
        selected_objects = cmds.ls(selection=True)

        for obj in selected_objects:
            if cmds.nodeType(obj) == 'joint':
                jnts.append(obj)
            elif cmds.nodeType(obj) in ['parentConstraint', 'orientConstraint']:
                cons.append(obj)


        if jnts:
            cmds.bakeResults(jnts, simulation=True, t=(cmds.playbackOptions(q=True, minTime=True), cmds.playbackOptions(q=True, maxTime=True)), sampleBy=1, at=["rotate"])

        if bake_transl_jnts:
            cmds.bakeResults(bake_transl_jnts, simulation=True, t=(cmds.playbackOptions(q=True, minTime=True), cmds.playbackOptions(q=True, maxTime=True)), sampleBy=1, at=["translate"])

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

        
        logger.debug("Error has occured")
        file_handler.close()
        logger.removeHandler(file_handler)


    
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
        folder_path = self.save_name_field.text()

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

        nameExport = folder_path + '/' + newFileName + '.fbx'
        mel.FBXExport(s=True, f=nameExport, force=True, options=True)

        print("FBX file exported to: {}".format(nameExport))
        return
    
    def creature_export_process(self):
        self.imprtRef()
        self.remove_namespaces()
        self.bakeProcess()
        self.creature_anim_export()
        return

def clean_ui():
    if cmds.window("AnimationTransferID", exists=True):
        cmds.deleteUI("AnimationTransferID", window=True)

    if cmds.windowPref("AnimationTransferID", exists=True):
        cmds.windowPref("AnimationTransferID", remove=True)


clean_ui()
win = ch_anim_export()
win.show()





