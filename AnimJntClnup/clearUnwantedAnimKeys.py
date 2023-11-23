import maya.cmds as cmds
import os
import maya.mel as mel

PRESET = "C:/Users/Valeriya/Documents/maya/scripts/CHanimExport/UMA_Male_Rig_AnimationExport.fbxexportpreset"

filePathName = cmds.file(query=True, sceneName=True)

USERAPPDIR = cmds.internalVar(userAppDir=True)
newDIRECTORY = os.path.join(USERAPPDIR, 'AnimationExport')

files = []

def new_scene_maya():
    cmds.file(new=True, force=True)

def file_path():
    work_path = cmds.fileDialog2(dialogStyle=2, fileMode=3)
    if work_path:
        selected_folder_path = work_path[0]
        print('Work folder:' + selected_folder_path)
        return selected_folder_path
    return None

def folder_file_sort(folder_path):
    if not os.path.isdir(folder_path):
        raise ValueError("Folder is not valid")

    for i in os.listdir(folder_path):
        file_name, file_ext = os.path.splitext(i)
        
        if file_ext == ".fbx":
            full_path = os.path.join(folder_path, i)
            files.append(full_path)
    
    print(files)

def get_current_file_name():
    current_file = cmds.file(q=True, sceneName=True)
    file_name = ""
    if current_file:
        file_name = os.path.basename(current_file)
        print("Currently opened file:", file_name)
    else:
        print("No file is currently opened.")

    return file_name


def jnt_clean_up():
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

def createDirectory(directory):
    """
    Creates a given Directory if it doesn't exist
    Args:
        directory(str): The directory to create
    Returns:
        str: The created or existing directory path
    """
    if not os.path.exists(directory):
        os.mkdir(directory)
    return directory

def fbxExp():
    dir = createDirectory(directory=newDIRECTORY)
    newFileName = get_current_file_name().split('.')[0]

    if dir:
        cmds.loadPlugin("fbxmaya")  # Load the fbxmaya plugin
        cmds.select('ParentForExportDelete', hierarchy=True)
        nameExport = dir + '/' + newFileName + '.fbx'
        mel.eval('FBXExport -s -f "{}" -force -options'.format(nameExport))
        print("FBX Exported:", nameExport)
    else:
        print("Error creating directory.")
        

def process():
    folder_path = file_path()
    if folder_path:
        new_scene_maya()
        folder_file_sort(folder_path)

        for f in files:
            cmds.file(f, open=True, type='FBX', force=True)
            jnt_clean_up()
            fbxExp()

process()
