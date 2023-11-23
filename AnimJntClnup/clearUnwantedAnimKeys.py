import maya.cmds as cmds
import os
import maya.mel as mel
from PySide2 import QtCore, QtGui, QtWidgets

# Path to the FBX export preset file
PRESET = "C:/Users/Valeriya/Documents/maya/scripts/CHanimExport/UMA_Male_Rig_AnimationExport.fbxexportpreset"

# Get Maya user directory and create AnimationExport directory
USERAPPDIR = cmds.internalVar(userAppDir=True)
newDIRECTORY = os.path.join(USERAPPDIR, 'AnimationExport')
files = []


class BatchCleanupUI(QtWidgets.QDialog):
    def __init__(self):
        super(BatchCleanupUI, self).__init__()
        self.anim_folder_path = None
        self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        self.setup_ui()

    def setup_ui(self):
        # Set up the UI layout
        self.setWindowTitle("Batch jnt CleanUp")
        self.setObjectName("BatchjntCleanUpID")
        self.setMinimumSize(400, 100)
        self.setMaximumSize(800, 200)
        self.resize(400, 100)

        self.main_layout = QtWidgets.QVBoxLayout(self)
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(3, 3, 3, 3)
        self.main_layout.setSpacing(5)

        # Animation Folder UI components
        self.name_label = QtWidgets.QLabel('Animation Folder:')
        self.main_layout.addWidget(self.name_label)
        self.save_name_field = QtWidgets.QLineEdit()
        self.main_layout.addWidget(self.save_name_field)
        self.btn_set_path = QtWidgets.QPushButton("Set Path")
        self.btn_set_path.clicked.connect(self.btn_set_path_clicked)
        self.main_layout.addWidget(self.btn_set_path)

        # Batch Fix button
        self.btn_batch_process = QtWidgets.QPushButton("Batch Fix")
        self.btn_batch_process.clicked.connect(self.process)
        self.main_layout.addWidget(self.btn_batch_process)

    def btn_set_path_clicked(self):
        # Open file dialog to set the animation folder path
        folder_path = cmds.fileDialog2(dialogStyle=2, fileMode=3)
        if folder_path:
            self.save_name_field.setText(folder_path[0])

    def new_scene_maya(self):
        # Create a new Maya scene
        cmds.file(new=True, force=True)

    def folder_file_sort(self, folder_path):
        # Populate the files list with FBX files in the specified folder
        global files
        if not os.path.isdir(folder_path):
            raise ValueError("Folder is not valid")

        for i in os.listdir(folder_path):
            file_name, file_ext = os.path.splitext(i)

            if file_ext == ".fbx":
                full_path = os.path.join(folder_path, i)
                files.append(full_path)

        print(files)

    def get_current_file_name(self):
        # Get the name of the currently opened file
        current_file = cmds.file(q=True, sceneName=True)
        file_name = ""
        if current_file:
            file_name = os.path.basename(current_file)
            print("Currently opened file:", file_name)
        else:
            print("No file is currently opened.")

        return file_name

    def jnt_clean_up(self):
        # Clean up specified joints by cutting animation keys
        jnt_list = [
            'L_front_weapon_slot_05_ADJ', 'L_front_weapon_slot_05', 'L_front_w____scale_05', 'L_front_weapon_slot_04',
            'L_front_w____scale_04', 'C_front_weapon_slot_03_ADJ', 'C_front_weapon_slot_03', 'C_front_w____scale_03',
            'R_front_weapon_slot_02_ADJ', 'R_front_weapon_slot_02', 'R_front_w____scale_02', 'R_front_weapon_slot_01_ADJ',
            'R_front_weapon_slot_01', 'R_front_w____scale_01', 'R_back_weapon_slot_06_ADJ', 'R_back_weapon_slot_06',
            'R_back_weapon_slot_06_ADJ', 'R_back_weapon_slot_09_ADJ', 'R_back_weapon_slot_09', 'R_back_w_____slot_09',
            'C_back_weapon_slot_08_ADJ', 'C_back_weapon_slot_08', 'C_back_w_____slot_08', 'L_back_weapon_slot_07_ADJ',
            'L_back_weapon_slot_07', 'L_back_w_____slot_07', 'L_back_weapon_slot_10_ADJ', 'L_back_weapon_slot_10',
            'L_back_w_____slot_10', 'C_back_weapon_slot_11_ADJ', 'C_back_weapon_slot_11', 'C_back_w_____slot_11'
        ]

        for jnt in jnt_list:
            if cmds.objExists(jnt):
                cmds.cutKey(jnt, attribute='translateX', option="keys")
                cmds.cutKey(jnt, attribute='translateY', option="keys")
                cmds.cutKey(jnt, attribute='translateZ', option="keys")

                cmds.cutKey(jnt, attribute='rotateX', option="keys")
                cmds.cutKey(jnt, attribute='rotateY', option="keys")
                cmds.cutKey(jnt, attribute='rotateZ', option="keys")

                cmds.cutKey(jnt, attribute='scaleX', option="keys")
                cmds.cutKey(jnt, attribute='scaleY', option="keys")
                cmds.cutKey(jnt, attribute='scaleZ', option="keys")
            else:
                pass

    def create_directory(self, directory):
        # Create a given directory if it doesn't exist
        if not os.path.exists(directory):
            os.mkdir(directory)
        return directory

    def fbx_export(self):
        # Export FBX files
        global newDIRECTORY
        dir = self.create_directory(directory=newDIRECTORY)
        new_file_name = self.get_current_file_name().split('.')[0]

        if dir:
            cmds.loadPlugin("fbxmaya")  # Load the fbxmaya plugin
            cmds.select('ParentForExportDelete', hierarchy=True)
            name_export = dir + '/' + new_file_name + '.fbx'
            mel.eval('FBXLoadExportPresetFile -f "{}"'.format(PRESET))
            mel.eval('FBXExport -s -f "{}" -force -options'.format(name_export))
            print("FBX Exported:", name_export)
        else:
            print("Error creating directory.")

    def process(self):
        # Main process function
        folder_path = self.save_name_field.text()
        if folder_path:
            self.new_scene_maya()
            self.folder_file_sort(folder_path)

            for f in files:
                cmds.file(f, open=True, type='FBX', force=True)
                self.jnt_clean_up()
                self.fbx_export()


def clean_ui():
    # Close existing UI windows with the same object name
    app = QtWidgets.QApplication.instance()
    if not app:
        app = QtWidgets.QApplication([])
    for widget in app.topLevelWidgets():
        if widget.objectName() == "BatchjntCleanUpID":
            widget.close()
    return app


if __name__ == "__main__":
    clean_ui()
    win = BatchCleanupUI()
    win.show()
