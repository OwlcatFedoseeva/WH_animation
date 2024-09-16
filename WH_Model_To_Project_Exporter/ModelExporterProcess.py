import maya.cmds as cmds
import maya.OpenMaya as om
from collections import defaultdict
from PySide2 import QtCore, QtGui, QtWidgets 
import maya.mel as mel
import os

class scene_expoter_tools:

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
    def to_real_scale():
        # List all objects in the scene
        all_objects = cmds.ls(dag=True, long=True)
        
        # Filter to get top-level nodes (those without parents)
        top_nodes = [obj for obj in all_objects if not cmds.listRelatives(obj, parent=True)]
        
        # Filter out nodes that have a camera as a child
        non_camera_top_nodes = []
        for obj in top_nodes:
            children = cmds.listRelatives(obj, children=True, fullPath=True) or []
            if not any(cmds.objectType(child) == 'camera' for child in children):
                non_camera_top_nodes.append(obj)
        
        # Select the remaining non-camera top nodes
        cmds.select(non_camera_top_nodes)
        
        # Print the non-camera top nodes for verification
        print("Non-camera top nodes selected:", non_camera_top_nodes)
        
        
        scale_group = cmds.group(n = 'toScale')
        cmds.xform(scale_group, pivots=(0, 0, 0), worldSpace=True)
        
        
        cmds.setAttr('%s.scale' % scale_group, 100, 100, 100)
        
        # Freeze transformations
        cmds.makeIdentity(scale_group, apply=True, scale=True)
        
        # Unparent children from 'toScale' group
        children = cmds.listRelatives(scale_group, c=True)
        #print(children)
        if children:
            for item in children:
                cmds.parent(item, world=True)
        
        # Delete the 'toScale' group
        cmds.delete(scale_group)
        
        
        # Confirm completion
        print('Objects have been scaled, transformations frozen, unparented, and the group deleted.')
    
    @staticmethod
    def to_small_scale():
            # List all objects in the scene
        all_objects = cmds.ls(dag=True, long=True)
        
        # Filter to get top-level nodes (those without parents)
        top_nodes = [obj for obj in all_objects if not cmds.listRelatives(obj, parent=True)]
        
        # Filter out nodes that have a camera as a child
        non_camera_top_nodes = []
        for obj in top_nodes:
            children = cmds.listRelatives(obj, children=True, fullPath=True) or []
            if not any(cmds.objectType(child) == 'camera' for child in children):
                non_camera_top_nodes.append(obj)
        
        # Select the remaining non-camera top nodes
        cmds.select(non_camera_top_nodes)
        
        # Print the non-camera top nodes for verification
        print("Non-camera top nodes selected:", non_camera_top_nodes)
        
        
        scale_group = cmds.group(n = 'toScale')
        cmds.xform(scale_group, pivots=(0, 0, 0), worldSpace=True)
        
        
        cmds.setAttr('%s.scale' % scale_group, 0.01, 0.01, 0.01)
        
        # Freeze transformations
        cmds.makeIdentity(scale_group, apply=True, scale=True)
        
        # Unparent children from 'toScale' group
        #children = cmds.listRelatives(scale_group, c=True)
        print(children)
        if children:
            for item in children:
                cmds.parent(item, world=True)
        
        # Delete the 'toScale' group
        cmds.delete(scale_group)
        
        
        # Confirm completion
        print('Objects have been scaled, transformations frozen, unparented, and the group deleted.')
   
    @staticmethod
    def create_lightmap_uvset():
        sel = cmds.ls(type='mesh')

        for i in sel:
            uv_sets = cmds.polyUVSet(i, query=True, allUVSets=True)
            if 'lightmap' not in uv_sets:
                cmds.polyUVSet(i, create=True, uvSet='lightmap')
            
            cmds.polyAutoProjection(i, caching=True, ch=False, lm=1, pb=0, ibd=1, cm=False, l=2, sc=1, o=1, p=6, uvSetName='lightmap', ps=0.2, ws=0)
            cmds.delete(i, constructionHistory=True)

    @staticmethod
    def delete_lightmap_uvset():
        sel = cmds.ls(type='mesh')
        for i in sel:
            cmds.polyUVSet(i, delete=True, uvSet='lightmap')

    @staticmethod
    def get_face_vertices(mesh):
        """
        Returns a dictionary with faces as keys and their vertex positions as values.
        """
        face_vertices = defaultdict(list)
        num_faces = cmds.polyEvaluate(mesh, face=True)
        
        for face_id in range(num_faces):
            vertices = cmds.polyInfo("%s.f[%d]" % (mesh, face_id), faceToVertex=True)[0].split()[2:]
            vertices = [int(v) for v in vertices]
            for vtx in vertices:
                pos = cmds.pointPosition("%s.vtx[%d]" % (mesh, vtx))
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
                cmds.sets("%s.f[%d]" % (mesh, face_id), add=selection_set)
        
        return selection_set

    @staticmethod
    def duplicate_polygon_checker():
        print('Running duplicate_polygon_checker')
        selected = cmds.ls(type='mesh')
        for s in selected:
        
            mesh = s
            face_vertices = scene_expoter_tools.get_face_vertices(mesh)
            duplicate_faces = scene_expoter_tools.find_duplicate_faces(face_vertices)
            
            if duplicate_faces:
                selection_set = scene_expoter_tools.create_selection_set(duplicate_faces, mesh)
                
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
                            cmds.delete("%s.f[%d]" % (mesh, face_id))
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
                print("Deleting empty UV set '%s'..." % uvset)
                cmds.polyUVSet(meshNode, delete=True, uvSet=uvset)

    @staticmethod
    def clean_up_uvsets():
        """
        Cleans up empty UV sets from all mesh objects in the scene.
        """
        sel = cmds.ls(type='mesh')
        remainingUvSets = set()
        
        for s in sel:
            scene_expoter_tools.deleteEmptyUvSets(s)
            remainingUvSets.update(cmds.polyUVSet(s, query=True, allUVSets=True))
            cmds.delete(s, all=True, constructionHistory=True)
        
        print('Empty UV sets have been deleted')

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
    def get_all_shading_nodes():
        """
        Get a list of all shading nodes in the scene.
        """
        # List various types of shading nodes
        materials = cmds.ls(materials=True)
        #textures = cmds.ls(type='file')
        shading_groups = cmds.ls(type='shadingEngine')  # For shading groups
        # Combine all lists into one
        shading_nodes = materials + shading_groups
        return shading_nodes
    
    @staticmethod
    def is_node_assigned(node):
        """
        Check if a shading node is connected to any geometry.
        """
        shading_groups = cmds.listConnections(node, type='shadingEngine')
        if shading_groups:
            for sg in shading_groups:
                geometry = cmds.sets(sg, q=True)
                if geometry:
                    return True
        return False
    
    @staticmethod
    def delete_unused_shading_nodes():
        """
        Find all shading nodes that are not connected to any geometry and delete them.
        """
        shading_nodes = scene_expoter_tools.get_all_shading_nodes()
        to_delete = []
        
        for node in shading_nodes:
            if cmds.nodeType(node) == 'shadingEngine':
                # Check if shading group has any incoming connections
                incoming_connections = cmds.listConnections(node, source=True, destination=False)
                if not incoming_connections:
                    to_delete.append(node)
            else:
                if not scene_expoter_tools.is_node_assigned(node):
                    to_delete.append(node)
        
        if to_delete:
            cmds.delete(to_delete)
            print("Deleted unused shading nodes:%s" % to_delete)
        else:
            print("No unused shading nodes found.")
    
    @staticmethod
    def check_and_delete_unused_texture_files():

        # List of texture node types we want to check
        texture_node_types = ['file', 'psdFileTex']
        
        for texture_type in texture_node_types:
            # Get all texture nodes of the current type
            texture_nodes = cmds.ls(type=texture_type)
            
            for node in texture_nodes:
                # Check if the texture node is connected to a shader
                is_connected_to_shader = False
                connections = cmds.listConnections(node, source=False, destination=True, plugs=True)
                
                if connections:
                    for conn in connections:
                        # Check if the connection is to a shading group or material
                        connected_node = conn.split('.')[0]
                        if cmds.objectType(connected_node, isType='shadingEngine') or \
                        cmds.objectType(connected_node, isType='lambert') or \
                        cmds.objectType(connected_node, isType='phong') or \
                        cmds.objectType(connected_node, isType='blinn') or \
                        cmds.objectType(connected_node, isType='surfaceShader') or \
                        cmds.objectType(connected_node, isType='aiStandardSurface'):
                            is_connected_to_shader = True
                            break
                
                if not is_connected_to_shader:
                    # If there are no connections to shaders, delete the node
                    cmds.delete(node)
                    print('Deleted unconnected texture node: %s' % node)
                else:
                    print('Texture node %s is connected to a shader.' % node)
    
    @staticmethod
    def delete_unconnected_place2dTexture_nodes():
        # Get all place2dTexture nodes
        texture_nodes = cmds.ls(type='place2dTexture')
        
        for node in texture_nodes:
            # Check if the place2dTexture node is connected to a file or psdFileTex
            is_connected_to_texture = False
            connections = cmds.listConnections(node, source=False, destination=True, plugs=True)
            
            if connections:
                for conn in connections:
                    # Check if the connection is to a file or psdFileTex
                    connected_node = conn.split('.')[0]
                    if cmds.objectType(connected_node, isType='file') or \
                    cmds.objectType(connected_node, isType='psdFileTex'):
                        is_connected_to_texture = True
                        break
            
            if not is_connected_to_texture:
                # If there are no connections to textures, delete the node
                cmds.delete(node)
                print('Deleted unconnected place2dTexture node: %s' % node)
            else:
                print('place2dTexture node %s is connected to a texture.' % node)

    @staticmethod
    def scene_optimization():
        """
        Performs various scene optimization tasks.
        """
        print('Starting scene optimization...')

        #scene_expoter_tools.clean_up_uvsets()
        

        #scene_expoter_tools.create_model_group()


        scene_expoter_tools.delete_unused_shading_nodes()
        scene_expoter_tools.check_and_delete_unused_texture_files()
        scene_expoter_tools.delete_unconnected_place2dTexture_nodes()
        scene_expoter_tools.delete_unused_shading_nodes()
    
    @staticmethod
    def export_scene():
        print("Exporting FBX")

    @staticmethod
    def check_transforms():
        all_transforms = cmds.ls(type='transform', long=True)
        skip_shapes = cmds.ls(type=('camera', 'light'), long=True)
        skip_transforms = cmds.listRelatives(skip_shapes, parent=True, fullPath=True) or []
        
        for transform in all_transforms:
            if transform in skip_transforms:
                print("Skipping camera/light transform: %s" % transform)
                continue
            
            translation = cmds.getAttr(transform + ".translate")[0]
            rotation = cmds.getAttr(transform + ".rotate")[0]
            scale = cmds.getAttr(transform + ".scale")[0]
            
            is_default_translation = all([abs(t) < 0.0001 for t in translation])
            is_default_rotation = all([abs(r) < 0.0001 for r in rotation])
            is_default_scale = all([abs(s - 1.0) < 0.0001 for s in scale])
            
            if not (is_default_translation and is_default_rotation and is_default_scale):
                cmds.makeIdentity(transform, apply=True, translate=True, rotate=True, scale=True, normal=False)
                print("Freezing transformations for: %s" % transform)
            else:
                print("Skipping default transform: %s" % transform)

    @staticmethod
    def delete_empty_transforms():
        # Get all transform nodes in the scene
        transforms = cmds.ls(type='transform')

        # Iterate through each transform node
        for transform in transforms:
            # Check if the transform node has any children
            children = cmds.listRelatives(transform, children=True)
            
            # If no children, delete the transform node
            if not children:
                print("Deleting empty transform node: {}".format(transform))
                cmds.delete(transform)

    @staticmethod
    def locked_normals_check():
        # Get all meshes in the scene
        meshes = cmds.ls(type='mesh')
        
        # Iterate over each mesh
        for mesh in meshes:
            # Get all vertices of the current mesh
            vertices = cmds.ls("%s.vtx[*]" % mesh, flatten=True)
            
            # Query whether normals are locked for these vertices
            locked_normals = cmds.polyNormalPerVertex(vertices, query=True, allLocked=True)
            
            # If any vertex has locked normals, show a confirmation dialog
            if any(locked_normals):
                # Show confirmation dialog
                result = cmds.confirmDialog(
                    title='Locked Normals Detected',
                    message='Mesh "%s" has locked normals. What would you like to do?' % mesh,
                    button=['Fix', 'Ignore', 'Cancel'],
                    defaultButton='Fix',
                    cancelButton='Cancel',
                    dismissString='Cancel'
                )
                
                # Handle the result
                if result == 'Fix':
                    cmds.polyNormalPerVertex(vertices, unFreezeNormal=True)
                    print("Mesh '%s': Normals were locked and have been unfrozen." % mesh)
                elif result == 'Ignore':
                    print("Mesh '%s': Locked normals ignored." % mesh)
                elif result == 'Cancel':
                    print("Operation canceled by user.")
                    break  # Exit the loop if Cancel is pressed
            else:
                print("Mesh '%s': No locked normals." % mesh)