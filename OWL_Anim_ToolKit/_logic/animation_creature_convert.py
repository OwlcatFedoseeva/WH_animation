import maya.cmds as cmds

def scale_translate_keys(scale=100.0):
    meshes = cmds.ls(type="mesh") or []
    if meshes:
        # найти их трансформы (родительские ноды)
        mesh_parents = list(set(cmds.listRelatives(meshes, parent=True, fullPath=True) or []))
        if mesh_parents:
            try:
                cmds.delete(mesh_parents)
                print("Удалены mesh объекты: {}".format(mesh_parents))
            except Exception as e:
                cmds.warning("Не удалось удалить меши: {}".format(e))
    
    # получить все джойнты
    joints = cmds.ls(type="joint")

    if not joints:
        cmds.warning("В сцене нет joint'ов.")
        return
    
    for jnt in joints:
        for attr in ["translateX", "translateY", "translateZ"]:
            anim_curve = cmds.listConnections(jnt + "." + attr, type="animCurve", s=True, d=False)
            if anim_curve:
                # умножаем все значения ключей
                cmds.scaleKey(jnt, attribute=attr, valueScale=scale)
                print("Умножил ключи на {} для {}.{}".format(scale, jnt, attr))

# Запуск
#scale_translate_keys(100)
