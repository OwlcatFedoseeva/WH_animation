import maya.OpenMaya as om
import maya.cmds as cmds
import os

class MayaSceneTools:
    @staticmethod
    def deleteEmptyUvSets(name):
        selList = om.MSelectionList()
        selList.add(name)
        selListIter = om.MItSelectionList(selList, om.MFn.kMesh)
        pathToShape = om.MDagPath()
        selListIter.getDagPath(pathToShape)
        meshNode = pathToShape.fullPathName()
        uvSets = cmds.polyUVSet(meshNode, query=True, allUVSets=True)
        for uvset in uvSets:
            shapeFn = om.MFnMesh(pathToShape)
            shellsUtil = om.MScriptUtil()
            shellsPtr = shellsUtil.asUintPtr()
            
            uArray = om.MFloatArray()   # array for U coords
            vArray = om.MFloatArray()   # array for V coords
            uvShellIds = om.MIntArray() # The container for the uv shell Ids
            
            shapeFn.getUVs(uArray, vArray, uvset)
            shapeFn.getUvShellsIds(uvShellIds, shellsPtr, uvset)
            
            if uArray.length() == 0 and vArray.length() == 0:
                print("Deleting empty UV set '{}'...".format(uvset))
                cmds.polyUVSet(meshNode, delete=True, uvSet=uvset)

    @staticmethod
    def clean_up_uvsets():
        sel = cmds.ls(type='mesh')
        
        for s in sel:
            MayaSceneTools.deleteEmptyUvSets(s)
            print('Empty UV sets have been deleted')
        
    @staticmethod
    def remove_namespaces():
        '''
        This function removes namespaces from all imported instances in the scene.
        '''
        all_namespaces = [x for x in cmds.namespaceInfo(listOnlyNamespaces=True, recurse=True) if
                        x != "UI" and x != "shared"]
        if all_namespaces:
            all_namespaces.sort(key=len, reverse=True)
            for namespace in all_namespaces:
                if cmds.namespace(exists=namespace) is True:
                    cmds.namespace(removeNamespace=namespace, mergeNamespaceWithRoot=True)
        print("Namespaces removed successfully!")

    @staticmethod
    def delete_nodes(node_type, message):
        nodes = cmds.ls(type=node_type)
        if nodes:
            print(message)
            cmds.delete(nodes)

    @staticmethod
    def model_cleanup():
        nodes_to_check = {
            'blindDataTemplate': 'BlindDataTemplate nodes found. Deleting...',
            'deleteComponent': 'DeleteComponent nodes found. Deleting...',
            'expression': 'Expression nodes found. Deleting...',
            'polyBlindData': 'PolyBlindData nodes found. Deleting...',
            'polyCollapseEdge': 'PolyCollapseEdge nodes found. Deleting...',
            'polyCreateFace': 'PolyCreateFace nodes found. Deleting...',
            'polyDelEdge': 'PolyDelEdge nodes found. Deleting...',
            'polyFlipEdge': 'PolyFlipEdge nodes found. Deleting...',
            'polyTweak': 'PolyTweak nodes found. Deleting...',
            'polyUnite': 'PolyUnite nodes found. Deleting...',
            'rigidSolver': 'RigidSolver nodes found. Deleting...',
            'script': 'Script nodes found. Deleting...',
            'unknown': 'Unknown nodes found. Deleting...'
        }
        
        for node_type, message in nodes_to_check.items():
            MayaSceneTools.delete_nodes(node_type, message)
        
        print('No nodes found for deletion.')

    @staticmethod
    def create_model_group():
        meshes = cmds.ls(type="mesh", long=True)
        trans = []
        
        if len(meshes) < 2:
            print("There are not enough mesh objects in the scene to create a group.")
            return
        
        
        if cmds.objExists("Model_Group"):
            print("Model Group exists. Skipping...")

        else:
            model_group = cmds.group(empty=True, name="Model_Group")
            for mesh in meshes:
                transform_nodes = cmds.listRelatives(mesh, parent=True, fullPath=True)
                if not transform_nodes:
                    print("No parent transform node found for mesh:", mesh)
                    continue
                
                transform_node = transform_nodes[0]
                trans.append(transform_node)
                cmds.parent(transform_node, model_group)
            
            for mesh in trans:
                if not cmds.objExists(mesh):
                    print("Object does not exist:", mesh)
                    continue
                
                cmds.parent(mesh, model_group)
                cmds.makeIdentity(mesh, apply=True, t=1, r=1, s=1, n=0)
                cmds.delete(mesh, constructionHistory=True)
                
        print("Model_Group created and mesh objects are parented under it.")

    @staticmethod
    def get_all_materials():
        all_materials = cmds.ls(materials=True)
        m = []
        
        for material in all_materials:
            if material not in ['particleCloud1', 'lambert1']:
                m.append(material)
        return m

    @staticmethod
    def get_all_shaders():
        all_shading_engines = cmds.ls(type='shadingEngine')
        
        non_deletable_nodes = ['initialShadingGroup', 'initialParticleSE']
        sd = []
        for shading_engine in all_shading_engines:
            if shading_engine not in non_deletable_nodes:
                sd.append(shading_engine)
        return sd

    @staticmethod
    def get_all_texture_files():
        return cmds.ls(type='file')

    @staticmethod
    def get_scene_objects():
        return cmds.ls(geometry=True, lights=True, cameras=True)

    @staticmethod
    def find_unused_materials():
        used_materials = set()
        for obj in MayaSceneTools.get_scene_objects():
            if cmds.objectType(obj) == 'mesh':
                shading_groups = cmds.listConnections(obj, type='shadingEngine')
                if shading_groups:
                    for sg in shading_groups:
                        connected_materials = cmds.ls(cmds.listConnections(sg), materials=True)
                        used_materials.update(connected_materials)
        all_materials = set(MayaSceneTools.get_all_materials())
        return all_materials - used_materials

    @staticmethod
    def find_unused_shaders():
        used_shaders = set()
        for obj in MayaSceneTools.get_scene_objects():
            if cmds.objectType(obj) == 'mesh':
                shading_groups = cmds.listConnections(obj, type='shadingEngine')
                used_shaders.update(shading_groups)
        all_shaders = set(MayaSceneTools.get_all_shaders())
        return all_shaders - used_shaders


    @staticmethod
    def remove_unused_materials():
        unused_materials = MayaSceneTools.find_unused_materials()
        if unused_materials:
            cmds.delete(unused_materials)
        print('Removed unused materials.')
    @staticmethod   
    def remove_unused_shaders():
        unused_shaders = MayaSceneTools.find_unused_shaders()
        if unused_shaders:
            cmds.delete(unused_shaders)
        print('Removed unused shaders.')
    @staticmethod
    def remove_unused_texture_files():
        unused_texture_files = MayaSceneTools.find_unused_texture_files()
        if unused_texture_files:
            cmds.delete(unused_texture_files)
        
    @staticmethod
    def check_and_delete_unused_texture_files():
        all_texture_files = MayaSceneTools.get_all_texture_files()
        for texture_file in all_texture_files:
            connections = cmds.listConnections(texture_file + '.outColor', destination=True)
            print(connections)
            if not connections:
                cmds.delete(texture_file)
        print('Removed textures.')


    @staticmethod
    def killTurtle():
        try:
            cmds.lockNode('TurtleDefaultBakeLayer', lock=False)
            cmds.delete('TurtleDefaultBakeLayer')
        except:
            pass
        try:
            cmds.lockNode('TurtleDefaultBakeManager', lock=False)
            cmds.delete('TurtleDefaultBakeManager')
        except:
            pass
        try:
            cmds.lockNode('TurtleRenderOptions', lock=False)
            cmds.delete('TurtleRenderOptions')
        except:
            pass
        try:
            cmds.lockNode('TurtleUIOptions', lock=False)
            cmds.delete('TurtleUIOptions')
        except:
            pass
            
        print('Removed Turtle nodes.')

    @staticmethod
    def optimize_scene():
        MayaSceneTools.remove_unused_materials()
        MayaSceneTools.remove_unused_shaders()
        MayaSceneTools.del_unused_tex()
        MayaSceneTools.check_and_delete_unused_texture_files()
        MayaSceneTools.killTurtle()
        filename_to_search = "vaccine.py"
        MayaSceneTools.search_and_delete_file_in_maya_root(filename_to_search)


    #================================
    @staticmethod
    def shader_texture_rename():
        sel = cmds.ls(type='mesh')
        mesh = []
        for s in sel:
            parents = cmds.listRelatives(s, p=True)
            if parents:  # Checking if there are any parents
                mesh.append(parents[0])  # Adding the first parent to the set
            else:
                print("No parent found for:", s)

        mat = []
        obj = []
        for i in mesh:
            #sel = cmds.ls(selection=True)
            shape = cmds.listRelatives ( i, shapes=True )
            shadingEngine = cmds.listConnections (shape, source=False, destination=True)
            material = cmds.listConnections (shadingEngine, source=True, destination=False)
            mat.append(material[0])
            obj.append(material[1])

        for o, m in zip(obj, mat):
            new_shader_name = o + "_charactercutout_d"
            cmds.rename(m, new_shader_name)
            print("Renamed shader:", m, "to", new_shader_name)
            
            cmds.select(o)
            shapesInSel = cmds.ls( dag=1,o=1,s=1,sl=1)
            print(shapesInSel)
            shadingGrps = cmds.listConnections(shapesInSel,type='shadingEngine')
            shaders = cmds.ls(cmds.listConnections(shadingGrps),materials=1)
            print(shaders)
            fileNode = cmds.listConnections('%s.color' % (shaders[0]), type='file')
            print(fileNode)
            new_tex_name = o + "_d"
            cmds.rename(fileNode, new_tex_name)
            print("Renamed shader:", fileNode, "to", new_tex_name)
    
    @staticmethod
    def shader_texture_rename_new():
        textures = cmds.ls(type='file')


        for t in textures:
            file_path = cmds.getAttr(t + ".fileTextureName")
            name_ext = file_path.split('/')[-1]
            name = name_ext.split('.')[0]
            connected_shader = cmds.listConnections(t + '.outColor', source=False, destination=True)
            shader_name = name[:-2] + '_charactercutout_d'
            print(shader_name)
            cmds.rename(connected_shader, shader_name)
            print(name)
            cmds.rename(t, name)
	
        print('Corrected shader and texture names.')
    
    #================================
    @staticmethod
    def del_unused_tex():
        sel = cmds.ls(type='mesh')
        mesh = []
        for s in sel:
            parents = cmds.listRelatives(s, p=True)
            if parents:  # Checking if there are any parents
                mesh.append(parents[0])  # Adding the first parent to the set
            else:
                print("No parent found for:", s)

        obj = []
        for i in mesh:
            #sel = cmds.ls(selection=True)
            shape = cmds.listRelatives ( i, shapes=True )
            shadingEngine = cmds.listConnections (shape, source=False, destination=True)
            material = cmds.listConnections (shadingEngine, source=True, destination=False)
            obj.append(material[1])
        
        use_files = []	
        for o in obj:
            cmds.select(o)
            shapesInSel = cmds.ls( dag=1,o=1,s=1,sl=1)
            shadingGrps = cmds.listConnections(shapesInSel,type='shadingEngine')
            shaders = cmds.ls(cmds.listConnections(shadingGrps),materials=1)
            fileNode = cmds.listConnections('%s.color' % (shaders[0]), type='file')
            use_files.append(fileNode[0])

        files_to_delete = []
        all_files = cmds.ls(type='file')
        place2d_texture = cmds.ls(type='place2dTexture')

        for file_node in all_files:
            if file_node not in use_files:
                files_to_delete.append(file_node)
                place2d_texture = cmds.listConnections(file_node + '.uvCoord', type='place2dTexture')
            if not place2d_texture:  # If not connected, consider for deletion
                files_to_delete.append(file_node)

        for i in files_to_delete:
            cmds.delete(i)
    
    #================================
    @staticmethod
    def search_and_delete_file_in_maya_root(filename):
        # Get Maya's root folder
        USERAPPDIR = cmds.internalVar(userAppDir=True)
        maya_root = os.path.join(USERAPPDIR, 'scripts')

        if maya_root:
            # Construct the full path to the file
            file_path = os.path.join(maya_root, filename)

            # Check if the file exists
            if os.path.exists(file_path):
                print("File '{}' found at: {}".format(filename, file_path))
                try:
                    # Attempt to delete the file
                    os.remove(file_path)
                    print("File '{}' deleted successfully.".format(filename))
                except Exception as e:
                    print("Error deleting file '{}': {}".format(filename, str(e)))
            else:
                print("File '{}' not found in Maya root folder.".format(filename))
        else:
            print("Maya root folder not found.")


maya_tools = MayaSceneTools()
