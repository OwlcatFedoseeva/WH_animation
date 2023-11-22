
import maya.cmds as cmds

def WindowProgressBar(count):
    windowProgressBar = cmds.window(titleBar=False)
    cmds.columnLayout()
    progressControl = cmds.progressBar(maxValue=count, width=300)
    cmds.showWindow(windowProgressBar)
    return windowProgressBar, progressControl

def ProgressFinish(windowProgressBar):
    cmds.deleteUI(windowProgressBar)
        
def ProgressEdit(progressControl, curStep):        
    cmds.progressBar(progressControl, edit=True, step=curStep)