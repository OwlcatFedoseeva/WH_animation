import maya.cmds as cmds

_logger = None  # приватная переменная

def set_logger(external_logger):
    global _logger
    _logger = external_logger

def log(msg):
    if _logger and _logger != log:
        _logger(msg)
    else:
        print(msg)

def remove_namespaces():
    '''Removes all non-default namespaces.'''
    all_namespaces = [x for x in cmds.namespaceInfo(listOnlyNamespaces=True, recurse=True)
                      if x not in ("UI", "shared")]
    all_namespaces.sort(key=len, reverse=True)
    for ns in all_namespaces:
        if cmds.namespace(exists=ns):
            cmds.namespace(removeNamespace=ns, mergeNamespaceWithRoot=True)
    log("Removed namespaces.")

def imprtRef():
    '''Imports all referenced instances into the scene.'''
    all_ref_paths = cmds.file(q=True, reference=True) or []
    for ref_path in all_ref_paths:
        if cmds.referenceQuery(ref_path, isLoaded=True):
            cmds.file(ref_path, importReference=True)
            new_ref_paths = cmds.file(q=True, reference=True)
            if new_ref_paths:
                for new_ref_path in new_ref_paths:
                    if new_ref_path not in all_ref_paths:
                        all_ref_paths.append(new_ref_path)
    log('Imported all references.')

def delete_non_reference_objects():
    '''Удаляет все объекты, которые не принадлежат ни одному референсу.'''
    all_transforms = cmds.ls(type='transform', long=True)
    for node in all_transforms:
        # Пропускаем корневые элементы интерфейса
        if node in ['|persp', '|top', '|front', '|side']:
            continue

        try:
            if not cmds.referenceQuery(node, isNodeReferenced=True):
                cmds.delete(node)
        except:
            continue  # безопасно игнорируем ошибки на случай нестабильных нод
    log("🗑️ Удалены все объекты, не входящие в референсы.")

def delete_non_joint_non_locator_transforms():
    '''Удаляет все transform-ноды, кроме суставов (joint), локаторов (locator) и камер (camera).'''

    all_transforms = cmds.ls(type="transform", long=True) or []
    for node in all_transforms:
        if not cmds.objExists(node):
            continue

        # Пропускаем кости
        if cmds.nodeType(node) == "joint":
            continue

        shapes = cmds.listRelatives(node, shapes=True, fullPath=True) or []
        shape_types = [cmds.nodeType(s) for s in shapes if cmds.objExists(s)]

        # Пропускаем локаторы и камеры
        if "locator" in shape_types or "camera" in shape_types:
            continue

        try:
            cmds.delete(node)
        except Exception:
            pass

    log("🧹 Удалены все трансформы, кроме костей, локаторов и камер.")
def delete_empty_display_layers():
    all_layers = cmds.ls(type="displayLayer")
    all_layers = [layer for layer in all_layers if layer != "defaultLayer"]
    for layer in all_layers:
        objects_in_layer = cmds.editDisplayLayerMembers(layer, query=True) or []
        if not objects_in_layer:
            cmds.delete(layer)
            log(f"Deleted empty display layer: {layer}")

