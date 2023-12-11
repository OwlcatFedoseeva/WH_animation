import maya.cmds as cmds
import os

# Get the name of the currently opened scene
current_scene = cmds.file(q=True, sceneName=True)
file_name = os.path.basename(current_scene)
print("Current Scene: {}".format(file_name))

root = 'Position'

if cmds.objExists(root):
    # Select all objects in the hierarchy
    sel = cmds.select(root, hi=True)
    selected_objects = cmds.ls(selection=True, long=True)

    # Break incoming connections for each attribute in each object
    for obj in selected_objects:
        attributes = cmds.listAttr(obj, k=True)
        print(attributes)
        if attributes:
            for attr in attributes:
                connections = cmds.listConnections(obj + '.' + attr, source=True, destination=False, plugs=True)
                if connections:
                    for connection in connections:
                        cmds.disconnectAttr(connection, obj + '.' + attr)
	cmds.parent(root, world=True)
    cmds.delete('Group', 'Sets') 
    cmds.delete('DeformSet', 'AllSet')
	
	# Get all objects in the scene
    all_objects = cmds.ls(dag=True, long=True)
	
	# Select all objects
    cmds.select(all_objects)
else:
	cmds.select(cl=True)
	root = cmds.joint(n='Position')
	secondary_joint = 'Root_M'
	sel = cmds.select(secondary_joint, hi=True)
	selected_objects = cmds.ls(selection=True, long=True)
	for obj in selected_objects:
    attributes = cmds.listAttr(obj, k=True)

    if attributes:
            for attr in attributes:
                connections = cmds.listConnections(obj + '.' + attr, source=True, destination=False, plugs=True)
                if connections:
                    for connection in connections:
                        cmds.disconnectAttr(connection, obj + '.' + attr)
    cmds.parent(secondary_joint, root)
    cmds.parent(root, world=True)
    cmds.delete('Group', 'Sets') 
    cmds.delete('DeformSet', 'AllSet')