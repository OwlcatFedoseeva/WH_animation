import maya.OpenMaya as om
import maya.cmds as cmds
import os
from collections import defaultdict
import maya.mel as mel


class MayaSceneTools:
    @staticmethod
    def get_face_vertices(mesh):
        """
        Returns a dictionary with faces as keys and their vertex positions as values.
        """
        face_vertices = defaultdict(list)
        num_faces = cmds.polyEvaluate(mesh, face=True)
        
        for face_id in range(num_faces):
            vertices = cmds.polyInfo(f"{mesh}.f[{face_id}]", faceToVertex=True)[0].split()[2:]
            vertices = [int(v) for v in vertices]
            for vtx in vertices:
                pos = cmds.pointPosition(f"{mesh}.vtx[{vtx}]")
                face_vertices[face_id].append(pos)
            face_vertices[face_id].sort()  # Sort the vertices to ensure consistent ordering
        
        return face_vertices

    @staticmethod
    def find_duplicate_faces(face_vertices):
        """Finds and returns faces that have identical vertex positions."""
        duplicates = defaultdict(list)
        
        for face_id, verts in face_vertices.items():
            verts_tuple = tuple(map(tuple, verts))
            duplicates[verts_tuple].append(face_id)
        
        duplicate_faces = [faces for faces in duplicates.values() if len(faces) > 1]
        return duplicate_faces

    @staticmethod
    def create_selection_set(duplicate_faces, mesh):
        """Creates a selection set containing the duplicate faces."""
        selection_set = cmds.sets(name="duplicate_faces_set")
        
        for faces in duplicate_faces:
            for face_id in faces[1:]:  # Add only the duplicates, excluding the first face
                cmds.sets(f"{mesh}.f[{face_id}]", add=selection_set)
        
        return selection_set

    @staticmethod
    def duplicate_polygon_checker():
        print('Running duplicate_polygon_checker')
        selected = cmds.ls(type = 'mesh')
        for s in selected:
        
            mesh = s
            face_vertices = MayaSceneTools.get_face_vertices(mesh)
            duplicate_faces = MayaSceneTools.find_duplicate_faces(face_vertices)
            
            if duplicate_faces:
                selection_set = MayaSceneTools.create_selection_set(duplicate_faces, mesh)
                
                result = cmds.confirmDialog(
                    title='Duplicates Found',
                    message='Duplicate faces have been found. What would you like to do with them?',
                    button=['Delete', 'Select', 'Cancel'],
                    defaultButton='Select',
                    cancelButton='Cancel',
                    dismissString='Cancel'
                )
                
                if result == 'Delete':
                    for faces in duplicate_faces:
                        for face_id in faces[1:]:
                            cmds.delete(f"{mesh}.f[{face_id}]")
                elif result == 'Select':
                    cmds.select(selection_set, replace=True)
                    cmds.confirmDialog(title='Selected', message='Duplicate faces have been selected.', button=['OK'])
            else:
                pass


    @staticmethod
    def deleteEmptyUvSets(name):
        """
        Deletes empty UV sets from a given mesh object.
        """
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
        """
        Cleans up empty UV sets from all mesh objects in the scene.
        """
        sel = cmds.ls(type='mesh')
        remainingUvSets = set()
        
        for s in sel:
            MayaSceneTools.deleteEmptyUvSets(s)
            remainingUvSets.update(cmds.polyUVSet(s, query=True, allUVSets=True))
            cmds.delete(s, all=True, constructionHistory=True)
        
        if len(remainingUvSets) > 1:
            cmds.confirmDialog(
                title='Multiple UV Sets',
                message='There are two or more UV sets remaining:\n' + '\n'.join(remainingUvSets),
                button=['OK'],
                defaultButton='OK'
            )
        print('Empty UV sets have been deleted')

    @staticmethod
    def remove_namespaces():
        """
        Removes all namespaces from the scene except for 'UI' and 'shared'.
        """
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
        """
        Deletes all nodes of a specified type and prints a message.
        """
        nodes = cmds.ls(type=node_type)
        if nodes:
            print(message)
            cmds.delete(nodes)

    @staticmethod
    def model_cleanup():
        """
        Deletes various types of unnecessary nodes from the scene.
        """
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
        
        sel = cmds.ls(type='mesh')
        for s in sel:
            cmds.select(s)
            mel.eval('DeleteHistory;')

        print('No nodes found for deletion.')

    @staticmethod
    def create_model_group():
        """
        Creates a group for all mesh objects in the scene and parents them under it.
        If the group already exists, finds models that are not parented under it and parents them.
        """
        meshes = cmds.ls(type="mesh")

        # Get the current file name and strip the extension
        current_file_name = cmds.file(query=True, sceneName=True, shortName=True)

        # Check if the file has been saved
        if not current_file_name:
            cmds.confirmDialog(title='Save Scene Required',
                            message='Please save the scene before creating the model group.',
                            button=['OK'],
                            defaultButton='OK',
                            cancelButton='OK',
                            dismissString='OK')
            return

        stripped_file_name, _ = os.path.splitext(current_file_name)
        group_name = stripped_file_name + '_GP'

        if cmds.objExists(group_name):
            print("Model Group exists.")

            # Get all children of the group
            group_children = cmds.listRelatives(group_name, children=True, fullPath=True) or []

            for mesh in meshes:
                transform_nodes = cmds.listRelatives(mesh, parent=True, fullPath=True)
                if not transform_nodes:
                    print("No parent transform node found for mesh:", mesh)
                    continue
                
                transform_node = transform_nodes[0]
                
                if transform_node not in group_children:
                    try:
                        cmds.parent(transform_node, group_name)
                        cmds.makeIdentity(transform_node, apply=True, t=1, r=1, s=1, n=0)
                        cmds.delete(transform_node, constructionHistory=True)
                        print("Model", transform_node, "is now parented under", group_name)
                    except Exception as e:
                        print("Error:", str(e))
                else:
                    print("Model", transform_node, "is already parented under", group_name)
        else:
            model_group = cmds.group(empty=True, name=group_name)

            for mesh in meshes:
                transform_nodes = cmds.listRelatives(mesh, parent=True, fullPath=True)
                if not transform_nodes:
                    print("No parent transform node found for mesh:", mesh)
                    continue
                
                transform_node = transform_nodes[0]
                
                if cmds.objExists(transform_node):
                    try:
                        cmds.parent(transform_node, model_group)
                        cmds.makeIdentity(transform_node, apply=True, t=1, r=1, s=1, n=0)
                        cmds.delete(transform_node, constructionHistory=True)
                    except Exception as e:
                        print("Error:", str(e))
                else:
                    print("Object does not exist:", transform_node)
            
            print("Model_Group created and mesh objects are parented under it.")

    @staticmethod
    def get_all_materials():
        """
        Returns a list of all materials in the scene, excluding default ones.
        """
        all_materials = cmds.ls(materials=True)
        m = []
        
        for material in all_materials:
            if material not in ['particleCloud1', 'lambert1']:
                m.append(material)
        return m

    @staticmethod
    def get_all_shaders():
        """
        Returns a list of all shaders in the scene, excluding default ones.
        """
        all_shading_engines = cmds.ls(type='shadingEngine')
        
        non_deletable_nodes = ['initialShadingGroup', 'initialParticleSE']
        sd = []
        for shading_engine in all_shading_engines:
            if shading_engine not in non_deletable_nodes:
                sd.append(shading_engine)
        return sd

    @staticmethod
    def get_all_texture_files():
        """
        Returns a list of all texture files in the scene.
        """
        return cmds.ls(type='file')

    @staticmethod
    def get_scene_objects():
        """
        Returns a list of all geometry, lights, and cameras in the scene.
        """
        return cmds.ls(geometry=True, lights=True, cameras=True)

    @staticmethod
    def find_unused_materials():
        """
        Finds and returns a list of unused materials in the scene.
        """
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
        """
        Finds and returns a list of unused shaders in the scene.
        """
        used_shaders = set()
        for obj in MayaSceneTools.get_scene_objects():
            if cmds.objectType(obj) == 'mesh':
                shading_groups = cmds.listConnections(obj, type='shadingEngine')
                used_shaders.update(shading_groups)
        all_shaders = set(MayaSceneTools.get_all_shaders())
        return all_shaders - used_shaders

    @staticmethod
    def remove_unused_materials():
        """
        Removes all unused materials from the scene.
        """
        unused_materials = MayaSceneTools.find_unused_materials()
        if unused_materials:
            cmds.delete(unused_materials)
        print('Removed unused materials.')
    
    @staticmethod   
    def remove_unused_shaders(do_not_delete=None):
        """
        Removes all unused shaders from the scene, except those in the do_not_delete list.
        
        Parameters:
        do_not_delete (list): List of shader names to skip. Defaults to an empty list.
        """
        if do_not_delete is None:
            do_not_delete = []

        # Always skip these shaders
        always_do_not_delete = ['standardSurface1', 'shaderGlow1', 'particleCloud1', 'lambert1']
        
        # Combine both lists
        do_not_delete = set(do_not_delete + always_do_not_delete)
        
        unused_shaders = MayaSceneTools.find_unused_shaders()
        
        # Filter out shaders in the do_not_delete list
        shaders_to_delete = [shader for shader in unused_shaders if shader not in do_not_delete]
        
        if shaders_to_delete:
            cmds.delete(shaders_to_delete)
        
        print('Removed unused shaders, except those in the do_not_delete list.')

    @staticmethod
    def remove_unused_texture_files():
        """
        Removes all unused texture files from the scene.
        """
        unused_texture_files = MayaSceneTools.find_unused_texture_files()
        if unused_texture_files:
            cmds.delete(unused_texture_files)
        
    @staticmethod
    def check_and_delete_unused_texture_files():
        """
        Checks for and deletes unused texture files in the scene.
        """
        all_texture_files = MayaSceneTools.get_all_texture_files()
        for texture_file in all_texture_files:
            used_nodes = cmds.listConnections(texture_file, source=False)
            if not used_nodes:
                print(f"Deleting unused texture file node: {texture_file}")
                cmds.delete(texture_file)

    @staticmethod
    def scene_optimization():
        """
        Performs various scene optimization tasks.
        """
        print('Starting scene optimization...')
        # Удаление пустых UV-наборов
        MayaSceneTools.clean_up_uvsets()
        
        # Создание группы моделей
        #MayaSceneTools.create_model_group()

        # Удаление неиспользуемых материалов и шейдеров
        MayaSceneTools.remove_unused_materials()
        MayaSceneTools.remove_unused_shaders()
        
        # Удаление пустых нод
        MayaSceneTools.check_and_delete_unused_texture_files()
        
        # Проверка нодов с определенными типами
        nodes_to_check = ['unknown', 'unitConversion', 'time', 'renderLayer', 'displayLayer', 'groupId', 'objectSet', 'partition']
        for node_type in nodes_to_check:
            MayaSceneTools.delete_nodes(node_type, f'{node_type} nodes found and deleted')

        selection_sets = cmds.ls(type="objectSet")
        
        for sel_set in selection_sets:
            if cmds.sets(sel_set, q=True, size=True) > 0:
                try:
                    cmds.delete(sel_set)
                    print("Deleted selection set:", sel_set)
                except Exception as e:
                    print("Error deleting selection set:", sel_set, str(e))

        
        print('Scene optimization complete!')

    @staticmethod
    def find_and_remove_location(filename_to_search):
        """
        Finds and removes a specified file from the Maya script path.
        """
        all_paths = os.environ['MAYA_SCRIPT_PATH'].split(';')
        for path in all_paths:
            for root, dirs, files in os.walk(path):
                for file in files:
                    if filename_to_search in file:
                        full_path = os.path.join(root, file)
                        os.remove(full_path)
                        print(f"Removed file: {full_path}")

    @staticmethod
    def material_rename():
        '''
        This function renames the shaders and materials based on the transparency channels connections. 
        If there is a connection in transparency channel, then the material name will contain _cutout_d in its' name;
        Otherwise, the material will contain _opaque_d in its name;
        Materials, which already have correct naming will be ignored;
        '''

        selected = cmds.ls(materials=True)
        
        for item in selected:
            # Check if the shader name already contains "_cutout_d" or "_opaque_d"
            if "_cutout_d" in item or "_opaque_d" in item:
                continue
            
            # Get the current material name and texture node
            material_name = item
            texture_nodes = cmds.listConnections(material_name, type='file')
            
            if not texture_nodes:
                continue
            
            texture_node = texture_nodes[0]
            texture_file = cmds.getAttr(texture_node + '.fileTextureName')
            
            # Get the file name without directory and extension
            texture_name = os.path.splitext(os.path.basename(texture_file))[0]
            
            # Check transparency
            transparency_attr = material_name + '.transparency'
            transparency_connected = cmds.connectionInfo(transparency_attr, isDestination=True)
            transparency_value = cmds.getAttr(transparency_attr)[0]  # transparency is usually a 3-element array
            
            # Determine new material name based on transparency
            if transparency_connected or any(transparency_value):
                new_material_name = texture_name[:-2] + '_cutout_d'
            else:
                new_material_name = texture_name[:-2] + '_opaque_d'
            
            print(new_material_name)
            new_texture_name = texture_name
            
            # Rename material and texture node
            cmds.rename(material_name, new_material_name)
            cmds.rename(texture_node, new_texture_name)


    @staticmethod
    def correct_shader_assignment():
        # Get all materials in the scene
        all_materials = cmds.ls(materials=True)
        
        # Dictionary to store texture paths and corresponding materials
        texture_materials_dict = {}
        
        for material in all_materials:
            # Get connected file texture nodes
            file_texture_nodes = cmds.listConnections(material, type="file")
            
            if file_texture_nodes:
                # Get the texture path from the file texture node
                texture_path = cmds.getAttr(file_texture_nodes[0] + ".fileTextureName")
                
                # If the texture path is valid
                if texture_path:
                    # Use the full path as the key for uniqueness
                    texture_key = texture_path.lower()
                    
                    # Append the material to the list in the dictionary
                    if texture_key in texture_materials_dict:
                        texture_materials_dict[texture_key].append(material)
                    else:
                        texture_materials_dict[texture_key] = [material]
        
        # Reassign materials to use the first material in each texture group
        for texture_path, materials in texture_materials_dict.items():
            if len(materials) > 1:
                first_material = materials[0]
                for material in materials[1:]:
                    # Select objects using the current material
                    shading_groups = cmds.listConnections(material, type='shadingEngine')
                    if shading_groups:
                        for shading_group in shading_groups:
                            objects = cmds.sets(shading_group, q=True)
                            if objects:
                                cmds.select(objects, replace=True)
                                # Assign the first material to these objects
                                cmds.hyperShade(assign=first_material)
    
    # Deselect all objects
    cmds.select(clear=True)

maya_tools = MayaSceneTools()
