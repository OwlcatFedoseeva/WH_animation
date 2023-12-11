from maya import cmds
import os
from pymel.core import mel

USERAPPDIR = cmds.internalVar(userAppDir=True)
PRESET_DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'WH_CHanimExport')

presetPathName = PRESET_DIRECTORY + "/UMA_Male_Rig_AnimationExport.fbxexportpreset"



filePathName = cmds.file(query=True, sceneName=True)
fileName = filePathName.split('/')[-1]
newFileName = fileName.split('.')[0]
DIRECTORY = os.path.dirname(filePathName)

newDIRECTORY = os.path.join(DIRECTORY, 'AnimationExport')


def createDirectory(directory=newDIRECTORY):
    """

    Creates a given Directory if it doesn't exist
    Args:
        directory(str):The directory to create
    """
    if not os.path.exists(directory):
        os.mkdir(directory)
    return createDirectory

def imprtRef():
    all_ref_paths = cmds.file(q=True, reference=True) or []
    for ref_path in all_ref_paths:
        if cmds.referenceQuery(ref_path, isLoaded=True):
            cmds.file(ref_path, importReference=True)

            new_ref_paths = cmds.file(q=True, reference=True)
            if new_ref_paths:
                for new_ref_path in new_ref_paths:
                    if new_ref_path not in all_ref_paths:
                        all_ref_paths.append(new_ref_path)

def remove_namespaces():
    all_namespaces = [x for x in cmds.namespaceInfo(listOnlyNamespaces=True, recurse=True) if
                      x != "UI" and x != "shared"]
    if all_namespaces:
        all_namespaces.sort(key=len, reverse=True)
        for namespace in all_namespaces:
            if cmds.namespace(exists=namespace) is True:
                cmds.namespace(removeNamespace=namespace, mergeNamespaceWithRoot=True)
    print("Namespaces removed successfully!")


def cleanUp():


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
		
	return cleanUp

def fbxExp():
    cmds.loadPlugin("fbxmaya")
    mel.FBXLoadExportPresetFile(f=presetPathName)

    cmds.select('Pelvis')
    sel = cmds.listRelatives('Pelvis', c=True, ad=True)


    cmds.select('ParentForExportDelete', hierarchy=True)

    cmds.select('ParentForExportDelete', hierarchy=True)
    nameExport = newDIRECTORY + '/' + newFileName + '.fbx'
    mel.FBXExport(s=True, f=nameExport, force=True, options=True)

    return fbxExp


def runProcess():
    imprtRef()
    remove_namespaces()

    jnts = []
    bake_transl_jnts = [u'Pelvis', u'R_Sceart_____Front_00', u'R_Sceart_____Front_00|R_Sceart_Front_01', u'R_Sceart_____Front_00|R_Sceart_Front_01|R_Sceart_Font_02', u'R_Sceart_Font_02_ADJ', u'R_Sceart_Front_01_ADJ', u'R_Sceart_____Back_00', u'R_Sceart_____Back_00|R_Sceart_Back_01', u'R_Sceart_____Back_00|R_Sceart_Back_01|R_Sceart_Back_02', u'R_Sceart_Back_02_ADJ', u'R_Sceart_Back_01_ADJ', u'L_Sceart_____Back_00', u'L_Sceart_____Back_00|L_Sceart_Back_01', u'L_Sceart_____Back_00|L_Sceart_Back_01|L_Sceart_Back_02', u'L_Sceart_Back_02_ADJ', u'L_Sceart_Back_01_ADJ', u'L_Sceart_____Front_00', u'L_Sceart_____Front_00|L_Sceart_Front_01', u'L_Sceart_____Front_00|L_Sceart_Front_01|L_Sceart_Font_02', u'L_Sceart_Font_02_ADJ', u'L_Sceart_Front_01_ADJ', u'R_WeaponBone', u'L_WeaponBone',u'Face_Scale', u'L_eyelish_top', u'L_eyelish_top_end', u'L_eye', u'L_eye_end', u'L_eye_orientConstraint1', u'L_eyelish_bottom', u'L_eyelish_bottom_end', u'R_eyebrow', u'R_eyebrow_parentConstraint1', u'L_eyebrow', u'L_eyebrow_parentConstraint1', u'R_eyelish_bottom', u'R_eyelish_bottom_end', u'R_eye', u'R_eye_end', u'R_eye_orientConstraint1', u'R_eyelish_top', u'R_eyelish_top_end']


    cons = []

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

    print("Selected Joints:", jnts)
    print("Selected Constraints:", cons)

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

    cleanUp()
    createDirectory()
    fbxExp()

		






