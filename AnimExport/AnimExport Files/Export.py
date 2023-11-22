

import WorkingInFile as File
reload(File)
import WorkingWithPaths as Path
reload(Path)
import WorkingWithSelected as ReadSelected
reload(ReadSelected)
import FindNeededAutomaticlyInFile as Find
reload(Find)
import Other as Other
reload(Other)



def WholeCharacter(presetPath, rootMayaPath, rootFbxPath):
    Rig(presetPath, rootMayaPath, rootFbxPath)
    AllAnimations(presetPath, rootMayaPath, rootFbxPath)


def Rig(presetPath, rootMayaPath, rootFbxPath):

    if not Path.GetAndBuildMayaAndFbxPaths(rootMayaPath, rootFbxPath): return

    Path.GetMayaAndFbxRigPath(rootMayaPath, rootFbxPath)
    
    Path.OpenFile(Path.mayaPathRig)
    
    if not Find.AllJointsUnderParent("DeformationSystem"): return
    if not Find.SkinnedMeshesFromAllJoints(): return 

    Rig_(presetPath, Path.fbxPathRig)


def AllAnimations(presetPath, rootMayaPath, rootFbxPath):

    if not Path.GetAndBuildMayaAndFbxPaths(rootMayaPath, rootFbxPath): return 
    
    Path.GetMayaAnimationPaths() 
  
    wind, progress = Other.WindowProgressBar(100)
    
    for p in Path.mayaPathsAnimation:
    
        Other.ProgressEdit(progress, 100/len(Path.mayaPathsAnimation))
    
        Path.OpenFile(p)
        
        if not Find.AllJointsUnderParent("DeformationSystem"): return  
        
        if not Path.GetCurrentFileMayaAndFbxPaths(rootMayaPath, rootFbxPath): return
    
        Animation_(presetPath, Path.fbxPathCurrent)
        
    Other.ProgressFinish(wind)    


def CurrentAnimation(presetPath, rootMayaPath, rootFbxPath):

    if not Path.GetAndBuildMayaAndFbxPaths(rootMayaPath, rootFbxPath): return
    
    Path.GetCurrentFileMayaAndFbxPaths(rootMayaPath, rootFbxPath)
    
    if not Find.AllJointsUnderParent("DeformationSystem"): return 
    
    Animation_(presetPath, Path.fbxPathCurrent)





def RigSelected(presetPath):

    if not ReadSelected.JointsParentsAndMeshes(): return
    
    path = Path.GetPathFbx()
    if not path: return
    
    Rig_(presetPath, path)
    

def AnimationSelected(presetPath):

    if not ReadSelected.JointsParents(): return
  
    path = Path.GetPathFbx()
    if not path: return
    
    Animation_(presetPath, path)
    
   


   
def Rig_(presetPath, path):  
  
    File.ReadTime()
    
    File.ReadConstraints()
    
    File.BakeKeys(File.startTime, (File.startTime+1))
    
    File.DeleteConstraints()
    
    File.CreateRoot("Position")

    File.DeleteGeometry(File.allSkinedMeshes)
    
    File.CutAllKeys()
    
    File.Select(File.allJoints + File.allSkinedMeshes)
    
    File.CleanOther()

    File.ExportFBX(presetPath, path)
    

def Animation_(presetPath, path):

    File.ReadTime()
    
    File.ReadConstraints()

    File.BakeKeys(File.startTime, File.endTime)

    File.DeleteStaticChannels()

    File.OneKeyForEachAttribute()
  
    File.ImportReferenceFile()

    File.CreateRoot("Position")

    File.allJoints = File.CleanNameSpace(File.allJoints)
    
    File.DeleteConstraints()

    File.DeleteGeometry()
    
    File.Select(File.allJoints)
    
    File.ChangeStartEndTime(File.startTime, File.endTime)
    
    File.KeysSpline()

    File.CleanOther()

    File.ExportFBX(presetPath, path)
    
        

    



      
      
      