import maya.cmds as cmds
import _logic.logging_process as logging_process
import importlib

importlib.reload(logging_process)
from _logic.logging_process import UILogger


def delete_empty_display_layers(logger=None):
    all_layers = cmds.ls(type="displayLayer")
    all_layers = [layer for layer in all_layers if layer != "defaultLayer"]
    for layer in all_layers:
        objects_in_layer = cmds.editDisplayLayerMembers(layer, query=True) or []
        if not objects_in_layer:
            cmds.delete(layer)
            if logger:
                logger.log(f"🗑 Удалён пустой слой: {layer}", color="orange")

def get_top_level_locators(logger=None):
    # Get all top-level nodes in the scene
    top_nodes = cmds.ls(assemblies=True)

    top_level_locators = []

    for node in top_nodes:
        # Check if the top node is a locator by finding a child shape of type "locator"
        children = cmds.listRelatives(node, shapes=True, type="locator")
        if children:
            if logger:
                logger.log(f"Locator found: {node}")
            top_level_locators.append(node)
        # If the top node is a joint, create a locator and parent the joint under it
        elif cmds.nodeType(node) == "joint":
            locator = cmds.spaceLocator(name=node + "_locator")[0]
            cmds.setAttr(locator + ".translateX", 0)
            cmds.setAttr(locator + ".translateY", 0)
            cmds.setAttr(locator + ".translateZ", 0)
            cmds.parent(node, locator)
            top_level_locators.append(locator)

    return top_level_locators


def bake_wh2(start_frame, end_frame, rotate_set, translate_set, logger=None):

    if logger:
        logger.log("🟢 WH2: запекаем анимацию по наборам", color="green")

    if rotate_set:
        cmds.bakeResults(
            rotate_set,
            time=(start_frame, end_frame),
            sampleBy=1,
            simulation=True,
            disableImplicitControl=True,
            preserveOutsideKeys=True,
            sparseAnimCurveBake=False,
            removeBakedAttributeFromLayer=False,
            bakeOnOverrideLayer=False,
            at=["rx", "ry", "rz"]
        )
        if logger:
            logger.log(f"🔁 Запечена ротация для {len(rotate_set)} суставов", color="orange")

    if translate_set:
        cmds.bakeResults(
            translate_set,
            time=(start_frame, end_frame),
            sampleBy=1,
            simulation=True,
            disableImplicitControl=True,
            preserveOutsideKeys=True,
            sparseAnimCurveBake=False,
            removeBakedAttributeFromLayer=False,
            bakeOnOverrideLayer=False,
            at=["tx", "ty", "tz"]
        )
        if logger:
            logger.log(f"🔁 Запечена трансляция для {len(translate_set)} суставов", color="orange")

    # Очистка
    #delete_empty_display_layers(logger=logger)

    if logger:
        logger.log("✅ WH2: запекание завершено", color="green")


def bake_default(obj_list, start_frame, end_frame, logger=None):
    # Найти Rotate_AnimSet и Translate_AnimSet с любым префиксом (неймспейс)
    rotate_sets = cmds.ls("*:Rotate_AnimSet", "Rotate_AnimSet")
    translate_sets = cmds.ls("*:Translate_AnimSet", "Translate_AnimSet")

    rotate_set = rotate_sets[0] if rotate_sets else None
    translate_set = translate_sets[0] if translate_sets else None

    if rotate_set and translate_set:
        if logger:
            logger.log(f"Using WH2-style animation baking (sets detected).", color="orange") 
            bake_wh2(start_frame, end_frame, rotate_set, translate_set)
    else:
        if logger:
            logger.log(f"Using fallback baking (sets not detected).", color="orange")
            all_joints = cmds.ls(type="joint", long=True)
            if not all_joints:
                cmds.warning("No joints found for baking.")
                return
            cmds.bakeResults(all_joints, 
                            time=(start_frame, end_frame),
                            sampleBy=1,   
                            simulation=True,
                            disableImplicitControl=True,
                            preserveOutsideKeys=True,
                            sparseAnimCurveBake=False,
                            removeBakedAttributeFromLayer=False,
                            bakeOnOverrideLayer=False,
                            at=["tx", "ty", "tz", "rx", "ry", "rz"])

