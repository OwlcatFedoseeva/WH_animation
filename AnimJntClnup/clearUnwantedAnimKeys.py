import maya.cmds as cmds
import os
import maya.mel as mel
import json
from PySide2 import QtCore, QtGui, QtWidgets


# Get Maya user directory and create AnimationExport directory
USERAPPDIR = cmds.internalVar(userAppDir=True)
newDIRECTORY = os.path.join(USERAPPDIR, 'AnimationExport')
files = []

# Path to the FBX export preset file

#PRESET = "C:/Users/Valeriya/Documents/maya/scripts/CHanimExport/UMA_Male_Rig_AnimationExport.fbxexportpreset"
PRESET = USERAPPDIR + 'scripts/AnimJntClnup/UMA_Male_Rig_AnimationExport.fbxexportpreset'
PATH = USERAPPDIR + 'scripts/AnimJntClnup/'

class BatchCleanupUI(QtWidgets.QDialog):
    def __init__(self):
        super(BatchCleanupUI, self).__init__()
        self.anim_folder_path = None
        #self.setWindowFlags(QtCore.Qt.WindowStaysOnTopHint)
        self.setup_ui()
        # Initialize json_path with a default value
        initial_json_path = os.path.join(PATH, 'joints_set.json')  # Provide the correct JSON path
        self.update_list_widget(initial_json_path)

    def setup_ui(self):
        # Set up the UI layout
        self.setWindowTitle("Batch jnt CleanUp 2.0")
        self.setObjectName("BatchjntCleanUpID")
        self.setMinimumSize(400, 250)
        self.setMaximumSize(800, 500)
        self.resize(400, 250)

        self.main_layout = QtWidgets.QVBoxLayout(self)
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(3, 3, 3, 3)
        self.main_layout.setSpacing(5)

        # Animation Folder UI components
        self.name_label = QtWidgets.QLabel('Animation Folder:')
        self.main_layout.addWidget(self.name_label)
        self.save_name_field = QtWidgets.QLineEdit()
        self.main_layout.addWidget(self.save_name_field)

        # Set Folder button
        self.btn_set_path = QtWidgets.QPushButton("Set Path")
        self.btn_set_path.clicked.connect(self.btn_set_path_clicked)
        self.main_layout.addWidget(self.btn_set_path)

        # Set joints to clean up button
        self.btn_set_selection = QtWidgets.QPushButton("Select Joint to clean up")
        self.btn_set_selection.clicked.connect(self.save_joints_selection_list)
        self.main_layout.addWidget(self.btn_set_selection)


        self.listWidget = QtWidgets.QListWidget()
        size_policy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        self.listWidget.setSizePolicy(size_policy)
        self.main_layout.addWidget(self.listWidget)

        self.chk_box_layout = QtWidgets.QHBoxLayout(self)
        
        # Check box
        self.chk_box_trans = QtWidgets.QCheckBox("Translate")
        self.chk_box_trans.setChecked(True)
        self.chk_box_rot = QtWidgets.QCheckBox("Rotate")
        self.chk_box_rot.setChecked(True)
        self.chk_box_scl = QtWidgets.QCheckBox("Scale")
        self.chk_box_scl.setChecked(True)

        self.chk_box_layout.addWidget(self.chk_box_trans)
        self.chk_box_layout.addWidget(self.chk_box_rot)
        self.chk_box_layout.addWidget(self.chk_box_scl)

        # Add the checkbox layout to the main layout
        self.main_layout.addLayout(self.chk_box_layout)


        self.export_option_layout = QtWidgets.QHBoxLayout(self)

        # Save destination option
        self.save_to_origin_folder_radio = QtWidgets.QRadioButton("Save to the folder of origin")
        self.save_to_origin_folder_radio.setChecked(False)
        self.save_to_origin_folder_radio.clicked.connect(self.save_option_changed)
        self.export_option_layout.addWidget(self.save_to_origin_folder_radio)

        self.save_to_animation_export_radio = QtWidgets.QRadioButton("Save to AnimationExport folder")
        self.save_to_animation_export_radio.setChecked(True)
        self.save_to_animation_export_radio.clicked.connect(self.save_option_changed)
        self.export_option_layout.addWidget(self.save_to_animation_export_radio)

        self.main_layout.addLayout(self.export_option_layout)

        # Batch Fix button
        self.btn_batch_process = QtWidgets.QPushButton("Batch Fix")
        self.btn_batch_process.clicked.connect(self.process)
        self.main_layout.addWidget(self.btn_batch_process)

    def btn_set_path_clicked(self):
        # Open file dialog to set the animation folder path
        folder_path = cmds.fileDialog2(dialogStyle=2, fileMode=3)
        if folder_path:
            self.save_name_field.setText(folder_path[0])
        return None

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


    def set_selection(self):
        jnt_list = []
        sel = cmds.ls(sl=True, fl=True, type='joint')
        
        for s in sel:
            jnt_list.append(s)
        
        print (jnt_list)	
        return jnt_list

    def save_joints_selection_list(self):
        name = 'joints_set'
        path = os.path.join(PATH, '%s.json' % name)
        data = self.set_selection()
        
        with open(path, 'w') as f:
            json.dump(data, f, indent=4)

        # Update the list widget
        self.update_list_widget(path)

        # Use the saved data in the jnt_clean_up function
        self.jnt_clean_up(path)


    def update_list_widget(self, json_path):
        self.listWidget.clear()
        with open(json_path, 'r') as f:
            data = json.load(f)

        for item in data:
            self.listWidget.addItem(item)

    def cut_animation_keys(self, jnt, attributes):
        """
        Cut animation keys for the specified joint and attributes.
        
        Args:
            joint (str): The name of the joint.
            attributes (list): A list of attributes to cut keys from.
        """
        start_frame = cmds.playbackOptions(q=True, min=True)
        end_frame = cmds.playbackOptions(q=True, max=True)

        for attr in attributes:
            if cmds.objExists(jnt):
                cmds.cutKey(jnt, time= (start_frame, end_frame), attribute=attr, option="keys", cl=True)
            else:
                print("Joint does not exist:", jnt)

    def jnt_clean_up(self, json_path):
        """
        Clean up specified joints by cutting animation keys based on data in the JSON file.
        
        Args:
            json_path (str): The path to the JSON file containing joint data.
        """
        with open(json_path, 'r') as f:
            jnt_list = json.load(f)
            attributes_to_clean = []
            if self.chk_box_trans.isChecked():
                attributes_to_clean.extend(['translateX', 'translateY', 'translateZ'])
            if self.chk_box_rot.isChecked():
                attributes_to_clean.extend(['rotateX', 'rotateY', 'rotateZ'])
            if self.chk_box_scl.isChecked():
                attributes_to_clean.extend(['scaleX', 'scaleY', 'scaleZ'])

            for jnt in jnt_list:
                self.cut_animation_keys(jnt, attributes_to_clean)


    def create_directory(self, directory):
        # Create a given directory if it doesn't exist
        try:
            os.makedirs(directory)
        except OSError as e:
            if e.errno != os.errno.EEXIST:
                raise
        return directory

    def save_option_changed(self):
        # Update the save option when the checkbox state changes
        self.save_to_origin_folder = self.save_to_origin_folder_radio.isChecked()
        self.save_to_animation_export = self.save_to_animation_export_radio.isChecked()



    def fbx_export(self):
        # Export FBX files
        global newDIRECTORY
        dir = self.save_name_field.text()  # Get the folder path from the UI

        if dir:
            new_file_name = self.get_current_file_name().split('.')[0]  # Retrieve the current file name
            if self.save_to_animation_export_radio.isChecked():
                dir = self.create_directory(directory=newDIRECTORY)
                cmds.loadPlugin("fbxmaya")  # Load the fbxmaya plugin
                cmds.select('ParentForExportDelete', hierarchy=True)
                name_export = dir + '/' + new_file_name + '.fbx'
                mel.eval('FBXLoadExportPresetFile -f "{}"'.format(PRESET))
                mel.eval('FBXExport -s -f "{}" -force -options'.format(name_export))
                print("FBX Exported:", name_export)

            if self.save_to_origin_folder_radio.isChecked():
                # dir = self.btn_set_path_clicked()  # This line is not necessary
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
                json_path = os.path.join(PATH, 'joints_set.json')  # Provide the correct JSON path
                self.jnt_clean_up(json_path)
                self.fbx_export()

            # Clear the files list for the next iteration
            cmds.confirmDialog(title='Process Complete', message='Batch Process is Done', button=['OK'])
            del files[:]



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
