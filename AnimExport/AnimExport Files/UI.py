
import sys
sys.dont_write_bytecode = True
import maya.cmds as cmds
import os

import Export
reload(Export)


windowName = "AnimExport"
widthWindow = 250
heightWindow = 395
heightFrameLayoutExportFiles = 160
heightFrameLayoutExportSelected = 50
heightFrameLayoutPaths = 110
frameLayout_ExportFiles = None
frameLayout_ExportSelected = None
frameLayout_Paths = None
textField_PathToMayaFiles = None
textField_PathToFbxFiles = None
left = 2
right = 98
colorUI = [.22,.22,.22]

mayaPath = ""
fbxPath = ""
curPath = ""
presetPath = ""



def WindowCreate():
    if cmds.window(windowName, exists=True):
        cmds.deleteUI(windowName)

    cmds.window(windowName, title=windowName, iconName='A', widthHeight=(widthWindow, heightWindow))

    cmds.columnLayout(adjustableColumn=True)

    Form_ExportFiles()
    Form_Paths()
    Form_ExportSelected()
        
    cmds.showWindow()
    ReadCurPath()
    ReadDataFromFile()
    ExpandOrColapseFrameLayout()
    
    
    
def ReadCurPath():
    global curPath
    curPath = ""
    for p in sys.path:
        if p.find( "/AnimExport Files/") != -1:
            curPath = p
            break
            
    global presetPath        
    presetPath = curPath + "AnimExportFBXpreset.fbxexportpreset"

    
    
def Form_ExportFiles():
    global frameLayout_ExportFiles
    frameLayout_ExportFiles = cmds.frameLayout(label='Export files', labelAlign='top', borderVisible=False, collapsable=True, collapse=False, collapseCommand=ExpandOrColapseFrameLayout, expandCommand=ExpandOrColapseFrameLayout, backgroundColor = colorUI)
    form_ExportFiles = cmds.formLayout(numberOfDivisions=100)

    button_ExportWholeCharacter = cmds.button(label="Export whole character", command=ExportWholeCharacter, height=60)
    button_ExportRig = cmds.button(label="Export rig", command=ExportRig, height=20)
    button_ExportAllAnimations = cmds.button(label="Export all animations", command=ExportAllAnimations, height=40)
    button_ExportCurrentAnimation = cmds.button(label="Export current animation", command=ExportCurrentAnimation, height=20)
    

    cmds.formLayout(
        form_ExportFiles,
        edit=True,
        attachForm=[
            (button_ExportWholeCharacter, 'top', 5),
            (button_ExportRig, 'top', 70),
            (button_ExportAllAnimations, 'top', 95),
            (button_ExportCurrentAnimation, 'top', 140),
        ],
        attachPosition=[
            (button_ExportWholeCharacter, 'left', 0, left), (button_ExportWholeCharacter, 'right', 0, right),
            (button_ExportRig, 'left', 0, left), (button_ExportRig, 'right', 0, right),
            (button_ExportAllAnimations, 'left', 0, left), (button_ExportAllAnimations, 'right', 0, right),
            (button_ExportCurrentAnimation, 'left', 0, left), (button_ExportCurrentAnimation, 'right', 0, right),
        ],
    )

    cmds.setParent('..')
    cmds.setParent('..')    
  
  
def Form_ExportSelected():
    global frameLayout_ExportSelected
    frameLayout_ExportSelected = cmds.frameLayout(label='Export selected', labelAlign='top', borderVisible=False, collapsable=True, collapse=True, collapseCommand=ExpandOrColapseFrameLayout, expandCommand=ExpandOrColapseFrameLayout, backgroundColor = colorUI)
    form_ExportSelected = cmds.formLayout(numberOfDivisions=100)

    button_ExportRigSelected = cmds.button(label="Export rig selected", annotation = "Select all parents of joints hierarchys, and skined meshes", command=ExportRigSelected, height=20)
    button_ExportAnimationSelected = cmds.button(label="Export animation selected", annotation = "Select all parents of joints hierarchys", command=ExportAnimationSelected, height=20)

    cmds.formLayout(
        form_ExportSelected,
        edit=True,
        attachForm=[
            (button_ExportRigSelected, 'top', 5),
            (button_ExportAnimationSelected, 'top', 30),
        ],
        attachPosition=[
            (button_ExportRigSelected, 'left', 0, left), (button_ExportRigSelected, 'right', 0, right),
            (button_ExportAnimationSelected, 'left', 0, left), (button_ExportAnimationSelected, 'right', 0, right),
        ],
    )

    cmds.setParent('..')
    cmds.setParent('..')    
  


