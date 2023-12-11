import maya.cmds as cmds

verts = cmds.ls(flatten=True, orderedSelection=True)
obj = cmds.ls(verts[0], objectsOnly=True)
history = cmds.listHistory(obj)

for historyNode in history:
    if cmds.nodeType(historyNode) == "skinCluster":
        meshSkinCluster = historyNode

skinVals = cmds.skinPercent(meshSkinCluster, query=True, value=True)
print(skinVals)

vtx_list = []
sel = cmds.ls(sl=True, fl=True)

for s in sel:
    vtx_list.append(s)

print(vtx_list)

# Iterate through vtx_list and set the skin weights
for vtx in vtx_list:
    vtx_index = int(vtx.split("[")[1].split("]")[0])  # Extract vertex index from the string
    
    # Set individual weights for each influence
    for i, weight in enumerate(skinVals):
        cmds.setAttr(meshSkinCluster + '.weightList[{0}].weights[{1}]'.format(vtx_index, i), weight)