def bake_animation_for_project(project_name, start_frame, end_frame, logger=None):
    if project_name == "WH2":
        bake_default(start_frame, end_frame)  # WH2 теперь автоматически определится по сетам
    elif project_name == "WH1":
        # Добавим сюда свой вариант позже
        bake_default(start_frame, end_frame)
    else:
        bake_default(start_frame, end_frame)

    if logger:
        logger.log("✅ Animation baking completed.")


def anim_channels_cleanup(logger=None):
    # List of objects to check
    jntList = ['ParentForExportDelete', 'UMA_Male_Rig', 'Global', 'Position', 'L_Pre_Up_Leg', 'L_Up_leg', 'L_leg', 'L_foot', 'L_toe', 
            'L_toe_ADJ', 'L_foot_ADJ', 'L_leg_ADJ', 'L_Ankle_ADJ', 'L_Up_leg_ADJ', 'L_Sceart_____Back_00', 'L_Sceart_Back_02_ADJ', 
            'L_Sceart_Back_01_ADJ', 'L_Sceart_____Front_00', 'L_Sceart_Font_02_ADJ', 'L_Sceart_Front_01_ADJ', 'Spine_1', 'Spine_2', 
            'Spine_3', 'Neck', 'Head', 'Head_ADJ', 'Head_Helmet_ADJ', 'Skull_Scale', 'Face_Scale', 'L_eyebrow', 'R_eyebrow', 
            'R_eyelish_top', 'R_eyelish_top_end', 'L_eyelish_top', 'R_eyelish_bottom', 'L_eyelish_top_end', 'R_eyelish_bottom_end', 
            'L_eyelish_bottom', 'L_eyelish_bottom_end', 'R_eye', 'R_eye_end', 'L_eye', 'L_eye_end', 'Jaw_Scale', 'Neck_ADJ', 
            'L_Clavicle', 'L_Up_arm', 'L_ForeArm', 'L_Hand', 'L_Toe_1_01', 'L_Toe_1_02', 'L_Toe_1_02_ADJ', 'L_Toe_1_01_ADJ', 
            'L_Toe_2_01', 'L_Toe_2_02', 'L_Toe_2_02_ADJ', 'L_Toe_2_01_ADJ', 'L_Toe_3_01', 'L_Toe_3_02', 'L_Toe_3_02_ADJ', 
            'L_Toe_3_01_ADJ', 'L_Hand_ADJ', 'L_ForeArm_ADJ', 'L_ForeArm_Twist_ADJ', 'L_Up_Arm_Muscl_ADJ', 'L_Up_arm_ADJ', 
            'L_Clavicle_ADJ', 'L_Neck_Muscl', 'L_Neck_Muscl_ADJ', 'R_Neck_Muscl', 'R_Neck_Muscl_ADJ', 'Spine_3_ADJ', 
            'L_back_w_____slot_10', 'L_back_weapon_slot_10', 'L_back_weapon_slot_10_ADJ', 'L_back_w_____slot_07', 
            'L_back_weapon_slot_07', 'L_back_weapon_slot_07_ADJ', 'C_back_w_____slot_08', 'C_back_weapon_slot_08', 
            'C_back_weapon_slot_08_ADJ', 'R_back_w_____slot_09', 'R_back_weapon_slot_09', 'R_back_weapon_slot_09_ADJ', 
            'R_back_w_____slot_06', 'R_back_weapon_slot_06', 'R_back_weapon_slot_06_ADJ', 'R_Clavicle', 'R_Up_arm', 'R_ForeArm', 
            'R_Hand', 'R_Toe_1_01', 'R_Toe_1_02', 'R_Toe_1_02_ADJ', 'R_Toe_1_01_ADJ', 'R_Toe_2_01', 'R_Toe_2_02', 'R_Toe_2_02_ADJ', 
            'R_Toe_2_01_ADJ', 'R_Toe_3_01', 'R_Toe_3_02', 'R_Toe_3_02_ADJ', 'R_Toe_3_01_ADJ', 'R_Hand_ADJ', 'R_ForeArm_ADJ', 
            'R_ForeArm_Twist_ADJ', 'R_Up_Arm_Muscl_ADJ', 'R_Up_arm_ADJ', 'R_Clavicle_ADJ', 'Spine_2_ADJ', 'C_back_w_____slot_11', 
            'C_back_weapon_slot_11', 'C_back_weapon_slot_11_ADJ', 'Stomach', 'Stomach_ADJ', 'Spine_1_ADJ', 'R_Pre_Up_Leg', 
            'R_Up_leg', 'R_leg', 'R_foot', 'R_toe', 'R_toe_ADJ', 'R_foot_ADJ', 'R_leg_ADJ', 'R_Ankle_ADJ', 'R_Up_leg_ADJ', 
            'R_Sceart_____Back_00', 'R_Sceart_Back_02_ADJ', 'R_Sceart_Back_01_ADJ', 'R_Sceart_____Front_00', 'R_Sceart_Font_02_ADJ', 
            'R_Sceart_Front_01_ADJ', 'Pelvis_ADJ', 'R_front_w____scale_01', 'R_front_weapon_slot_01', 'R_front_weapon_slot_01_ADJ', 
            'R_front_w____scale_02', 'R_front_weapon_slot_02', 'R_front_weapon_slot_02_ADJ', 'C_front_w____scale_03', 
            'C_front_weapon_slot_03', 'C_front_weapon_slot_03_ADJ', 'L_front_w____scale_04', 'L_front_weapon_slot_04', 
            'L_front_weapon_slot_04_ADJ', 'L_front_w____scale_05', 'L_front_weapon_slot_05', 'L_front_weapon_slot_05_ADJ']

    # Check if objects have keys on translate or scale channels
    for obj in jntList:
        if cmds.objExists(obj):
            # Check translate channels
            translate_keys = cmds.keyframe(obj, attribute='translate', query=True, keyframeCount=True)
            # Check scale channels
            scale_keys = cmds.keyframe(obj, attribute='scale', query=True, keyframeCount=True)
            
            if translate_keys > 0:
                cmds.cutKey(obj, attribute='translate')
                if logger:
                    logger.log('%s has animation keys on translate channels and they have been deleted.' % obj)
            
            if scale_keys > 0:
                cmds.cutKey(obj, attribute='scale')
                if logger:
                    logger.log('%s has animation keys on scale channels and they have been deleted.' % obj)
    

