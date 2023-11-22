
import maya.cmds as cmds


def JointsParentsAndMeshes():
    allSelected = cmds.ls(sl=True)
    
    global fatherJoints
    fatherJoints = []
    global allSkinedMeshes
    allSkinedMeshes = []
    
    if not allSelected:
        cmds.confirmDialog( title='Errors', message="You must select all parents of joints hierarchys and skined meshes!", button=['OK'])
        return False
    
    for o in allSelected:
        if cmds.objectType(o) == "transform" and cmds.objectType(cmds.pickWalk(o, direction = "down")) == "mesh":
            allSkinedMeshes.append(o)
        else:
            fatherJoints.append(o)
        
    if not allSkinedMeshes or not fatherJoints:
        cmds.confirmDialog( title='Errors', message="You must select all parents of joints hierarchys and skined meshes!", button=['OK'])
        return False

    cmds.select(fatherJoints, hierarchy=True)
    global allJoints
    allJoints = cmds.ls(sl=True)
    
    return True


def JointsParents():
    global fatherJoints
    fatherJoints = cmds.ls(sl=True)
    if not fatherJoints:
        cmds.confirmDialog( title='Errors', message="You must select parents of joints hierarchys!", button=['OK'])
        return False
        
    cmds.select(fatherJoints, hierarchy=True)
    global allJoints
    allJoints = cmds.ls(sl=True)
    return True

