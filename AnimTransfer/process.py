import maya.cmds as cmds
from PySide2 import QtCore, QtGui, QtWidgets
import os
import json

USERAPPDIR = cmds.internalVar(userAppDir=True)
DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'AnimTransfer')

class anim_transfer(QtWidgets.QDialog):
    
    def __init__(self):
        super(anim_transfer, self).__init__()
        self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        self.setup_ui()
        self.toDel = None

    def setup_ui(self):
        self.setWindowTitle("Animation Transfer")
        self.setObjectName("AnimationTransferID")
        self.setMinimumSize(400, 100)
        self.setMaximumSize(800, 200)
        self.resize(400, 100)
        
        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(3, 3, 3, 3)
        self.main_layout.setSpacing(5)
        self.setLayout(self.main_layout)

        self.btn_layout_A = QtWidgets.QHBoxLayout()
        self.main_layout.addLayout(self.btn_layout_A)

        self.radio_btn_layoutA = QtWidgets.QHBoxLayout()
        self.main_layout.addLayout(self.radio_btn_layoutA)

        self.radio_btn_layoutB = QtWidgets.QHBoxLayout()
        self.main_layout.addLayout(self.radio_btn_layoutB)     

        self.btn_layout_B = QtWidgets.QHBoxLayout()
        self.main_layout.addLayout(self.btn_layout_B)

        # UI content
        self.create_action_buttons()
        self.create_comboboxA()

    def create_comboboxA(self):
        self.combobox_race = QtWidgets.QComboBox()
        self.combobox_race.addItem("Human_Male")
        self.combobox_race.addItem("Human_Female")
        '''
        self.combobox_race.addItem("Eldar_Male")
        self.combobox_race.addItem("Eldar_Female")
        self.combobox_race.addItem("Spacemarine")
        '''

        self.combobox_race.setCurrentIndex(0)  # Set the default selection

        self.radio_btn_layoutA.addWidget(self.combobox_race)

    def create_action_buttons(self):
        '''
        In this function we create buttons that will operate the script.
        '''
        # Buttons
        self.btn_import_anim = QtWidgets.QPushButton("Import Animation")
        self.btn_import_anim.clicked.connect(self.open_anim)

        self.btn_import_rig = QtWidgets.QPushButton("Import Rig")
        self.btn_import_rig.clicked.connect(self.open_rig)

        self.btn_bake_anim = QtWidgets.QPushButton("Match Animation")
        self.btn_bake_anim.clicked.connect(self.match_process)

        self.btn_layout_A.addWidget(self.btn_import_anim)
        self.btn_layout_A.addWidget(self.btn_import_rig)
        self.btn_layout_B.addWidget(self.btn_bake_anim)

    def open_anim(self):
        '''
        In this function we specify which file we need to import.
        '''

        file_filter = "*.fbx"
        path = cmds.fileDialog2(fileFilter=file_filter, dialogStyle=2, fileMode=1)

        # Check if a file was selected
        if path and len(path) > 0:
            print(path[0])
            cmds.file(path, i=True)
            return path[0]
        else:
            return None

    def open_rig(self):
        '''
        In this function we specify which file we need to import.
        '''

        file_filter = "*.ma"
        path = cmds.fileDialog2(fileFilter=file_filter, dialogStyle=2, fileMode=1)

        # Check if a file was selected
        if path and len(path) > 0:
            print(path[0])
            cmds.file(path, i=True)
            return path[0]
        else:
            return None

    def import_ref_skeleton(self):
        selected_option = self.combobox_race.currentText()

        if selected_option == "Human_Male":
            print("Importing Human Male Ref Skeleton")
            cmds.file(os.path.join(DIRECTORY, 'reference_human_male_skeleton.ma'), i=True)

        elif selected_option == "Human_Female":
            print("Importing Human Female Ref Skeleton")
            cmds.file(os.path.join(DIRECTORY, 'reference_human_female_skeleton.ma'), i=True)

        self.toDel = cmds.createNode('transform', n='toDel_GP_{}'.format(cmds.ls(assemblies=True, long=True)[-1]))

    def match_to_ref_skel(self):
        selected_option = self.combobox_race.currentText()
        json_file_path_ref = os.path.join(USERAPPDIR, 'scripts', 'AnimTransfer', 'pins.json')
        if selected_option == "Human_Male":
            json_file_path_ctrl = os.path.join(USERAPPDIR, 'scripts', 'AnimTransfer', 'ctrlsList_Human.json')

        elif selected_option == "Human_Female":
            json_file_path_ctrl = os.path.join(USERAPPDIR, 'scripts', 'AnimTransfer', 'ctrlsList_Human.json')
    


        with open(json_file_path_ref, 'r') as json_file:
            ref = json.load(json_file)

        with open(json_file_path_ctrl, 'r') as json_file:
            ctrl = json.load(json_file)

        refSkel = []
        ctrlList = []
        pref = 'Reference_'
        toDel = None  

        for obj in ref:
            o = pref + obj
            refSkel.append(o)

        for c in ctrl:
            ctrlList.append(c)

        cmds.select(cl=True)
        
        if not cmds.objExists('toDel_GP'):
            toDel = cmds.createNode('transform', n='toDel_GP_{}'.format(cmds.ls(assemblies=True, long=True)[-1])) 
        else:
            pass

        for s, t in zip(refSkel, ctrlList):
            par = cmds.parentConstraint(s, t, mo=1)
            cmds.parent(par, self.toDel)

        #Skirt Match

        skirt_src_jnt = ['L_Sceart_____Front_00|L_Sceart_Front_01','L_Sceart_____Front_00|L_Sceart_Front_01|L_Sceart_Font_02 ','L_Sceart_____Back_00|L_Sceart_Back_01','L_Sceart_____Back_00|L_Sceart_Back_01|L_Sceart_Back_02','R_Sceart_____Front_00|R_Sceart_Front_01','R_Sceart_____Front_00|R_Sceart_Front_01|R_Sceart_Font_02','R_Sceart_____Back_00|R_Sceart_Back_01','R_Sceart_____Back_00|R_Sceart_Back_01|R_Sceart_Back_02']
        skirt_ctrls = ['L_Sceart_Front_01_CTRL','L_Sceart_Font_02_CTRL','L_Sceart_Back_01_CTRL','L_Sceart_Back_02_CTRL','R_Sceart_Front_01_CTRL','R_Sceart_Font_02_CTRL','R_Sceart_Back_01_CTRL','R_Sceart_Back_02_CTRL']
        
        for sj, sc in zip(skirt_src_jnt, skirt_ctrls):
            if cmds.objExists(sj) and cmds.objExists(sc):
                skirt_par = cmds.parentConstraint(sj, sc, mo=0)
                cmds.parent(skirt_par, self.toDel)

        #Weapon Match
        weaponJnt = ['Reference_L_WeaponBone', 'Reference_R_WeaponBone']
        weaponCtrl = ['L_Weapon_ctrl', 'R_Weapon_ctrl']

        for wj, wc in zip(weaponJnt, weaponCtrl):
            if cmds.objExists(wj) and cmds.objExists(wc):
                weapon_par = cmds.parentConstraint(wj, wc, mo=0)
                cmds.parent(weapon_par, toDel)
            else:
                pass


    def match_to_anim_skel(self):
        json_file_path = os.path.join(USERAPPDIR, 'scripts', 'AnimTransfer', 'pins.json')
        
        with open(json_file_path, 'r') as json_file:
            data = json.load(json_file)

        animSkel = []
        srcSkel = []
        
        toDel = None
        for name in data:
            matching_objects = cmds.ls(name)
            print("Name: {}, Matching Objects: {}".format(name, matching_objects))
            if matching_objects:
                animSkel.append(matching_objects[0])
            else:
                print("No matching objects found for {}".format(name))
        
        for name in data:
            matching_objects = cmds.ls(name)
            pref = 'Reference_'
            obj = pref + matching_objects[0]
            srcSkel.append(obj)
            
        print("animSkel:", animSkel)
        print("srcSkel:", srcSkel)

        cmds.select(cl=True)
        if not cmds.objExists('toDel_GP'):
            toDel = cmds.createNode('transform', n='toDel_GP')

        else:
            pass
        
        for s, t in zip(animSkel, srcSkel):
            par = cmds.parentConstraint(s, t, mo=0)
            cmds.parent(par, toDel)
        
        an_for_IK = ['Reference_L_foot', 'Reference_R_foot']
        ctrl_IK = ['IKLeg_L', 'IKLeg_R']
 

        for s, t in zip(an_for_IK, ctrl_IK):
            par = cmds.pointConstraint(s, t, mo=0)
            parOr = cmds.orientConstraint(s, t, mo=1)
            cmds.parent(par, parOr, toDel)
    
    def match_process(self):

        self.import_ref_skeleton()
        self.match_to_ref_skel()
        self.match_to_anim_skel()

        selected_option = self.combobox_race.currentText()
        json_file_path_ref = os.path.join(USERAPPDIR, 'scripts', 'AnimTransfer', 'pins.json')
        if selected_option == "Human_Male":
            json_file_path_ctrl = os.path.join(USERAPPDIR, 'scripts', 'AnimTransfer', 'ctrlsList_Human.json')

        elif selected_option == "Human_Female":
            json_file_path_ctrl = os.path.join(USERAPPDIR, 'scripts', 'AnimTransfer', 'ctrlsList_Human.json')
    
        elif selected_option == "Eldar_Male":
            json_file_path_ctrl = os.path.join(USERAPPDIR, 'scripts', 'AnimTransfer', 'ctrlsList_Eldar.json')

        elif selected_option == "Eldar_Female":
            json_file_path_ctrl = os.path.join(USERAPPDIR, 'scripts', 'AnimTransfer', 'ctrlsList_Eldar.json')   

        elif selected_option == "Spacemarine":
            json_file_path_ctrl = os.path.join(USERAPPDIR, 'scripts', 'AnimTransfer', 'ctrlsList_Spacemarine.json')


        with open(json_file_path_ctrl, 'r') as json_file:
            ctrl = json.load(json_file)

        sel = cmds.ls(ctrl, 'IKLeg_R', 'IKLeg_L', 'L_Sceart_Front_01_CTRL','L_Sceart_Font_02_CTRL','L_Sceart_Back_01_CTRL','L_Sceart_Back_02_CTRL','R_Sceart_Front_01_CTRL','R_Sceart_Font_02_CTRL','R_Sceart_Back_01_CTRL','R_Sceart_Back_02_CTRL')

        startTime = cmds.playbackOptions(query=True, minTime=True)
        endTime = cmds.playbackOptions(query=True, maxTime=True)
        cmds.bakeResults(sel, simulation=True, t=(startTime, endTime))
        

        toDel_objects = cmds.ls("*toDel_*", type="transform")
        if toDel_objects:
            cmds.delete(toDel_objects)
            print("Deleted {} objects with 'toDel_' in their name.".format(len(toDel_objects)))
        else:
            print("No objects with 'toDel_' in their name found.")


        if cmds.objExists('Reference_UMA_Male_Rig'):
            cmds.delete('Reference_UMA_Male_Rig')
        else:
            pass        


def onMayaDroppedPythonFile(droppedFile):
    # Custom code to execute when the Python file is dropped
    pass


def clean_ui():
    if cmds.window("AnimationTransferID", exists=True):
        cmds.deleteUI("AnimationTransferID", window=True)

    if cmds.windowPref("AnimationTransferID", exists=True):
        cmds.windowPref("AnimationTransferID", remove=True)

clean_ui()
win = anim_transfer()
win.show()