def clean_up(logger=None):
    jnts = ['Pelvis', 'Root_M']
    excluded_joints = ['L_Sceart_____Back_00', 'L_Sceart_Back_01', 'L_Sceart_Back_02', 'L_Sceart_Back_02_ADJ', 'L_Sceart_Back_01_ADJ', 
                    'L_Sceart_____Front_00', 'L_Sceart_Front_01', 'L_Sceart_Font_02', 'L_Sceart_Font_02_ADJ', 'L_Sceart_Front_01_ADJ', 
                    'R_Sceart_____Back_00', 'R_Sceart_Back_01', 'R_Sceart_Back_02', 'R_Sceart_Back_02_ADJ', 'R_Sceart_Back_01_ADJ', 
                    'R_Sceart_____Front_00', 'R_Sceart_Front_01', 'R_Sceart_Font_02', 'R_Sceart_Font_02_ADJ', 'R_Sceart_Front_01_ADJ']

    for jnt in jnts:
        if cmds.objExists(jnt):
            pelvis_joint = jnt  
            children = cmds.listRelatives(pelvis_joint, children=True, ad=True) or []

            for attr in ["sx", "sy", "sz"]:
                cmds.cutKey(jnt, attribute=attr, clear=True)

            for ch in children:
                if cmds.nodeType(ch) == "joint":
                    for attr in ["sx", "sy", "sz"]:
                        cmds.cutKey(ch, attribute=attr, clear=True)

                    if ch not in excluded_joints:
                        for attr in ["tx", "ty", "tz"]:
                            cmds.cutKey(ch, attribute=attr, clear=True)
                    else:
                        pass

                    for attr in ["sx", "sy", "sz"]:
                        connections = cmds.listConnections(ch + "." + attr, s=True, d=False)
                        if connections:
                            for connection in connections:
                                cmds.disconnectAttr(connection, ch + "." + attr)

            parents = cmds.listRelatives(jnt, parent=True, type='transform', fullPath=True) or []
            for parent in parents:
                keyable_attrs = cmds.listAttr(parent, keyable=True) or []
                for attr in keyable_attrs:
                    cmds.cutKey(parent, attribute=attr, clear=True)

