import sys
import os
import json
import subprocess
from PySide2 import QtCore, QtGui, QtWidgets 
from PySide2.QtGui import QDoubleValidator
import maya.cmds as cmds
from maya.app.general.mayaMixin import MayaQWidgetDockableMixin
from pymel.core import mel

USERAPPDIR = cmds.internalVar(userAppDir=True)
TOOLS_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'WH_Model_To_Project_Exporter')

# Add PRESET_DIRECTORY to sys.path
if TOOLS_DIRECTORY not in sys.path:
    sys.path.append(TOOLS_DIRECTORY)

# Now you can import the module
import ModelExporterProcess

from ModelExporterProcess import scene_expoter_tools

class CollapsibleBox(QtWidgets.QWidget):
    def __init__(self, title="", parent=None):
        super(CollapsibleBox, self).__init__(parent)
        
        self.toggle_button = QtWidgets.QToolButton(text=title, checkable=True, checked=False)
        self.toggle_button.setStyleSheet("QToolButton { border: none; }")
        self.toggle_button.setToolButtonStyle(QtCore.Qt.ToolButtonTextBesideIcon)
        self.toggle_button.setArrowType(QtCore.Qt.RightArrow)
        self.toggle_button.pressed.connect(self.on_pressed)  # Connect the on_pressed method
        
        self.content_area = QtWidgets.QScrollArea(maximumHeight=0, minimumHeight=0)
        self.content_area.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Fixed)
        self.content_area.setFrameShape(QtWidgets.QFrame.NoFrame)
        
        self.collapsible_box_main_layout = QtWidgets.QVBoxLayout(self)
        self.collapsible_box_main_layout.setSpacing(0)
        self.collapsible_box_main_layout.setContentsMargins(0, 0, 0, 0)
        self.collapsible_box_main_layout.addWidget(self.toggle_button)
        self.collapsible_box_main_layout.addWidget(self.content_area)

        # Checker Options
        self.checker_settings_option_layout = QtWidgets.QVBoxLayout()
        self.checker_settings_option_layout.setAlignment(QtCore.Qt.AlignTop)
        self.checker_settings_option_layout.setContentsMargins(2, 2, 2, 2)
        self.checker_settings_option_layout.setSpacing(5)
        self.collapsible_box_main_layout.addLayout(self.checker_settings_option_layout)

        self.parent_dialog = parent  # Added to access the parent dialog

    def on_pressed(self):
        checked = self.toggle_button.isChecked()
        self.toggle_button.setArrowType(QtCore.Qt.DownArrow if checked else QtCore.Qt.RightArrow)
        # Increase the height of the collapsible box when expanded
        expanded_height = self.content_area.sizeHint().height() + 110  # Increase the height by 70 pixels
        self.content_area.setMaximumHeight(expanded_height if checked else 0)
        self.content_area.setMinimumHeight(expanded_height if checked else 0)
        
        # Adjust the size of the main window when the collapsible box is toggled
        if self.parent_dialog:
            self.parent_dialog.adjustSize()  # Adjust the size of the parent dialog

