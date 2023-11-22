import maya.cmds as cmds
import maya.standalone
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


standalone.initialize()


for f in files:
    load_fbx_export_preset(presetPathName)
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