def cleanUp(race=None, logger=None):
    '''
    This function cleans up the animation from unwanted channels in certain bones. Then deletes original Rig "Group" node.
    '''
    if logger:
        logger.log("Clean up for for Humans and Eldar")
        
    no_key_list = ["L_front_w____scale_05", "L_front_weapon_slot_05", "L_front_weapon_slot_05_ADJ","L_front_w____scale_04", 
            "L_front_weapon_slot_04", "L_front_weapon_slot_04_ADJ", "R_front_w____scale_02", "R_front_weapon_slot_02", 
            "R_front_weapon_slot_02_ADJ", "C_back_w_____slot_11", "C_back_weapon_slot_11", "C_back_weapon_slot_11_ADJ", 
            "R_front_w____scale_01", "R_front_weapon_slot_01", "R_front_weapon_slot_01_ADJ", "C_front_w____scale_03", 
            "C_front_weapon_slot_03", "C_front_weapon_slot_03_ADJ", "R_back_w_____slot_06", "R_back_weapon_slot_06", 
            "R_back_weapon_slot_06_ADJ", "R_back_w_____slot_09", "R_back_weapon_slot_09", "R_back_weapon_slot_09_ADJ", 
            "C_back_w_____slot_08", "C_back_weapon_slot_08", "C_back_weapon_slot_08_ADJ", "L_back_w_____slot_07", 
            "L_back_weapon_slot_07", "L_back_weapon_slot_07_ADJ", "L_back_w_____slot_10", "L_back_weapon_slot_10", 
            "L_back_weapon_slot_10_ADJ"]
    
    for name in no_key_list:
        if cmds.objExists(name):
            cmds.cutKey(name)

    if cmds.objExists('Group'):
        cmds.delete('Group')
    else:
        pass


    race_joint_list = []
    if race in ["Human", "Eldar"]:
        race_joint_list = ['Spine_1', 'Spine_2', 'Spine_3', 'Neck', 'Head', 'Head_ADJ', 'Head_Helmet_ADJ', 'Head_helmet_ADJ',
        'Skull_Scale', 'Face_Scale',  'R_eyelish_top', 'R_eyelish_top_end',
        'L_eyelish_top', 'L_eyelish_top_end', 'R_eyelish_bottom', 'R_eyelish_bottom_end', 'L_eyelish_bottom',
        'L_eyelish_bottom_end', 'R_eye', 'R_eye_end', 'L_eye', 'L_eye_end', 'Jaw_Scale', 'Neck_ADJ', 'L_Clavicle',
        'L_Up_arm', 'L_ForeArm', 'L_Hand', 'L_Toe_1_01', 'L_Toe_1_02', 'L_Toe_1_02_ADJ', 'L_Toe_1_01_ADJ',
        'L_Toe_2_01', 'L_Toe_2_02', 'L_Toe_2_02_ADJ', 'L_Toe_2_01_ADJ', 'L_Toe_3_01', 'L_Toe_3_02',
        'L_Toe_3_02_ADJ', 'L_Toe_3_01_ADJ', 'L_Hand_ADJ', 'L_ForeArm_ADJ', 'L_ForeArm_Twist_ADJ',
        'L_Up_Arm_Muscl_ADJ', 'L_Up_arm_ADJ', 'L_Clavicle_ADJ', 'L_Neck_Muscl', 'L_Neck_Muscl_ADJ', 'R_Neck_Muscl',
        'R_Neck_Muscl_ADJ', 'Spine_3_ADJ', 'L_back_w_____slot_10', 'L_back_weapon_slot_10',
        'L_back_weapon_slot_10_ADJ', 'L_back_w_____slot_07', 'L_back_weapon_slot_07', 'L_back_weapon_slot_07_ADJ',
        'C_back_w_____slot_08', 'C_back_weapon_slot_08', 'C_back_weapon_slot_08_ADJ', 'R_back_w_____slot_09',
        'R_back_weapon_slot_09', 'R_back_weapon_slot_09_ADJ', 'R_back_w_____slot_06', 'R_back_weapon_slot_06',
        'R_back_weapon_slot_06_ADJ', 'R_Clavicle', 'R_Up_arm', 'R_ForeArm', 'R_Hand', 'R_Toe_1_01', 'R_Toe_1_02',
        'R_Toe_1_02_ADJ', 'R_Toe_1_01_ADJ', 'R_Toe_2_01', 'R_Toe_2_02', 'R_Toe_2_02_ADJ', 'R_Toe_2_01_ADJ',
        'R_Toe_3_01', 'R_Toe_3_02', 'R_Toe_3_02_ADJ', 'R_Toe_3_01_ADJ', 'R_Hand_ADJ',
        'R_ForeArm_ADJ', 'R_ForeArm_Twist_ADJ', 'R_Up_Arm_Muscl_ADJ', 'R_Up_arm_ADJ', 'R_Clavicle_ADJ',
        'Spine_2_ADJ', 'C_back_w_____slot_11', 'C_back_weapon_slot_11', 'C_back_weapon_slot_11_ADJ', 'Stomach',
        'Stomach_ADJ', 'Spine_1_ADJ', 'R_leg', 'R_foot', 'R_toe',  'L_leg', 'L_foot', 'L_toe', 'L_Up_leg', 'R_Pre_Up_Leg']

    elif race == "SpaceMarine":
        race_joint_list = ['Spine_1', 'Spine_2', 'Spine_3', 'Neck', 'Head', 'Head_ADJ', 'Head_Helmet_ADJ', 'Head_helmet_ADJ',
        'Skull_Scale', 'Face_Scale', 'R_eyelish_top', 'R_eyelish_top_end',
        'L_eyelish_top', 'L_eyelish_top_end', 'R_eyelish_bottom', 'R_eyelish_bottom_end', 'L_eyelish_bottom',
        'L_eyelish_bottom_end', 'R_eye', 'R_eye_end', 'L_eye', 'L_eye_end', 'Jaw_Scale', 'Neck_ADJ', 'L_Clavicle',
        'L_Up_arm', 'L_ForeArm', 'L_Hand', 'L_Toe_1_01', 'L_Toe_1_02', 'L_Toe_1_02_ADJ', 'L_Toe_1_01_ADJ',
        'L_Toe_2_01', 'L_Toe_2_02', 'L_Toe_2_02_ADJ', 'L_Toe_2_01_ADJ', 'L_Toe_3_01', 'L_Toe_3_02',
        'L_Toe_3_02_ADJ', 'L_Toe_3_01_ADJ', 'L_Hand_ADJ', 'L_ForeArm_ADJ', 'L_ForeArm_Twist_ADJ',
        'L_Up_Arm_Muscl_ADJ', 'L_Up_arm_ADJ', 'L_Clavicle_ADJ', 'L_Neck_Muscl', 'L_Neck_Muscl_ADJ', 'R_Neck_Muscl',
        'R_Neck_Muscl_ADJ', 'Spine_3_ADJ', 'L_back_w_____slot_10', 'L_back_weapon_slot_10',
        'L_back_weapon_slot_10_ADJ', 'L_back_w_____slot_07', 'L_back_weapon_slot_07', 'L_back_weapon_slot_07_ADJ',
        'C_back_w_____slot_08', 'C_back_weapon_slot_08', 'C_back_weapon_slot_08_ADJ', 'R_back_w_____slot_09',
        'R_back_weapon_slot_09', 'R_back_weapon_slot_09_ADJ', 'R_back_w_____slot_06', 'R_back_weapon_slot_06',
        'R_back_weapon_slot_06_ADJ', 'R_Clavicle', 'R_Up_arm', 'R_ForeArm', 'R_Hand', 'R_Toe_1_01', 'R_Toe_1_02',
        'R_Toe_1_02_ADJ', 'R_Toe_1_01_ADJ', 'R_Toe_2_01', 'R_Toe_2_02', 'R_Toe_2_02_ADJ', 'R_Toe_2_01_ADJ',
        'R_Toe_3_01', 'R_Toe_3_02', 'R_Toe_3_02_ADJ', 'R_Toe_3_01_ADJ', 'R_Hand_ADJ',
        'R_ForeArm_ADJ', 'R_ForeArm_Twist_ADJ', 'R_Up_Arm_Muscl_ADJ', 'R_Up_arm_ADJ', 'R_Clavicle_ADJ',
        'Spine_2_ADJ', 'C_back_w_____slot_11', 'C_back_weapon_slot_11', 'C_back_weapon_slot_11_ADJ', 'Stomach',
        'Stomach_ADJ', 'Spine_1_ADJ']

    for name in race_joint_list:
            if cmds.objExists(name):
                cmds.cutKey(name, at='translate')
            else:
                print(f"{name} is not in the scene. Skipping...")



    sel = cmds.ls(sl=True, dag=True)

    if cmds.objExists('Pelvis'):
        sel = cmds.listRelatives('Pelvis', c=True, ad=True, f=True) or []
    else:
        sel = []

    for obj in sel:
        if not cmds.objExists(obj):
            continue

        obj_type = cmds.objectType(obj)
        if obj_type in ['mesh', 'locator', 'parentConstraint', 'orientConstraint']:
            try:
                cmds.delete(obj)
            except Exception as e:
                print(f"Failed to delete {obj}: {e}")

    if cmds.objExists('Group'):  # дублирующая проверка, можно убрать
        cmds.delete('Group')

    if logger:
        logger.log("Skeleton clean up is complete")


