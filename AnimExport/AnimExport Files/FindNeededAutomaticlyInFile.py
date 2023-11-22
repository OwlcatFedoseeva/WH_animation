

import maya.cmds as cmds
import maya.mel as mel



import WorkingInFile as File
reload(File)


def AllJointsUnderParent(parentName):
    
    parent = ""
    
    parents = cmds.ls("*%s" % parentName)
    if len(parents) > 1:
        cmds.confirmDialog( title='Errors', message=("More then one " + parentName + "founded in rig!"), button=['OK'])
        return False
    elif len(parents) == 1:
        parent = parents[0]
    else:
        parents = cmds.ls("*:%s" % parentName)
        if len(parents) > 1:
            cmds.confirmDialog( title='Errors', message=("More then one " + parentName + "founded in rig!"), button=['OK'])
            return False
        elif not parents:
            cmds.confirmDialog( title='Errors', message=("No any one " + parentName + "founded in rig!"), button=['OK'])
            return False
        else:
            parent = parents[0]

    File.fatherJoints = cmds.listRelatives(parent, children=True)

    cmds.select(File.fatherJoints, hierarchy=True)
    File.allJoints = cmds.ls(sl=True)

    return True 






def SkinnedMeshesFromAllJoints(): 

    global allSkinedMeshes
    allSkinedMeshes = []

    mel.eval("select -r `listTransforms -geometry`;")
    meshes = cmds.ls(sl=True)
    for m in meshes:  
        mesh = cmds.pickWalk(m, direction="down")
        if cmds.objectType(mesh[0]) == "mesh":
            try:
                skinClus = mel.eval('findRelatedSkinCluster '+mesh[0])
            except:
                continue
            if skinClus != "":
                joints = cmds.skinCluster (skinClus, q=1, weightedInfluence=True)
                if joints:
                    founded = False
                    for j in joints:
                        if j in File.allJoints:
                            founded = True
                            break
                    if founded:
                        File.allSkinedMeshes.append(m)    

    if not File.allSkinedMeshes:
        cmds.confirmDialog( title='Errors', message=("No any skin meshes in rig file!"), button=['OK'])
        return False
    return True
    
    