class model_exporter_UI(MayaQWidgetDockableMixin, QtWidgets.QDialog):
    def __init__(self):
        super(model_exporter_UI, self).__init__()
        self.setup_ui()
        self.setWindowFlags(QtCore.Qt.Tool)
        self.project_data = {}  # Dictionary to store the project data
        self.load_settings()  # Load the saved settings when initializing the UI

    def setup_ui(self):
        self.setWindowTitle("WH Model Exporter 1.1")
        self.setObjectName("WHModelExporterID")
        
        self.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)

        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(5, 5, 5, 5)
        self.main_layout.setSpacing(5)
        self.setLayout(self.main_layout)

        self.set_proj_layout = QtWidgets.QHBoxLayout()
        self.set_proj_layout.setAlignment(QtCore.Qt.AlignTop)
        self.set_proj_layout.setContentsMargins(1, 1, 1, 1)
        self.set_proj_layout.setSpacing(5)
        self.main_layout.addLayout(self.set_proj_layout)

        self.set_proj_menu = QtWidgets.QComboBox()
        self.set_proj_menu.addItem("Choose Project")
        self.set_proj_menu.setCurrentIndex(0)
        self.set_proj_layout.addWidget(self.set_proj_menu)

        self.load_projects()

        self.add_new_project_btn = QtWidgets.QPushButton("Add Project")
        self.add_new_project_btn.clicked.connect(self.add_new_project_clicked)
        self.add_new_project_btn.setFixedSize(100, 20)
        self.set_proj_layout.addWidget(self.add_new_project_btn)

        self.checker_options_layout = QtWidgets.QHBoxLayout()
        self.checker_options_layout.setAlignment(QtCore.Qt.AlignTop)
        self.checker_options_layout.setContentsMargins(2, 2, 2, 2)
        self.checker_options_layout.setSpacing(5)
        self.main_layout.addLayout(self.checker_options_layout)

        self.check_scene_on_radio_btn = QtWidgets.QRadioButton("Check for errors")
        self.check_scene_on_radio_btn.setChecked(True)
        self.checker_options_layout.addWidget(self.check_scene_on_radio_btn)

        self.check_scene_off_radio_btn = QtWidgets.QRadioButton("Don't check for errors")
        self.checker_options_layout.addWidget(self.check_scene_off_radio_btn)

        self.collapsible_box = CollapsibleBox(title="Checker Options", parent=self)

        self.content_layout = QtWidgets.QVBoxLayout()
        self.content_layout.addWidget(QtWidgets.QLabel("Advanced Settings Content"))
        self.collapsible_box.content_area.setLayout(self.content_layout)

        self.remove_namespace_chk = QtWidgets.QCheckBox("Remove Namespace")
        self.content_layout.addWidget(self.remove_namespace_chk)

        self.remove_empty_uv_chk = QtWidgets.QCheckBox("Remove double UV sets")
        self.content_layout.addWidget(self.remove_empty_uv_chk)

        self.remove_model_history_chk = QtWidgets.QCheckBox("Remove model history")
        self.content_layout.addWidget(self.remove_model_history_chk)

        self.correct_material_tex_name_chk = QtWidgets.QCheckBox("Correct material and texture name")
        self.content_layout.addWidget(self.correct_material_tex_name_chk)

        self.correct_tex_path_name_chk = QtWidgets.QCheckBox("Correct texture path")
        self.content_layout.addWidget(self.correct_tex_path_name_chk)

        self.correct_shader_assignment_chk = QtWidgets.QCheckBox("Correct shader assignment")
        self.content_layout.addWidget(self.correct_shader_assignment_chk)

        self.remove_unused_materials_chk = QtWidgets.QCheckBox("Remove unused materials")
        self.content_layout.addWidget(self.remove_unused_materials_chk)

        self.remove_duplicate_polygons_chk = QtWidgets.QCheckBox("Remove double polygons")
        self.content_layout.addWidget(self.remove_duplicate_polygons_chk)

        self.freeze_transforms_chk = QtWidgets.QCheckBox("Freeze Transforms")
        self.content_layout.addWidget(self.freeze_transforms_chk)

        self.delete_empty_nodes_chk = QtWidgets.QCheckBox("Delete Empty Nodes")
        self.content_layout.addWidget(self.delete_empty_nodes_chk)

        self.locked_normals_chk = QtWidgets.QCheckBox("Check locked normals")
        self.content_layout.addWidget(self.locked_normals_chk)

        self.main_layout.addWidget(self.collapsible_box)

        self.export_menu_layout = QtWidgets.QVBoxLayout()
        self.export_menu_layout.setAlignment(QtCore.Qt.AlignTop)
        self.export_menu_layout.setContentsMargins(1, 1, 1, 1)
        self.export_menu_layout.setSpacing(5)
        self.main_layout.addLayout(self.export_menu_layout)

        self.export_scene_with_lightmap_btn = QtWidgets.QPushButton("Export Current Model With Lightmap")
        self.export_scene_with_lightmap_btn.clicked.connect(self.export_scene_with_lightmap_clicked)
        self.export_scene_with_lightmap_btn.setFixedSize(355, 50)
        self.export_menu_layout.addWidget(self.export_scene_with_lightmap_btn)

        self.export_scene_without_lightmap_btn = QtWidgets.QPushButton("Export Current Model Without Lightmap")
        self.export_scene_without_lightmap_btn.clicked.connect(self.export_scene_without_lightmap_clicked)
        self.export_scene_without_lightmap_btn.setFixedSize(355, 50)
        self.export_menu_layout.addWidget(self.export_scene_without_lightmap_btn)

        self.export_all_with_lightmap_btn = QtWidgets.QPushButton("Export Many Model With Lightmap")
        self.export_all_with_lightmap_btn.clicked.connect(self.export_all_with_lightmap_clicked)
        self.export_all_with_lightmap_btn.setFixedSize(355, 50)
        self.export_menu_layout.addWidget(self.export_all_with_lightmap_btn)

        self.export_all_without_lightmap_btn = QtWidgets.QPushButton("Export Many Model Without Lightmap")
        self.export_all_without_lightmap_btn.clicked.connect(self.export_all_without_lightmap_clicked)
        self.export_all_without_lightmap_btn.setFixedSize(355, 50)
        self.export_menu_layout.addWidget(self.export_all_without_lightmap_btn)

    def load_settings(self):
        settings = QtCore.QSettings("MyCompany", "ModelExporter")
        
        # Load the state of checkboxes
        self.remove_namespace_chk.setChecked(settings.value("remove_namespace_chk", True) == 'true')
        self.remove_empty_uv_chk.setChecked(settings.value("remove_empty_uv_chk", True) == 'true')
        self.remove_model_history_chk.setChecked(settings.value("remove_model_history_chk", True) == 'true')
        self.correct_material_tex_name_chk.setChecked(settings.value("correct_material_tex_name_chk", True) == 'true')
        self.correct_tex_path_name_chk.setChecked(settings.value("correct_tex_path_name_chk", True) == 'true')
        self.correct_shader_assignment_chk.setChecked(settings.value("correct_shader_assignment_chk", True) == 'true')
        self.remove_unused_materials_chk.setChecked(settings.value("remove_unused_materials_chk", True) == 'true')
        self.remove_duplicate_polygons_chk.setChecked(settings.value("remove_duplicate_polygons_chk", True) == 'true')
        self.freeze_transforms_chk.setChecked(settings.value("freeze_transforms_chk", True) == 'true')
        self.delete_empty_nodes_chk.setChecked(settings.value("delete_empty_nodes_chk", True) == 'true')
        self.locked_normals_chk.setChecked(settings.value("locked_normals_chk", True) == 'true')
        
        # Load other settings, like the selected project
        last_selected_project = int(settings.value("last_selected_project", 0))
        if last_selected_project < self.set_proj_menu.count():
            self.set_proj_menu.setCurrentIndex(last_selected_project)
        
        # Load radio button states
        if settings.value("check_scene_on_radio_btn", True) == 'true':
            self.check_scene_on_radio_btn.setChecked(True)
        else:
            self.check_scene_off_radio_btn.setChecked(True)
    
    def save_settings(self):
        settings = QtCore.QSettings("MyCompany", "ModelExporter")
        
        # Save the state of checkboxes
        settings.setValue("remove_namespace_chk", self.remove_namespace_chk.isChecked())
        settings.setValue("remove_empty_uv_chk", self.remove_empty_uv_chk.isChecked())
        settings.setValue("remove_model_history_chk", self.remove_model_history_chk.isChecked())
        settings.setValue("correct_material_tex_name_chk", self.correct_material_tex_name_chk.isChecked())
        settings.setValue("correct_tex_path_name_chk", self.correct_tex_path_name_chk.isChecked())
        settings.setValue("correct_shader_assignment_chk", self.correct_shader_assignment_chk.isChecked())
        settings.setValue("remove_unused_materials_chk", self.remove_unused_materials_chk.isChecked())
        settings.setValue("remove_duplicate_polygons_chk", self.remove_duplicate_polygons_chk.isChecked())
        settings.setValue("freeze_transforms_chk", self.freeze_transforms_chk.isChecked())
        settings.setValue("delete_empty_nodes_chk", self.delete_empty_nodes_chk.isChecked())
        settings.setValue("locked_normals_chk", self.locked_normals_chk.isChecked())
        
        # Save other settings, like the selected project
        settings.setValue("last_selected_project", self.set_proj_menu.currentIndex())
        
        # Save radio button states
        settings.setValue("check_scene_on_radio_btn", self.check_scene_on_radio_btn.isChecked())
    
    def closeEvent(self, event):
        self.save_settings()  # Save settings when the window is closing
        event.accept()  # Accept the close event

    def load_projects(self):
        # Define the path to the JSON file
        json_file_path = os.path.join(USERAPPDIR, 'scripts', 'WH_Model_To_Project_Exporter', 'project_list.JSON')
        
        # Check if the JSON file exists
        if not os.path.exists(json_file_path):
            print("Error: JSON file not found")
            return

        # Load the JSON file
        with open(json_file_path, 'r') as file:
            self.project_data = json.load(file)

        # Clear the combo box to avoid duplicate entries
        self.set_proj_menu.clear()
        self.set_proj_menu.addItem("Choose Project")  # Re-add hint option

        # Populate the combo box with project keys
        for project_key in self.project_data.keys():
            self.set_proj_menu.addItem(project_key)

    def on_project_selected(self, index):
        # Get the selected project keyword
        keyword = self.set_proj_menu.currentText()
        print(keyword)

        # Avoid processing if the default "Choose Project" is selected
        if keyword == "Choose Project":
            return

    def add_new_project_clicked(self):
        # Only create and show the add project window when the button is clicked
        self.add_project_window = model_exporter_add_projectUI(self)
        self.add_project_window.show()
    
    def load_project_data(self, keyword):
        # Check if the keyword exists in the JSON data
        if keyword in self.on_project_selected:
            # Extract and print the data associated with the keyword
            project_info = self.project_data[keyword]
            project_name = project_info.get('project_name', 'Project name not found')
            local_path = project_info.get('local_path', 'Local path not found')
            server_path = project_info.get('server_path', 'Server path not found')
            scale_factor = project_info.get('scale_factor', 'Scale factor not found')
            image_format = project_info.get('image_format', 'Image format not found')

            print("Project: %s\nLocal Path: %s\nServer Path: %s\nScale Factor: %s\nImage Format: %s" % 
                    (project_name, local_path, server_path, scale_factor, image_format))

        else:
            print("Error: Project '%s' not found in the JSON data" % keyword)

    def export_details(self):
        json_file_path = os.path.join(USERAPPDIR, 'scripts', 'WH_Model_To_Project_Exporter', 'project_list.JSON')
        # Load the JSON file
        with open(json_file_path, 'r') as file:
            self.project_data = json.load(file)  
        keyword = self.set_proj_menu.currentText()
        #print(keyword)
        
        server_path = self.project_data[keyword].get('server_path', 'Server path not found')
        scale_factor = self.project_data[keyword].get('scale_factor', 'Scale factor not not set')
        image_format = self.project_data[keyword].get('image_format', 'Image format not not set')
        print(server_path)
        print(scale_factor)
        print(image_format)
        return server_path , scale_factor, image_format

    def save_textures_to_folder(self, server_path, image_format=None, compression=None, quality=75):
        server_path, scale_factor, image_format = self.export_details()

        # Ensure the image format is valid and supported by ImageMagick
        valid_formats = ['TIFF', 'JPEG', 'PNG', 'BMP', 'GIF']
        if image_format.upper() not in valid_formats:
            raise ValueError("Unsupported image format. Choose from: %s" % ', '.join(valid_formats))

        # Normalize the server_path to ensure consistent path handling
        server_path = os.path.abspath(server_path).replace('\\', '/')

        # Get all file nodes and PSD-specific nodes in the scene
        file_nodes = cmds.ls(type=['file', 'psdFileTex'])

        # Filter nodes that use PSD textures or any textures in general
        texture_files = []
        for node in file_nodes:
            file_path = cmds.getAttr(node + '.fileTextureName')
            if file_path and os.path.exists(file_path):
                texture_files.append((node, file_path))

        if not texture_files:
            print("No textures found in the scene.")
            return

        postfixes = ["_d", "_n", "_m"]  # Add or modify postfixes as needed

        for node, texture_path in texture_files:
            # Normalize the texture path
            texture_path = os.path.abspath(texture_path).replace('\\', '/')
            
            # Identify the 'Art' folder in the source path
            try:
                art_index = texture_path.lower().split('/').index('art')
            except ValueError:
                print("Skipped: 'Art' folder not found in the path %s" % texture_path)
                continue

            # Get the relative path after the 'Art' folder
            relative_path = os.path.join(*texture_path.split('/')[art_index + 1:])
            directory_path = os.path.dirname(relative_path)

            # Define the directory path for saving the converted images
            save_dir = os.path.join(server_path, directory_path)
            
            # Create the directories in the server path if they don't exist
            if not os.path.exists(save_dir):
                os.makedirs(save_dir)

            base_filename, ext = os.path.splitext(os.path.basename(relative_path))
            
            # Strip the "_d" postfix to get the base name
            if base_filename.endswith("_d"):
                base_filename = base_filename[:-2]

            # Define the set of filenames to look for based on postfixes
            filenames_to_convert = {texture_path}  # Always include the original texture
            for postfix in postfixes:
                potential_filename = "%s%s%s" % (base_filename, postfix, ext)
                potential_path = os.path.join(os.path.dirname(texture_path), potential_filename)
                if os.path.exists(potential_path):
                    filenames_to_convert.add(potential_path)

            for potential_path in filenames_to_convert:
                # Prepare the full path for saving the file
                file_name = os.path.basename(potential_path)
                output_file_name = "%s.%s" % (os.path.splitext(file_name)[0], image_format.lower())
                output_file_path = os.path.join(save_dir, output_file_name)

                # Check if the output file already exists
                if os.path.exists(output_file_path):
                    print("Skipped: File already exists at %s" % output_file_path)
                    continue

                # Determine if the PSD file has an alpha channel
                alpha_check_command = [
                    "magick", "identify", "-format", "%[channels]", potential_path
                ]
                try:
                    # Use Popen to run the command and capture the output
                    process = subprocess.Popen(alpha_check_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
                    stdout, stderr = process.communicate()
                    has_alpha = 'alpha' in stdout.decode('utf-8').lower()
                except Exception as e:
                    print("Failed to check alpha channel for %s: %s" % (potential_path, e))
                    continue

                # Build the appropriate command based on whether the image has an alpha channel
                try:
                    image_magick_path = r"C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe"
                    if has_alpha:
                        command = [
                            image_magick_path, potential_path,
                            "(", "+clone", "-alpha", "extract", ")", 
                            "-alpha", "off", "-compose", "copy_opacity", "-composite",
                            "-compress", compression,
                            "-define", "tiff:alpha=unspecified",
                            output_file_path
                        ]
                    else:
                        command = [
                            image_magick_path, potential_path,
                            "-alpha", "off", 
                            "-compress", compression,
                            output_file_path
                        ]

                    # Execute the command
                    subprocess.call(command)
                    print("Converted and saved texture to %s" % output_file_path)
                except Exception as e:
                    print("Failed to convert %s: %s" % (potential_path, e))


    def save_fbx_file(self, server_path, project_key, scale_factor=None):
        # Assuming the export details are extracted from some JSON configuration
        server_path, scale_factor, image_format = self.export_details()

        # Current Maya scene file path
        file_path = cmds.file(query=True, sceneName=True)
        file_name = os.path.basename(file_path).split('.')[0]

        # Extracting the 'Art' folder from the file_path
        common_folder = "Art"
        local_index = file_path.find(common_folder)

        if local_index == -1:
            raise ValueError("'%s' not found in the file path: %s" % (common_folder, file_path))

        # Extract the sub-path after the 'Art' folder
        relative_path = file_path[local_index + len(common_folder) + 1:]  # +1 to skip the slash after 'Art'
        
        # Construct the destination path without duplicating the 'Art' folder
        save_path = os.path.join(server_path, relative_path)
        save_dir = os.path.dirname(save_path)

        # Ensure that the save directory exists
        if not os.path.exists(save_dir):
            os.makedirs(save_dir)

        # Final file save path with .fbx extension
        file_format = ".fbx"
        full_path = os.path.join(save_dir, "%s%s" % (file_name, file_format))

        # Replace backslashes with forward slashes for MEL compatibility
        full_path = full_path.replace('\\', '/')

        # Load FBX plugin if not already loaded
        if not cmds.pluginInfo("fbxmaya", query=True, loaded=True):
            cmds.loadPlugin("fbxmaya")

        # Export the file as FBX to the full path
        try:
            mel.eval('FBXExport -f "%s" -s' % full_path)
            print("File saved to %s" % full_path)
        except Exception as e:
            print("Error during FBX export: %s" % str(e))
            raise


    def check_scene(self):
        errors = []
        def run_check(method, description):
            try:
                method()
            except Exception as e:
                errors.append("%s failed: %s" % (description, str(e)))
                #self.logger.error("%s failed: %s" % (description, str(e)))

        if self.remove_namespace_chk.isChecked():
            run_check(self.remove_namespaces, "Removing namespaces")
        if self.remove_empty_uv_chk.isChecked():
            run_check(self.delete_empty_uv_sets, "Removing double UV sets")
        if self.remove_model_history_chk.isChecked():
            run_check(self.model_cleanup, "Removing model history")
        if self.correct_material_tex_name_chk.isChecked():
            run_check(self.correct_material_and_textures, "Correcting material and textures names")
        if self.correct_tex_path_name_chk.isChecked():
            run_check(self.correct_texture_path, "Correcting texture paths")
        if self.correct_shader_assignment_chk.isChecked():
            run_check(self.correct_shader_assignment, "Correcting shader assignment")
        if self.remove_unused_materials_chk.isChecked():
            run_check(self.scene_optimization, "Removing unused materials")
        if self.remove_duplicate_polygons_chk.isChecked():
            run_check(self.duplicate_polygon_checker, "Removing duplicate polygons")                

        if self.freeze_transforms_chk.isChecked():
            run_check(self.freeze_transforms_checker, "Freezing Transforms") 

        if self.delete_empty_nodes_chk.isChecked():
            run_check(self.delete_empty_nodes_checker, "Deleting Empty Nodes") 

        if self.locked_normals_chk.isChecked():
            run_check(self.locked_normals_checker, "Checking for Locked Normals") 


        '''
        if errors:
            for error in errors:
                self.logger.error(error)
        else:
            self.logger.info("All processes completed successfully")
        '''    

    def export_scene_with_lightmap_clicked(self):
        server_path, scale_factor, image_format = self.export_details()

        # Debug: Print the scale factor
        print("Scale factor:", scale_factor)

        if self.check_scene_on_radio_btn.isChecked():
            if int(scale_factor) == 1:
                scene_expoter_tools.to_small_scale()
                print("Checking the scene for errors")
                self.check_scene()
                scene_expoter_tools.create_lightmap_uvset()
                self.save_fbx_file(server_path, scale_factor)
                self.save_textures_to_folder(server_path, image_format = image_format, compression='ZIP' )
                scene_expoter_tools.delete_lightmap_uvset()
                scene_expoter_tools.to_real_scale()

            elif int(scale_factor) == 100:
                scene_expoter_tools.to_real_scale()
                print("Checking the scene for errors")
                self.check_scene()
                scene_expoter_tools.create_lightmap_uvset()
                self.save_fbx_file(server_path, scale_factor)
                self.save_textures_to_folder(server_path, image_format = image_format, compression='ZIP' )
                scene_expoter_tools.delete_lightmap_uvset()
                scene_expoter_tools.to_small_scale()

        elif self.check_scene_off_radio_btn.isChecked():
                
            if int(scale_factor) == 1:
                scene_expoter_tools.to_small_scale()
                scene_expoter_tools.create_lightmap_uvset()
                self.save_fbx_file(server_path, scale_factor)
                self.save_textures_to_folder(server_path, image_format = image_format, compression='ZIP' )
                scene_expoter_tools.delete_lightmap_uvset()
                scene_expoter_tools.to_real_scale()

            elif int(scale_factor) == 100:
                scene_expoter_tools.to_real_scale()
                scene_expoter_tools.create_lightmap_uvset()
                self.save_fbx_file(server_path, scale_factor)
                self.save_textures_to_folder(server_path, image_format = image_format, compression='ZIP' )
                scene_expoter_tools.delete_lightmap_uvset()
                scene_expoter_tools.to_small_scale()

        else:
            pass

    def export_scene_without_lightmap_clicked(self):
        server_path, scale_factor, image_format = self.export_details()

        if self.check_scene_on_radio_btn.isChecked():
            print("Checking the scene for errors")
            if int(scale_factor) == 1:
                scene_expoter_tools.to_small_scale()
                self.check_scene()  # Perform error checking
                self.save_fbx_file(server_path, scale_factor)
                self.save_textures_to_folder(server_path, image_format=image_format, compression='ZIP')
                scene_expoter_tools.to_real_scale()
            elif int(scale_factor) == 100:
                scene_expoter_tools.to_real_scale()
                self.check_scene()  # Perform error checking
                self.save_fbx_file(server_path, scale_factor)
                self.save_textures_to_folder(server_path, image_format=image_format, compression='ZIP')
                scene_expoter_tools.to_small_scale()

        elif self.check_scene_off_radio_btn.isChecked():
            if int(scale_factor) == 1:
                scene_expoter_tools.to_small_scale()
                self.save_fbx_file(server_path, scale_factor)
                self.save_textures_to_folder(server_path, image_format=image_format, compression='ZIP')
                scene_expoter_tools.to_real_scale()
            elif int(scale_factor) == 100:
                scene_expoter_tools.to_real_scale()
                self.save_fbx_file(server_path, scale_factor)
                self.save_textures_to_folder(server_path, image_format=image_format, compression='ZIP')
                scene_expoter_tools.to_small_scale()

        else:
            pass

    def export_all_with_lightmap_clicked(self):
        file_paths = cmds.fileDialog2(fileMode=4, fileFilter="Maya Files (*.ma *.mb)", dialogStyle=2)

        if file_paths:
            for file_path in file_paths:
                # Open the file
                cmds.file(file_path, open=True, force=True)

                server_path, scale_factor, image_format = self.export_details()

                # Debug: Print the scale factor
                print("Scale factor:", scale_factor)

                if self.check_scene_on_radio_btn.isChecked():
                    if int(scale_factor) == 1:
                        scene_expoter_tools.to_small_scale()
                        print("Checking the scene for errors")
                        self.check_scene()
                        scene_expoter_tools.create_lightmap_uvset()
                        self.save_fbx_file(server_path, scale_factor)
                        self.save_textures_to_folder(server_path, image_format = image_format, compression='ZIP' )
                        scene_expoter_tools.delete_lightmap_uvset()
                        scene_expoter_tools.to_real_scale()

                    elif int(scale_factor) == 100:
                        scene_expoter_tools.to_real_scale()
                        print("Checking the scene for errors")
                        self.check_scene()
                        scene_expoter_tools.create_lightmap_uvset()
                        self.save_fbx_file(server_path, scale_factor)
                        self.save_textures_to_folder(server_path, image_format = image_format, compression='ZIP' )
                        scene_expoter_tools.delete_lightmap_uvset()
                        scene_expoter_tools.to_small_scale()

                elif self.check_scene_off_radio_btn.isChecked():
                        
                    if int(scale_factor) == 1:
                        scene_expoter_tools.to_small_scale()
                        scene_expoter_tools.create_lightmap_uvset()
                        self.save_fbx_file(server_path, scale_factor)
                        self.save_textures_to_folder(server_path, image_format = image_format, compression='ZIP' )
                        scene_expoter_tools.delete_lightmap_uvset()
                        scene_expoter_tools.to_real_scale()

                    elif int(scale_factor) == 100:
                        scene_expoter_tools.to_real_scale()
                        scene_expoter_tools.create_lightmap_uvset()
                        self.save_fbx_file(server_path, scale_factor)
                        self.save_textures_to_folder(server_path, image_format = image_format, compression='ZIP' )
                        scene_expoter_tools.delete_lightmap_uvset()
                        scene_expoter_tools.to_small_scale()

                else:
                    pass


    def export_all_without_lightmap_clicked(self):

        file_paths = cmds.fileDialog2(fileMode=4, fileFilter="Maya Files (*.ma *.mb)", dialogStyle=2)

        if file_paths:
            for file_path in file_paths:
                # Open the file
                cmds.file(file_path, open=True, force=True)
                server_path, scale_factor, image_format = self.export_details()

                # Debug: Print the scale factor
                print("Scale factor:", scale_factor)

                if self.check_scene_on_radio_btn.isChecked():
                    if int(scale_factor) == 1:
                        scene_expoter_tools.to_small_scale()
                        print("Checking the scene for errors")
                        self.check_scene()
                        scene_expoter_tools.create_lightmap_uvset()
                        self.save_fbx_file(server_path, scale_factor)
                        self.save_textures_to_folder(server_path, image_format = image_format, compression='ZIP' )
                        scene_expoter_tools.delete_lightmap_uvset()
                        scene_expoter_tools.to_real_scale()

                    elif int(scale_factor) == 100:
                        scene_expoter_tools.to_real_scale()
                        print("Checking the scene for errors")
                        self.check_scene()
                        scene_expoter_tools.create_lightmap_uvset()
                        self.save_fbx_file(server_path, scale_factor)
                        self.save_textures_to_folder(server_path, image_format = image_format, compression='ZIP' )
                        scene_expoter_tools.delete_lightmap_uvset()
                        scene_expoter_tools.to_small_scale()

                elif self.check_scene_off_radio_btn.isChecked():
                        
                    if int(scale_factor) == 1:
                        scene_expoter_tools.to_small_scale()
                        scene_expoter_tools.create_lightmap_uvset()
                        self.save_fbx_file(server_path, scale_factor)
                        self.save_textures_to_folder(server_path, image_format = image_format, compression='ZIP' )
                        scene_expoter_tools.delete_lightmap_uvset()
                        scene_expoter_tools.to_real_scale()

                    elif int(scale_factor) == 100:
                        scene_expoter_tools.to_real_scale()
                        scene_expoter_tools.create_lightmap_uvset()
                        self.save_fbx_file(server_path, scale_factor)
                        self.save_textures_to_folder(server_path, image_format = image_format, compression='ZIP' )
                        scene_expoter_tools.delete_lightmap_uvset()
                        scene_expoter_tools.to_small_scale()

                else:
                    pass

    def select_all_obj(self):
        cmds.select(clear=True)
        all_objects = cmds.ls(dag=True, long=True)
        cameras = cmds.ls(type='camera', long=True)
        lights = cmds.ls(type='light', long=True)
        

        cameras_lights = set()
        for camera in cameras:
            transforms = cmds.listRelatives(camera, parent=True, fullPath=True) or []
            cameras_lights.update(transforms)
            cameras_lights.add(camera)
        
        for light in lights:
            transforms = cmds.listRelatives(light, parent=True, fullPath=True) or []
            cameras_lights.update(transforms)
            cameras_lights.add(light)
        
        objects_to_select = [obj for obj in all_objects if obj not in cameras_lights]
        
        if objects_to_select:
            cmds.select(objects_to_select)
        else:
            print("No objects found to select.")

    #Checker segment Start
    def remove_namespaces(self):
        try:
            scene_expoter_tools.remove_namespaces()
            #self.logger.info("Removing namespaces... -> DONE")
        except Exception as e:
            pass
            #self.logger.error("Failed to remove unwanted namespaces.")
        #self.show_log_window()

    def delete_empty_uv_sets(self):
        try:
            scene_expoter_tools.clean_up_uvsets()
            scene_expoter_tools.uv_set_name_check()
            #self.logger.info("Removing double UV sets... -> DONE")
            #self.logger.info("Checking the UVset name... -> DONE")
        except Exception as e:
            pass
            #self.logger.error("There are no double UV sets.")
        #self.show_log_window()

    def model_cleanup(self):
        try:
            scene_expoter_tools.model_cleanup()
            #self.logger.info("Removing model history... -> DONE")
        except Exception as e:
            pass
            #self.logger.error("Failed to remove model history.")
        #self.show_log_window()

    def correct_material_and_textures(self):
        try:
            scene_expoter_tools.material_rename()
            #self.logger.info("Correcting material and textures names... -> DONE")
        except Exception as e:
            pass
            #self.logger.error("Nothing to correct here. Skipping forward.")
        #self.show_log_window()
    
    def correct_texture_path(self):
        try:
            scene_expoter_tools.update_texture_paths()
        except Exception as e:
            pass
            #self.logger.error("Nothing to correct here. Skipping forward.")
        #self.show_log_window()

    def correct_shader_assignment(self):
        try:
            scene_expoter_tools.correct_shader_assignment()
        except Exception as e:
            pass
            #self.logger.error("Nothing to correct here. Skipping forward.")
        #self.show_log_window()

    def scene_optimization(self):
        try:
            scene_expoter_tools.scene_optimization()

            #self.logger.info("Removing unused materials... -> DONE")
        except Exception as e:
            pass
            #self.logger.error("Failed to remove unused materials.")
        #self.show_log_window()

    def duplicate_polygon_checker(self):
        try:
            scene_expoter_tools.duplicate_polygon_checker()
            #self.logger.info("Removing duplicate polygons... -> DONE")
        except Exception as e:
            pass
            #self.logger.error("Failed to remove duplicate polygons.")
        #self.show_log_window()
    
    def freeze_transforms_checker(self):
        try:
            scene_expoter_tools.check_transforms()
            #self.logger.info("Cleaning up transforms... -> DONE")
        except Exception as e:
            pass
            #self.logger.error("No transforms to clean")
        #self.show_log_window()

    def delete_empty_nodes_checker(self):
        try:
            scene_expoter_tools.delete_empty_transforms()
            #self.logger.info("Deleting empty nodes... -> DONE")
        except Exception as e:
            pass
            #self.logger.error("No empty nodes found")
        #self.show_log_window()

    def locked_normals_checker(self):
        try:
            scene_expoter_tools.locked_normals_check()
            #self.logger.info("Corrected locked normals... -> DONE")
        except Exception as e:
            pass
            #self.logger.error("No locked normals")
        #self.show_log_window()
    #Checker segment End

class model_exporter_add_projectUI(QtWidgets.QDialog):
    def __init__(self, parent=None):
        super(model_exporter_add_projectUI, self).__init__(parent)
        self.setup_ui()
        self.setWindowFlags(QtCore.Qt.Tool)

    def setup_ui(self):
        self.setWindowTitle("WH Model Exporter 1.0 | Add Project Settings")
        self.setObjectName("WHModelExporterAddProjectID")
        self.setMinimumSize(500, 170)
        self.setMaximumSize(500, 170)
        self.resize(500, 170)

        self.main_layout = QtWidgets.QVBoxLayout()
        self.main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.main_layout.setContentsMargins(5, 5, 5, 5)
        self.main_layout.setSpacing(5)
        self.setLayout(self.main_layout)

        # Set Project Name
        self.set_project_name_layout = QtWidgets.QHBoxLayout()
        self.set_project_name_layout.setAlignment(QtCore.Qt.AlignTop)
        self.set_project_name_layout.setContentsMargins(2, 2, 2, 2)
        self.set_project_name_layout.setSpacing(2)
        self.main_layout.addLayout(self.set_project_name_layout)

        self.set_project_name_field = QtWidgets.QLineEdit()
        self.set_project_name_layout.addWidget(self.set_project_name_field)
        self.set_project_name_field.setPlaceholderText("Enter Project Name")

        # Set Local Project Layout
        self.set_local_proj_path_layout = QtWidgets.QHBoxLayout()
        self.set_local_proj_path_layout.setAlignment(QtCore.Qt.AlignTop)
        self.set_local_proj_path_layout.setContentsMargins(2, 2, 2, 2)
        self.set_local_proj_path_layout.setSpacing(2)
        self.main_layout.addLayout(self.set_local_proj_path_layout)

        self.local_path_field = QtWidgets.QLineEdit()
        self.set_local_proj_path_layout.addWidget(self.local_path_field)
        self.local_path_field.setPlaceholderText("Set Local Project Path")

        self.set_local_proj_path_btn = QtWidgets.QPushButton("Select Local Project Path")
        self.set_local_proj_path_btn.clicked.connect(self.set_local_proj_path_clicked)
        self.set_local_proj_path_btn.setFixedSize(145, 20)
        self.set_local_proj_path_layout.addWidget(self.set_local_proj_path_btn)

        # Set Server Project Layout
        self.set_server_project_layout = QtWidgets.QHBoxLayout()
        self.set_server_project_layout.setAlignment(QtCore.Qt.AlignTop)
        self.set_server_project_layout.setContentsMargins(2, 2, 2, 2)
        self.set_server_project_layout.setSpacing(2)
        self.main_layout.addLayout(self.set_server_project_layout)

        self.server_path_field = QtWidgets.QLineEdit()
        self.set_server_project_layout.addWidget(self.server_path_field)
        self.server_path_field.setPlaceholderText("Set Server Project Path")

        self.set_server_proj_path_btn = QtWidgets.QPushButton("Select Server Project Path")
        self.set_server_proj_path_btn.clicked.connect(self.set_server_proj_path_clicked)
        self.set_server_proj_path_btn.setFixedSize(145, 20)
        self.set_server_project_layout.addWidget(self.set_server_proj_path_btn)

        # Project Settings Layout
        self.proj_settings_layout = QtWidgets.QVBoxLayout()
        self.proj_settings_layout.setAlignment(QtCore.Qt.AlignTop)
        self.proj_settings_layout.setContentsMargins(2, 2, 2, 2)
        self.proj_settings_layout.setSpacing(2)
        self.main_layout.addLayout(self.proj_settings_layout)

        self.proj_set_label = QtWidgets.QLabel(self)
        self.proj_set_label.setText('Project Settings:')
        self.proj_settings_layout.addWidget(self.proj_set_label)
        
        # Set Project Scale Factor
        self.proj_settings_main_layout = QtWidgets.QHBoxLayout()
        self.proj_settings_main_layout.setAlignment(QtCore.Qt.AlignTop)
        self.proj_settings_main_layout.setContentsMargins(2, 2, 2, 2)
        self.proj_settings_main_layout.setSpacing(2)
        self.proj_settings_layout.addLayout(self.proj_settings_main_layout)

        self.set_scale_factor_layout = QtWidgets.QHBoxLayout()
        self.set_scale_factor_layout.setAlignment(QtCore.Qt.AlignLeft)  # Align left to place side by side
        self.set_scale_factor_layout.setContentsMargins(2, 2, 2, 2)
        self.set_scale_factor_layout.setSpacing(2)
        self.proj_settings_main_layout.addLayout(self.set_scale_factor_layout)

        self.set_scale_label = QtWidgets.QLabel(self)
        self.set_scale_label.setText('Scale Factor:')
        self.set_scale_factor_layout.addWidget(self.set_scale_label)
        
        self.set_scale_field = QtWidgets.QLineEdit()
        self.set_scale_field.setFixedSize(125, 20)  # Already fixed size, ensures it doesn't expand
        self.set_scale_factor_layout.addWidget(self.set_scale_field)
        self.set_scale_field.setPlaceholderText("Set Scale Factor Here")

        # Add validator to ensure only numbers are entered (use QDoubleValidator for floating point numbers)
        self.set_scale_field.setValidator(QDoubleValidator(1.0, 100.0, 0))

        # Add a custom input validator for scale factor
        self.set_scale_field.textChanged.connect(self.check_scale_factor_input)

        # Set Image format 

        self.image_format_set_layout = QtWidgets.QHBoxLayout()
        self.image_format_set_layout.setAlignment(QtCore.Qt.AlignLeft)  # Align left to place side by side
        self.image_format_set_layout.setContentsMargins(2, 2, 2, 2)
        self.image_format_set_layout.setSpacing(2)
        self.proj_settings_main_layout.addLayout(self.image_format_set_layout)

        self.set_image_format_label = QtWidgets.QLabel(self)
        self.set_image_format_label.setText('Set Texture export Format:')
        self.image_format_set_layout.addWidget(self.set_image_format_label)

        # Add drop-down menu to select image formats
        self.set_image_format_menu = QtWidgets.QComboBox()
        image_formats = ["Choose File Format", "TIFF", "TGA", "PSD", "PNG", "DDS"]

        # Add items to the combo box
        self.set_image_format_menu.addItems(image_formats)

        # Set the hint as the default selected item
        self.set_image_format_menu.setCurrentIndex(0)

        # Add the combo box to the layout
        self.image_format_set_layout.addWidget(self.set_image_format_menu)

        # Set project details to JSON file
        self.record_project_data_btn = QtWidgets.QPushButton("Add Project")
        self.record_project_data_btn.clicked.connect(self.record_project_data_clicked)
        self.main_layout.addWidget(self.record_project_data_btn)

    def check_scale_factor_input(self):
        """Check if the entered scale factor is either 1 or 100."""
        text = self.set_scale_field.text()
        if text not in ("1", "100"):
            self.set_scale_field.setStyleSheet("border: 1px solid red;")
        else:
            self.set_scale_field.setStyleSheet("")

    def set_local_proj_path_clicked(self):
        # Open folder dialog to select a directory
        selected_dir = cmds.fileDialog2(fileMode=3, dialogStyle=2, caption="Select Local Project Path")

        if selected_dir:
            # Update the line edit field with the selected directory
            self.local_path_field.setText(selected_dir[0])

    def set_server_proj_path_clicked(self):
        # Open folder dialog to select a directory
        selected_dir = cmds.fileDialog2(fileMode=3, dialogStyle=2, caption="Select Server Project Path")

        if selected_dir:
            # Update the line edit field with the selected directory
            self.server_path_field.setText(selected_dir[0])

    def record_project_data_clicked(self, *args):
        # Gather data from UI
        project_name = self.set_project_name_field.text()
        local_path = self.local_path_field.text()
        server_path = self.server_path_field.text()
        scale_factor = self.set_scale_field.text()
        image_format = self.set_image_format_menu.currentText()

        # Check if the scale factor is valid (either 1 or 100)
        if scale_factor not in ("1", "100"):
            QtWidgets.QMessageBox.warning(self, "Input Error", "Scale Factor must be either 1 or 100.")
            return

        # Check if all required fields are filled
        if not project_name or not local_path or not server_path:
            QtWidgets.QMessageBox.warning(self, "Input Error", "Please fill in all required fields.")
            return

        # Prepare the data to save
        project_data = {
            "project_name": project_name,
            "local_path": local_path,
            "server_path": server_path,
            "scale_factor": scale_factor,
            "image_format": image_format
        }

        # Path to the JSON file
        json_file_path = os.path.join(os.getenv("MAYA_APP_DIR"), 'scripts', 'WH_Model_To_Project_Exporter', 'project_list.JSON')

        # Read existing data and write the updated data back to the JSON file
        try:
            if os.path.exists(json_file_path):
                with open(json_file_path, 'r') as file:
                    data = json.load(file)
            else:
                data = {}

            # Update the data with the new project
            data[project_name] = project_data

            # Write updated data back to the JSON file
            with open(json_file_path, 'w') as file:
                json.dump(data, file, indent=4)

            QtWidgets.QMessageBox.information(self, "Success", "Project added successfully!")
            self.close()
        except IOError as e:
            QtWidgets.QMessageBox.critical(self, "File Error", "Error saving project data: %s" % e)

def main():
    if cmds.window("WHModelExporterID", exists=True):
        cmds.deleteUI("WHModelExporterID", window=True)

    if cmds.windowPref("WHModelExporterID", exists=True):
        cmds.windowPref("WHModelExporterID", remove=True)

    global myUI
    myUI = model_exporter_UI()
    myUI.show()

main()