def group_constraints_under_joint(root_joint="Pelvis", group_name="toDel_Const_GP", logger=None):
    """
    Находит все parentConstraint-ноды под указанной костью и группирует их в отдельную группу.
    """
    if not cmds.objExists(root_joint):
        cmds.error(f"❌ Кость '{root_joint}' не найдена в сцене.")

    # Получаем всех потомков рутовой кости
    descendants = cmds.listRelatives(root_joint, allDescendents=True, fullPath=True) or []

    # Фильтруем только parentConstraint-ноды
    constraints = [node for node in descendants if cmds.nodeType(node) == "parentConstraint"]

    if not constraints:
        logger.log(f"ℹ️ Нет parentConstraint-ноды под '{root_joint}' для переноса. --> Пропускаю.")
        return

    # Создаем группу, если ее нет
    if not cmds.objExists(group_name):
        cmds.group(em=True, name=group_name)

    # Переносим constraint-ноды в группу
    for constraint in constraints:
        try:
            cmds.parent(constraint, group_name)
        except Exception as e:
            logger.log(f"⚠️ Не удалось переместить {constraint}: {e}")

    logger.log(f"📦 Найдено и сгруппировано {len(constraints)} constraint-нод под '{root_joint}' в '{group_name}'.")

    return group_name


def bake_animation_from_root(root_joint, start, end):
    '''Запекает анимацию на всех дочерних костях, начиная с указанной рутовой кости. Возвращает уникальные имена через полные пути.'''
    if not cmds.objExists(root_joint):
        cmds.error(f"Кость {root_joint} не найдена.")

    bake_list = cmds.listRelatives(root_joint, allDescendents=True, type="joint", fullPath=True) or []
    root_full = cmds.ls(root_joint, long=True)
    if root_full:
        bake_list.append(root_full[0])

    bake_list = list(set(bake_list))

    cmds.select(bake_list, r=True)
    cmds.bakeResults(
        simulation=True, time=(start, end),
        sampleBy=1,disableImplicitControl=True,
        preserveOutsideKeys=True, sparseAnimCurveBake=False,
        removeBakedAttributeFromLayer=False, removeBakedAnimFromLayer=False,
        bakeOnOverrideLayer=False, minimizeRotation=True,
        at=["tx", "ty", "tz", "rx", "ry", "rz"]
    )
    return bake_list

