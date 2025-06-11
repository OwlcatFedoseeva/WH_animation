import maya.cmds as cmds
import importlib
import OWL_Anim_ToolKit._logic.bake_anim_utils as bake_anim_utils
import OWL_Anim_ToolKit._logic.clear_unwanted_anim_logic as CleanAnimLogic
import OWL_Anim_ToolKit._logic.file_handling_utils as file_handling_utils


importlib.reload(bake_anim_utils)
importlib.reload(CleanAnimLogic)
importlib.reload(file_handling_utils)


_logger = None  # приватная переменная

def set_logger(external_logger):
    global _logger
    _logger = external_logger

def log(msg):
    if _logger and _logger != log:
        _logger(msg)
    else:
        print(msg)

file_handling_utils.set_logger(log)
bake_anim_utils.set_logger(log)

def scale_anim():
    bake_anim_utils.anim_channels_cleanup()
    
    start_frame = cmds.playbackOptions(q=True, min=True)
    end_frame = cmds.playbackOptions(q=True, max=True)
    
    jnts = ['Pelvis', 'Root_M']
    
    if cmds.objExists("Position"):
        cmds.rename("Position", "Old_Position")
    pelvis_joint = None
    
    
    for jnt in jnts:
        if cmds.objExists(jnt):
            pelvis_joint = jnt
            children = cmds.listRelatives(pelvis_joint, children=True, ad=True) or []
            break

    if pelvis_joint is None:
        raise ValueError("No joint in the list exists in the scene")

    bake_anim_utils.clean_up()

    for child in children:
        if cmds.nodeType(child) == "transform" and cmds.nodeType(cmds.listRelatives(child, shapes=True) or []) != "joint":
            cmds.delete(child)

    log("Трансформ ноды под pelvis удалены.")
    
    jntList = cmds.listRelatives(pelvis_joint, type='joint', allDescendents=True) or []
    
    objs_with_translate = [j for j in jntList if cmds.objExists(j) and cmds.keyframe(j, attribute='translate', query=True, keyframeCount=True) > 0]
    if objs_with_translate:
        cmds.bakeResults(objs_with_translate,
                         time=(start_frame, end_frame),
                         sampleBy=1,
                         simulation=True,
                         disableImplicitControl=True,
                         preserveOutsideKeys=True,
                         sparseAnimCurveBake=False,
                         removeBakedAttributeFromLayer=False,
                         bakeOnOverrideLayer=False,
                         attribute=['translateX', 'translateY', 'translateZ'])
    
    
    

    #=====Get the top locator of the animation

    top_locators = bake_anim_utils.get_top_level_locators()

    for top_locator in top_locators:
        log(top_locator)
        for axis in 'XYZ':
            cmds.setAttr(f'{top_locator}.scale{axis}', 100)
        
    cmds.select(cl=True)


    pos = cmds.joint(n='Position')
    Pelv = cmds.joint(n='Proxi_Pelvis')

    posMatch = cmds.parentConstraint(pelvis_joint, Pelv, mo=0)


    cmds.bakeResults(Pelv, 
                     time=(start_frame, end_frame),
                     sampleBy=1, 
                     simulation=True,
                     disableImplicitControl=True,
                     preserveOutsideKeys=True,
                     sparseAnimCurveBake=False,
                     removeBakedAttributeFromLayer=False,
                     bakeOnOverrideLayer=False,
                     attribute=['translateX', 'translateY', 'translateZ', 'rotateX', 'rotateY', 'rotateZ']
                           )
    cmds.delete(posMatch)

    for top_locator in top_locators:
        cmds.makeIdentity(top_locator, apply=True, scale=True)

    cmds.parent(pelvis_joint, pos)
    posMatch = cmds.parentConstraint(Pelv, pelvis_joint, mo=0)
    
    cmds.bakeResults(pelvis_joint,
                     time=(start_frame, end_frame),
                     sampleBy=1, 
                     simulation=True,
                     disableImplicitControl=True,
                     preserveOutsideKeys=True,
                     sparseAnimCurveBake=False,
                     removeBakedAttributeFromLayer=False,
                     bakeOnOverrideLayer=False,
                     attribute=['translateX', 'translateY', 'translateZ', 'rotateX', 'rotateY', 'rotateZ']
                     )

    to_del = (posMatch or []) + [Pelv] + top_locators

    for obj in to_del:
        if cmds.objExists(obj):
            cmds.delete(obj)
            log(f"Удален: {obj}")   
        else:
            log(f"В сцене нет объекта {obj} для удаления.")
            continue
    log("Процесс увеличения скелета - завершен.")


def scale_trans_channels():
    jnts = cmds.listRelatives('Pelvis', type='joint', allDescendents=True) or []
    log(jnts)
    #jnts.append('Pelvis')  # Include the
    
    for j in jnts:
        keyframes = cmds.keyframe(j, attribute=['translateX', 'translateY', 'translateZ'], query=True)
        log(j, keyframes)
        if not keyframes:
            continue
    
        transX, transY, transZ = cmds.getAttr(j + '.translate')[0]
        new_trans = [transX * 100, transY * 100, transZ * 100]
        attrs = ['translateX', 'translateY', 'translateZ']
        
        if len(keyframes) == 1:
            frame = keyframes[0]
            cmds.currentTime(frame)
            for attr, val in zip(attrs, new_trans):
                cmds.setKeyframe(j, time=frame, attribute=attr, value=val)
        else:
            start_frame = min(keyframes)
            end_frame = max(keyframes)
            for attr, val in zip(attrs, new_trans):
                cmds.keyframe(j, time=(start_frame, end_frame), attribute=attr, valueChange=val)
        
        log(f"🔧 Масштабирована трансляция для кости: {j}")


def delete_adj_and_w_joints():
    all_joints = cmds.ls(type="joint")

    # Фильтруем кости с "_ADJ" или "_w_" в названии
    joints_to_delete = [jnt for jnt in all_joints if "_ADJ" in jnt or "_w_" in jnt]

    if not joints_to_delete:
        log("✅ Нет костей с '_ADJ' или '_w_' для удаления.")
        return

    # Удаляем кости
    cmds.delete(joints_to_delete)

    log(f"🗑 Удалено {len(joints_to_delete)} костей с '_ADJ' или '_w_' в названии.")


def scale_translate_keys_except_first(objs=None, scale=100):
    """
    Умножает все translate-ключи (translateX, Y, Z), кроме первого, на указанный scale для заданных объектов.
    Если objs не задан, берёт выделенные объекты.
    """
    if objs is None:
        objs = cmds.ls(selection=True)
    for obj in objs:
        for attr in ["translateX", "translateY", "translateZ"]:
            # Получаем список всех ключей по этому каналу
            key_times = cmds.keyframe(obj, attribute=attr, query=True, timeChange=True)
            if not key_times or len(key_times) <= 1:
                continue
            # Первый ключ не трогаем
            first_time = min(key_times)
            for t in key_times:
                if t == first_time:
                    continue
                # Получаем значение
                val = cmds.keyframe(obj, attribute=attr, query=True, eval=True, time=(t,))[0]
                # Устанавливаем новое значение
                cmds.setKeyframe(obj, attribute=attr, time=(t,), value=val * scale)
            log(f"Обработан {obj}.{attr}: ключи кроме первого умножены на {scale}")

def run_scale():
    scale_anim()
    #scale_trans_channels()
    delete_adj_and_w_joints()
    jnts = cmds.listRelatives('Pelvis', type='joint', allDescendents=True) or []
    scale_translate_keys_except_first(jnts, scale=100)
        
