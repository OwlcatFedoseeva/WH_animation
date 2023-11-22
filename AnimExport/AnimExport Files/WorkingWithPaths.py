
import os
import maya.cmds as cmds

mayaPath = ""
fbxPath = ""
mayaPathRig = ""
fbxPathRig = ""
mayaPathCurrent = ""
fbxPathCurrent = ""

fbxPathAnimations = ""
mayaPathAnimations = ""
mayaPathsAnimation = []













def GetMayaAndFbxRigPath(rootMayaPath, rootFbxPath):
    global mayaPathRig
    global fbxPathRig
    
    files = [f for f in os.listdir(mayaPath) if os.path.isfile(os.path.join(mayaPath, f))]

    founded = False
    for f in files:
    
        if f.find("_RIG.ma") == len(f) - 7 or f.find("_RIG.mb") == len(f) - 7:
            if not founded:
                mayaPathRig = mayaPath + f
                founded = True
            else:
                cmds.confirmDialog( title='Errors', message="More then one rig file founded!", button=['OK'])
                return False      
    if not founded:
        cmds.confirmDialog( title='Errors', message="Rig file not founded!\nIt must ended with \"_RIG\"", button=['OK'])
        return False
        
    try:
        fbxPathRig = mayaPathRig.replace(rootMayaPath, rootFbxPath)
        fbxPathRig = fbxPathRig[0:len(fbxPathRig)-3]
    except:
        cmds.confirmDialog( title='Errors', message="Fbx path rig not from choosen path!", button=['OK'])
        return False
       
    return True       
    
    




def OpenFile(path):
    cmds.file(path, open=True, force=True)
    




def GetMayaAnimationPaths():

    global mayaPathsAnimation
    mayaPathsAnimation = []
    files = [f for f in os.listdir(mayaPathAnimations) if os.path.isfile(os.path.join(mayaPathAnimations, f))]

    for f in files:
        if f.find(".ma") == len(f) - 3 or f.find(".mb") == len(f) - 3:
            mayaPathsAnimation.append(mayaPathAnimations+f)

    


def GetAndBuildMayaAndFbxPaths(rootMayaPath, rootFbxPath):
    global mayaPath
    global mayaPathAnimations

    if not GetCurrentFileMayaAndFbxPaths(rootMayaPath, rootFbxPath): return False

    lastSlash = mayaPathCurrent.rindex("/")
        
    path = mayaPathCurrent[0:lastSlash+1]

    if path.find("/Animation/") == len(path) - 12:
        mayaPath = path[0:len(path) - 11]
        mayaPathAnimations = path
    else:
        if os.path.isdir(path + "Animation"):
            mayaPath = path
            mayaPathAnimations = path + "Animation/"
        else:
            cmds.confirmDialog( title='Errors', message="Can not find folder \"Animation\"!", button=['OK'])
            return False

    global fbxPath
    global fbxPathAnimations
    try:
        fbxPath = mayaPath.replace(rootMayaPath, rootFbxPath)
        fbxPathAnimations = mayaPathAnimations.replace(rootMayaPath, rootFbxPath)
    except:
        cmds.confirmDialog( title='Errors', message="Current maya file not from choosen path!", button=['OK'])
        return False

    if not os.path.isdir(fbxPathAnimations):
        os.makedirs(fbxPathAnimations)
        
    return True


def GetCurrentFileMayaAndFbxPaths(rootMayaPath, rootFbxPath):
    global mayaPathCurrent
    mayaPathCurrent = cmds.file( q=True, sceneName=True)
    if not mayaPathCurrent:
        cmds.confirmDialog( title='Errors', message="You must open any of maya file, of character you want to export", button=['OK'])
        return False
    global fbxPathCurrent
    try:
        fbxPathCurrent = mayaPathCurrent.replace(rootMayaPath, rootFbxPath)
        fbxPathCurrent = fbxPathCurrent[0:len(fbxPathCurrent)-3]
        return True
    except:
        cmds.confirmDialog( title='Errors', message="Current maya file not from choosen path!", button=['OK'])
        return False
    
    
    
    

    