def cut_keys_for_objects(obj_list, attributes, start_frame=None, end_frame=None, logger=None):
    """
    Удаляет ключи по заданным атрибутам у списка объектов.
    
    :param obj_list: список объектов (имена строкой)
    :param attributes: список атрибутов, например ["scaleX", "scaleY", "scaleZ"]
    :param start_frame: начальный кадр (если None — возьмётся текущий minTime)
    :param end_frame: конечный кадр (если None — возьмётся текущий maxTime)
    """
    if start_frame is None:
        start_frame = cmds.playbackOptions(q=True, min=True)
    if end_frame is None:
        end_frame = cmds.playbackOptions(q=True, max=True)

    for obj in obj_list:
        if not cmds.objExists(obj):
            continue
        for attr in attributes:
            try:
                cmds.cutKey(obj, time=(start_frame, end_frame), attribute=attr, option="keys", cl=True)
            except Exception as e:
                logger.log(f"⚠️ Не удалось удалить ключи у {obj}.{attr}: {e}")


def clear_keys_and_disconnect(obj_list, attributes, start_frame=None, end_frame=None, logger=None):
    """
    Удаляет ключи (включая ключи в анимационных слоях) и отключает входящие соединения от указанных атрибутов объектов.
    """
    if start_frame is None:
        start_frame = cmds.playbackOptions(q=True, min=True)
    if end_frame is None:
        end_frame = cmds.playbackOptions(q=True, max=True)

    # Получаем все animLayer
    anim_layers = cmds.ls(type="animLayer") or []

    for obj in obj_list:
        if not cmds.objExists(obj):
            continue

        for attr in attributes:
            full_attr = f"{obj}.{attr}"

            # 🔹 Удаляем ключи на всех слоях
            for layer in anim_layers:
                try:
                    cmds.animLayer(layer, edit=True, selected=True)  # выбрать слой
                    cmds.cutKey(full_attr, time=(start_frame, end_frame), option="keys", cl=True)
                except Exception as e:
                    logger.log(f"⚠️ Не удалось удалить ключи на {layer} у {full_attr}: {e}")

            # 🔹 Удаляем ключи на базовом уровне
            try:
                cmds.cutKey(full_attr, time=(start_frame, end_frame), option="keys", cl=True)
            except Exception as e:
                logger.log(f"⚠️ Не удалось удалить ключи у {full_attr}: {e}")

            # 🔌 Отключаем входящие соединения
            if cmds.connectionInfo(full_attr, isDestination=True):
                source = cmds.connectionInfo(full_attr, getExactSource=True)
                if source:
                    try:
                        cmds.disconnectAttr(source, full_attr)
                        logger.log(f"🔌 Отключено соединение: {source} → {full_attr}")
                    except Exception as e:
                        logger.log(f"⚠️ Не удалось отключить {source} от {full_attr}: {e}")


