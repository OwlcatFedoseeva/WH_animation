import maya.cmds as cmds
from PySide2 import QtCore, QtGui, QtWidgets
import os
import maya.mel as mel

DIRECTORY = "C:/Users/Valeriya/Documents/maya/scripts/CHanimExport/UMA_Male_Rig_AnimationExport.fbxexportpreset"

jnt_list = [
    'L_front_weapon_slot_05_ADJ', 'L_front_weapon_slot_05', 'L_front_w____scale_05','L_front_weapon_slot_04',
    'L_front_w____scale_04', 'C_front_weapon_slot_03_ADJ','C_front_weapon_slot_03','C_front_w____scale_03',
    'R_front_weapon_slot_02_ADJ', 'R_front_weapon_slot_02','R_front_w____scale_02', 'R_front_weapon_slot_01_ADJ',
    'R_front_weapon_slot_01','R_front_w____scale_01','R_back_weapon_slot_06_ADJ','R_back_weapon_slot_06',
    'R_back_weapon_slot_06_ADJ','R_back_weapon_slot_09_ADJ','R_back_weapon_slot_09','R_back_w_____slot_09',
    'C_back_weapon_slot_08_ADJ','C_back_weapon_slot_08','C_back_w_____slot_08','L_back_weapon_slot_07_ADJ',
    'L_back_weapon_slot_07','L_back_w_____slot_07','L_back_weapon_slot_10_ADJ','L_back_weapon_slot_10',
    'L_back_w_____slot_10','C_back_weapon_slot_11_ADJ','C_back_weapon_slot_11','C_back_w_____slot_11'
]
class batch_cleanup_UI(QtWidgets.QDialog):

    def __init__(self):
        super(batch_cleanup_UI, self).__init__()
        self.anim_folder_path = None
        self.export_dir = DIRECTORY
        self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        self.setup_ui()

    def setup_ui(self):
        self.setWindowTitle("Batch jnt CleanUp")
        self.setObjectName("BatchjntCleanUpID")
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
        folder_path = self.anim_folder_path

        if not os.path.isdir(folder_path):
            raise ValueError("Folder is not valid")

        files = []

        for i in os.listdir(folder_path):
            filename, file_ext = os.path.splitext(i)

            if file_ext == ".fbx":
                full_path = os.path.join(folder_path, i)
                files.append(full_path)

        for f in files:
            cmds.file(f, open=True, type='FBX', force=True)

            file_short_name = os.path.basename(f)
            file_name = file_short_name.split(".")[0]


            # Assuming jnt_list is accessible here
            for jnt in jnt_list:
                if cmds.objExists(jnt):
                    cmds.cutKey(jnt, attribute='translateX', option="keys")
                    cmds.cutKey(jnt, attribute='translateY', option="keys")
                    cmds.cutKey(jnt, attribute='translateZ', option="keys")

                else:
                    pass


            # Save the file to overwrite it
            nameExport = folder_path + '/' + file_name + '.fbx'
            print(file_name + " processed and saved here ==> " + nameExport)

            cmds.select('ParentForExportDelete', hi=True)
            cmds.file(nameExport, exportSelected=True, type="FBX export", force=True, prompt=False)



if __name__ == "__main__":
    clean_ui()
    win = batch_cleanup_UI()
    win.show()
