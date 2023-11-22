

import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pymel

fatherJoints = []
allJoints =  []
allSkinedMeshes = []
deleteParent = None
startTime = 0.0
endTime = 0.0
constraints = []

attributes = ['tx', 'ty', 'tz', 'rx', 'ry', 'rz', 'sx', 'sy', 'sz']


fbxPath = ""

def ReadTime():
    global startTime
    global endTime
    startTime = cmds.playbackOptions( query=True,minTime=True )
    endTime = cmds.playbackOptions( query=True,maxTime=True ) 


def GetPathFbx():
    cmds.fileBrowserDialog( mode=4, fileCommand=ChoosePathFbx, an='choose path')
    curFile = cmds.file(query=True, sceneName=True)
    name = curFile[(curFile.rfind("/")+1):(curFile.rfind("."))]
    if fbxPath != "":
        fbxPathName = fbxPath + name + ".fbx"
    else:
        fbxPathName = ""
    return fbxPathName
    

def ReadConstraints():
    global constraints
    constraints = []
    for j in allJoints:
        curConstraints = cmds.parentConstraint(j, query=True, targetList=True)
        constraints.append(curConstraints)
      
    
def ChoosePathFbx(fileName, fileType):
    global fbxPath
    if fileName: 
        fbxPath = fileName + "/"
    else:
        fbxPath = ""
        
        
def BakeKeys(startTime, endTime):
    cmds.bakeResults(allJoints, simulation=True, t=(startTime ,endTime), disableImplicitControl=True, preserveOutsideKeys=True, removeBakedAttributeFromLayer=True, bakeOnOverrideLayer=False, minimizeRotation=True, controlPoints=True, removeBakedAnimFromLayer=False)
     
     
def DeleteStaticChannels():
    cmds.delete(allJoints, staticChannels=True, unitlessAnimationCurves=False)


def OneKeyForEachAttribute():
    cmds.currentTime(startTime)
    for j in allJoints:
        for a in attributes:
            cmds.setKeyframe( j, attribute = a)


def ImportReferenceFile():
    refs = cmds.ls(type='reference')
    cannot=0
    for r in refs:
        try:
            ref = cmds.referenceQuery(r, filename=True)
            cmds.file(ref, importReference=True)
        except:
            cannot += 1	
    if cannot == len(refs):
        cmds.confirmDialog( title='Warning', message="Have no ref file!", button=['OK'])


def CreateRoot(rootName):
    rootJoint = cmds.joint(None, position=[0,0,0], name=rootName) 
    for j in fatherJoints:
        cmds.parent(j, rootJoint) 
    global allJoints    
    allJoints.append(rootJoint)


def CleanNameSpace(objs):
    cmds.select(objs)
    for j in objs:
        if j.find(":") != -1:
            newName = j[(j.find(":")+1):len(j)]
            cmds.rename(j, newName)      
    objs = cmds.ls(sl=True)
    return objs
    

def DeleteConstraints():
    for c in constraints:
        if c:
            try:
                cmds.delete(c)
            except:
                pass
        
        
def DeleteGeometry(exceptThese = []):   
    mel.eval("select -r `listTransforms -geometry`;")
    meshes = cmds.ls(sl=True)

    for m in meshes:
        try:
            if cmds.objectType(m) != "mesh":
                if m not in exceptThese:
                    cmds.delete(m)
            else:    
                meshTransform = cmds.pickWalk(direction="up")
                if meshTransform not in exceptThese: 
                    cmds.delete(meshTransform)
        except:
            pass

def KeysSpline():
    cmds.keyTangent (allJoints, inTangentType="spline", outTangentType="spline")
    
    
def CutAllKeys():
    for j in allJoints:
        # konchenaya mayka obnuliaet vse attributi inogda u nekotorih, i daje nevsegda u odnih i teh je ahahahahahahaha
        tx = cmds.getAttr(j + ".tx")
        ty = cmds.getAttr(j + ".ty")
        tz = cmds.getAttr(j + ".tz")
        sx = cmds.getAttr(j + ".sx")
        sy = cmds.getAttr(j + ".sy")
        sz = cmds.getAttr(j + ".sz")
        cmds.cutKey(j)
        cmds.setAttr((j + ".tx"), tx)
        cmds.setAttr((j + ".ty"), ty)
        cmds.setAttr((j + ".tz"), tz)
        cmds.setAttr((j + ".sx"), sx)
        cmds.setAttr((j + ".sy"), sy)
        cmds.setAttr((j + ".sz"), sz)


def CleanOther():
    for j in allJoints:
        if cmds.attributeQuery ("drawStyle", node = j, exists = True):
            cmds.setAttr((j + ".drawStyle"), 0)
        
        cmds.cutKey(j, attribute='v', option="keys" )        
        cmds.setAttr((j + ".v"), 1)     
        
   

         
def ExportFBX(presetPath, path):
    cmds.loadPlugin("fbxmaya")
    pymel.mel.FBXLoadExportPresetFile(f=presetPath)
    pymel.mel.FBXExport(s=True, f=path,force=True)


def Select(list):
    cmds.select(list)
    
    
def ChangeStartEndTime(startTime, endTime):    
    cmds.playbackOptions(animationStartTime = startTime, animationEndTime = endTime)