def cleanUp_no_key(logger=None):
    '''Removes unwanted keyframes and deletes original rig Group node.'''
    no_key_list = [
        "L_front_w____scale_05", "L_front_weapon_slot_05", "L_front_weapon_slot_05_ADJ", "L_front_w____scale_04", 
        "L_front_weapon_slot_04", "L_front_weapon_slot_04_ADJ", "R_front_w____scale_02", "R_front_weapon_slot_02", 
        "R_front_weapon_slot_02_ADJ", "C_back_w_____slot_11", "C_back_weapon_slot_11", "C_back_weapon_slot_11_ADJ", 
        "R_front_w____scale_01", "R_front_weapon_slot_01", "R_front_weapon_slot_01_ADJ", "C_front_w____scale_03", 
        "C_front_weapon_slot_03", "C_front_weapon_slot_03_ADJ", "R_back_w_____slot_06", "R_back_weapon_slot_06", 
        "R_back_weapon_slot_06_ADJ", "R_back_w_____slot_09", "R_back_weapon_slot_09", "R_back_weapon_slot_09_ADJ", 
        "C_back_w_____slot_08", "C_back_weapon_slot_08", "C_back_weapon_slot_08_ADJ", "L_back_w_____slot_07", 
        "L_back_weapon_slot_07", "L_back_weapon_slot_07_ADJ", "L_back_w_____slot_10", "L_back_weapon_slot_10", 
        "L_back_weapon_slot_10_ADJ"
    ]
    for i in no_key_list:
        if cmds.objExists(i):
            cmds.cutKey(i)
        else:
            continue
        
    if cmds.objExists('Group'):
        cmds.delete('Group')

    if logger:
        logger.log("🧹 Удалены ненужные ключи.")


