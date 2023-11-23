import maya.cmds as cmds
from PySide2 import QtCore, QtGui, QtWidgets
import maya.standalone as standalone
import os
import sys
from argparse import ArgumentParser
import maya.mel as mel


presetPathName = "C:/Users/Valeriya/Documents/maya/scripts/CHanimExport/UMA_Male_Rig_AnimationExport.fbxexportpreset"

joint_list = [
    'L_front_weapon_slot_05_ADJ', 'L_front_weapon_slot_05', 'L_front_w____scale_05','L_front_weapon_slot_04',
    'L_front_w____scale_04', 'C_front_weapon_slot_03_ADJ','C_front_weapon_slot_03','C_front_w____scale_03',
    'R_front_weapon_slot_02_ADJ', 'R_front_weapon_slot_02','R_front_w____scale_02', 'R_front_weapon_slot_01_ADJ',
    'R_front_weapon_slot_01','R_front_w____scale_01','R_back_weapon_slot_06_ADJ','R_back_weapon_slot_06',
    'R_back_weapon_slot_06_ADJ','R_back_weapon_slot_09_ADJ','R_back_weapon_slot_09','R_back_w_____slot_09',
    'C_back_weapon_slot_08_ADJ','C_back_weapon_slot_08','C_back_w_____slot_08','L_back_weapon_slot_07_ADJ',
    'L_back_weapon_slot_07','L_back_w_____slot_07','L_back_weapon_slot_10_ADJ','L_back_weapon_slot_10',
    'L_back_w_____slot_10','C_back_weapon_slot_11_ADJ','C_back_weapon_slot_11','C_back_w_____slot_11'
]

def load_fbx_export_preset(presetPathName):
    mel.eval('loadPlugin "fbxmaya";')
    mel.eval('FBXLoadExportPresetFile -f "{}";'.format(presetPathName))



class batch_cleanup_UI(QtWidgets.QDialog):

    def __init__(self):
        super(batch_cleanup_UI, self).__init__()
        self.anim_folder_path = None
        self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        self.setup_ui()

    def setup_ui(self):
        self.setWindowTitle("Batch Joint CleanUp")
        self.setObjectName("BatchJointCleanUpID")
        self.setMinimumSize(400, 100)
        self.setMaximumSize(800, 200)
        self.resize(400, 100)
        
        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(3, 3, 3, 3)
        self.main_layout.setSpacing(5)
        self.setLayout(self.main_layout)

        self.text_field_layout = QtWidgets.QHBoxLayout()
        self.main_layout.addLayout(self.text_field_layout)

        self.batch_btn_layout = QtWidgets.QVBoxLayout()
        self.main_layout.addLayout(self.batch_btn_layout)

    # Text Line
        self.nameLabel = QtWidgets.QLabel(self)
        self.nameLabel.setText('Animation Folder:')
        self.text_field_layout.addWidget(self.nameLabel)
        self.saveNameField = QtWidgets.QLineEdit()
        self.text_field_layout.addWidget(self.saveNameField)
        self.btn_set_path = QtWidgets.QPushButton("Set Path")
        self.btn_set_path.clicked.connect(self.btn_set_path_clicked)
        self.text_field_layout.addWidget(self.btn_set_path)

    # Batch Btn 
        self.btn_batch_process = QtWidgets.QPushButton("Batch Fix")
        self.btn_batch_process.clicked.connect(self.btn_batch_process_clicked)
        self.batch_btn_layout.addWidget(self.btn_batch_process)

    def btn_set_path_clicked(self):
        anim_folder_path = cmds.fileDialog2(dialogStyle=2, fileMode=3)
        if anim_folder_path:
            selected_folder_path = anim_folder_path[0]
            self.saveNameField.setText(selected_folder_path)
            self.anim_folder_path = selected_folder_path  # Set the attribute here
        return anim_folder_path

    def btn_batch_process_clicked(self):

        #path = "C:/Users/Valeriya/Documents/maya/testAnims"
        path = self.anim_folder_path
        files = [os.path.join(path, f) for f in os.listdir(path) if f.lower().endswith(".fbx")]

        # check if path exists
        if not os.path.isdir(path):
            raise ValueError("Folder does not exist")

        
        if not files:
            print("There are no FBX files in the folder")
            return

        standalone.initialize()
        
        load_fbx_export_preset(presetPathName)

        for f in files:
            cmds.file(f, open=True, type='FBX', force=True)
            #cmds.file(f, open=True)

            file_short_name = os.path.basename(f)
            file_name = file_short_name.split(".")[0]

            #Open Files in a given folder


            for joint in joint_list:


                cmds.cutKey( joint, attribute=['translateX', 'translateY', 'translateZ'], option="keys" )



            # Save the file to overwrite it
            nameExport = path + '/' + file_name + '.fbx'
            mel.eval('file -force -options "fbx" -type "FBX export" -pr -ea "{}";'.format(nameExport))

            print("/n/n/nOutput:/n")
            print("/n" + file_name + "=>" + "Saved here => " + nameExport)



        #print(file_name)

        standalone.uninitialize()






def clean_ui():
    if cmds.window("BatchJointCleanUpID", exists=True):
        cmds.deleteUI("BatchJointCleanUpID", window=True)

    if cmds.windowPref("BatchJointCleanUpID", exists=True):
        cmds.windowPref("BatchJointCleanUpID", remove=True)

clean_ui()
win = batch_cleanup_UI()
win.show()
