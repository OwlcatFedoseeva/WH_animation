# _logic/clean_unwanted_anim_logic.py
import os
import json
import maya.cmds as cmds
import maya.mel as mel

class CleanAnimLogic:
    def __init__(self, path_to_json, new_directory, preset_path):
        # Определяем путь до корня проекта и временного файла
        logic_dir = os.path.dirname(os.path.abspath(__file__))
        self.project_root = os.path.abspath(os.path.join(logic_dir, '..'))
        self.temp_dir = os.path.join(self.project_root, 'temp')
        self.joints_json_path = os.path.join(self.temp_dir, 'joints_set.json')

        self.path_to_json = path_to_json
        self.new_directory = new_directory
        self.preset_path = preset_path
        self.files = []
        
        # Создаём temp-папку при необходимости
        os.makedirs(self.temp_dir, exist_ok=True)

    def new_scene(self):
        cmds.file(new=True, force=True)

    def get_current_file_name(self):
        current_file = cmds.file(q=True, sceneName=True)
        return os.path.basename(current_file) if current_file else ""

    def set_selection(self):
        return cmds.ls(sl=True, fl=True, type=['joint', 'transform'])

    def save_selection_to_json(self, selected_objects):
        with open(self.joints_json_path, 'w') as f:
            json.dump(selected_objects, f, indent=4)

    def load_selection_from_json(self):
        with open(self.joints_json_path, 'r') as f:
            return json.load(f)

    def folder_file_sort(self, folder_path):
        self.files.clear()
        for i in os.listdir(folder_path):
            if i.lower().endswith(".fbx"):
                self.files.append(os.path.join(folder_path, i))

    def cut_animation_keys(self, obj, attributes):
        start_frame = cmds.playbackOptions(q=True, min=True)
        end_frame = cmds.playbackOptions(q=True, max=True)
        if cmds.objExists(obj):
            for attr in attributes:
                cmds.cutKey(obj, time=(start_frame, end_frame), attribute=attr, option="keys", cl=True)

    def clean_joints(self, attributes):
        for obj in self.load_selection_from_json():
            if cmds.objExists(obj):
                self.cut_animation_keys(obj, attributes)

    def create_directory(self, path):
        os.makedirs(path, exist_ok=True)
        return path

    def export_fbx(self, save_to_origin, original_dir=None):
        file_name = self.get_current_file_name().split('.')[0]
        if save_to_origin:
            export_dir = original_dir
        else:
            export_dir = self.create_directory(self.new_directory)

        cmds.loadPlugin("fbxmaya", quiet=True)
        cmds.select('ParentForExportDelete', hierarchy=True)
        export_path = os.path.join(export_dir, file_name + '.fbx')
        mel.eval(f'FBXLoadExportPresetFile -f "{self.preset_path}"')
        mel.eval(f'FBXExport -s -f "{export_path}" -force -options')
        print("Exported:", export_path)

    def batch_process(self, folder_path, save_to_origin):
        self.new_scene()
        self.folder_file_sort(folder_path)
        for f in self.files:
            cmds.file(f, open=True, type='FBX', force=True)
            self.clean_joints(self.get_selected_attributes())
            self.export_fbx(save_to_origin, original_dir=os.path.dirname(f))
        cmds.confirmDialog(title='Done', message='Batch Process Complete', button=['OK'])

    def get_selected_attributes(self, translate=True, rotate=True, scale=True):
        attrs = []
        if translate:
            attrs += ['translateX', 'translateY', 'translateZ']
        if rotate:
            attrs += ['rotateX', 'rotateY', 'rotateZ']
        if scale:
            attrs += ['scaleX', 'scaleY', 'scaleZ']
        return attrs