def is_locator_transform(node: str) -> bool:
    """Проверяет, является ли transform локатором (по типам shapes)."""
    if not cmds.objExists(node):
        return False
    shapes = cmds.listRelatives(node, s=True, fullPath=True) or []
    return any(cmds.objectType(s) == "locator" for s in shapes)

def find_root_transform_heuristic() -> str:
    """
    Находит «разумный» корень сцены:
    - любой верхнеуровневый transform, под которым есть суставы,
      исключая камеры.
    """
    cameras = {"persp", "top", "front", "side"}
    for a in cmds.ls(assemblies=True) or []:
        if a in cameras:
            continue
        if cmds.listRelatives(a, ad=True, type="joint"):
            return a
    return ""

def get_or_build_top_locator(root_hints=None, logger=None) -> str:
    """
    Пытаемся получить top locator штатно; если не нашли — строим.
    root_hints — список возможных имён корневой группы (например «UMA_Male_Rig»).
    """
    # 1) Пробуем штатный поиск
    try:
        tops = get_top_level_locators() or []
    except Exception:
        tops = []
    if tops:
        cand = tops[0]
        if is_locator_transform(cand):
            return cand
        # Если вернулся transform без локатор-шейпа — обернём его
        root = cand
    else:
        # 2) Ищем корень по подсказкам
        root = ""
        for hint in (root_hints or []):
            if hint and cmds.objExists(hint):
                root = hint
                break
        # 3) Если нет подсказок — эвристика
        if not root:
            root = find_root_transform_heuristic()

    if not root or not cmds.objExists(root):
        cmds.error("Не найден корень рига для обёртки в локатор.")
        return ""

    # Создаём локатор с уникальным именем и снапим его к корню
    loc = cmds.spaceLocator(n="TOP_LOC_AUTO#")[0]

    # Переподвешиваем корень под локатор (мировая поза сохранится)
    cmds.parent(root, loc)
    if logger:
        logger.log(f"Создан top-локатор {loc} и переподвешен корень {root}.")
    return loc