def Form_Paths():
    global frameLayout_Paths
    global textField_PathToMayaFiles
    global textField_PathToFbxFiles
    frameLayout_Paths = cmds.frameLayout(label='Paths', labelAlign='top', borderVisible=False, collapsable=True, collapse=True, collapseCommand=ExpandOrColapseFrameLayout, expandCommand=ExpandOrColapseFrameLayout, backgroundColor = colorUI)
    form_Paths = cmds.formLayout(numberOfDivisions=100)

    button_PathToMayaFiles = cmds.button(label = "Path to maya files", command = PathToMayaFiles, height = 20)
    textField_PathToMayaFiles = cmds.textField(text = "", changeCommand = ChangePathToMayaFiles)
    
    button_PathToFbxFiles = cmds.button(label = "Path to fbx files", command = PathToFbxFiles, height = 20)
    textField_PathToFbxFiles = cmds.textField(text = "", changeCommand = ChangePathToFbxFiles)
    
    cmds.formLayout(
        form_Paths,
        edit=True,
        attachForm=[
            (button_PathToMayaFiles, 'top', 10),
            (textField_PathToMayaFiles, 'top', 30),
            
            (button_PathToFbxFiles, 'top', 65),
            (textField_PathToFbxFiles, 'top', 85),
        ],
        attachPosition=[
            (button_PathToMayaFiles, 'left', 0, left),
            (button_PathToMayaFiles, 'right', 0, right),
            (textField_PathToMayaFiles, 'left', 0, left),
            (textField_PathToMayaFiles, 'right', 0, right),
            
            (button_PathToFbxFiles, 'left', 0, left),  
            (button_PathToFbxFiles, 'right', 0, right),
            (textField_PathToFbxFiles, 'left', 0, left),
            (textField_PathToFbxFiles, 'right', 0, right),
        ],
    )

    cmds.setParent('..')
    cmds.setParent('..') 

  
    
def ExpandOrColapseFrameLayout(*_):
    width = cmds.window(windowName, query=True, width=True)
    height = heightWindow

    if cmds.frameLayout(frameLayout_ExportFiles, query=True, collapse=True):
        height = height - heightFrameLayoutExportFiles

    if cmds.frameLayout(frameLayout_ExportSelected, query=True, collapse=True):
        height = height - heightFrameLayoutExportSelected

    if cmds.frameLayout(frameLayout_Paths, query=True, collapse=True):
        height = height - heightFrameLayoutPaths
        
    cmds.window(windowName, edit=True, widthHeight=(width, height))
    
    
    
def ChangePathToMayaFiles(*_):
    global mayaPath
    mayaPath = cmds.textField(textField_PathToMayaFiles, query = True, text = True)
    if not os.path.isdir(mayaPath):
        cmds.confirmDialog( title='Errors', message="Path not exists!", button=['OK'])
        ReadDataFromFile()
    else:
        if mayaPath[-1] != "/":
            mayaPath += "/"
            cmds.textField(textField_PathToMayaFiles, edit = True, text = mayaPath)
        WriteDataToFile()

def ChangePathToFbxFiles(*_):
    global fbxPath
    fbxPath = cmds.textField(textField_PathToFbxFiles, query = True, text = True)       
    if not os.path.isdir(fbxPath):
        cmds.confirmDialog( title='Errors', message="Path not exists!", button=['OK'])
        ReadDataFromFile()
    else:
        if fbxPath[-1] != "/":
            fbxPath += "/"
            cmds.textField(textField_PathToFbxFiles, edit = True, text = fbxPath)
        WriteDataToFile()
    
def ReadDataFromFile():  
    f = open((curPath + "LastOptions.txt"))
    paths = f.readlines()
    f.close()  
    global mayaPath
    global fbxPath
    mayaPath = paths[0]
    fbxPath = paths[1]
    if mayaPath[-1] == "\n":
        mayaPath = mayaPath[0:(len(mayaPath)-1)]
    if fbxPath[-1] == "\n":
        fbxPath = fbxPath[0:(len(fbxPath)-1)]
        
    cmds.textField(textField_PathToMayaFiles, edit = True, text = mayaPath)
    cmds.textField(textField_PathToFbxFiles, edit = True, text = fbxPath)
    
    
def WriteDataToFile():
    f = open((curPath + "LastOptions.txt"), 'w')
    f.write((mayaPath + "\n" + fbxPath + "\n"))
    f.close()

     
def PathToMayaFiles(*_):
    cmds.fileBrowserDialog( mode=4, fileCommand=ChangePathMaya, an='choose path')
    ChangePathToMayaFiles()

def ChangePathMaya(fileName, fileType):
    if fileName:
        cmds.textField(textField_PathToMayaFiles, edit = True, text = fileName)
        
def PathToFbxFiles(*_):
    cmds.fileBrowserDialog( mode=4, fileCommand=ChangePathFbx, an='choose path')
    ChangePathToFbxFiles()
    
def ChangePathFbx(fileName, fileType):
    if fileName:
        cmds.textField(textField_PathToFbxFiles, edit = True, text = fileName)

      
        
        
def ExportWholeCharacter(*_):
    Export.WholeCharacter(presetPath, mayaPath, fbxPath)

def ExportRig(*_):
    Export.Rig(presetPath, mayaPath, fbxPath)

def ExportAllAnimations(*_):
    Export.AllAnimations(presetPath, mayaPath, fbxPath)

def ExportCurrentAnimation(*_):
    Export.CurrentAnimation(presetPath, mayaPath, fbxPath)





def ExportRigSelected(*_):
    Export.RigSelected(presetPath)

def ExportAnimationSelected(*_):
    Export.AnimationSelected(presetPath)

      
        
        
        
        
        
        
        
        
        