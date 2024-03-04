import pymel.core as pm

weapon_type_R = 'transform'  
weaponRList = []
weaponR = []
for obj in pm.ls(type=weapon_type_R):
    if obj.endswith('R_Weapon_ctrl'):
        weaponRList.append(obj)

weaponR = weaponRList[0]


weapon_type_L = 'transform'
weaponLList = []
for obj in pm.ls(type=weapon_type_L):
    if obj.endswith('L_Weapon_ctrl'):
        weaponLList.append(obj)

weaponL = weaponLList[0]



objects_to_clean = [weaponL, weaponR]

def delete_animation_keys(objects):
    for obj in objects:
        if pm.keyframe(obj, query=True, keyframeCount=True):
            pm.cutKey(obj, clear=True)
            print("Animation keys deleted for:", obj)
        else:
            print("No animation keys found for:", obj)




def weaponCorR():

    delete_animation_keys(weaponRList)

    sel = pm.ls(sl=True, fl=True)
    name = sel[0]

    target = pm.spaceLocator(n='%s_Loc' % name)

    pos = pm.parentConstraint(sel, target, mo=0)

    startTime = pm.playbackOptions(query=True, minTime=True)
    endTime = pm.playbackOptions(query=True, maxTime=True)
    pm.bakeResults(target, simulation=True, t=(startTime, endTime))

    pm.delete(pos)

    pm.select(clear=True)
    pm.cutKey(weaponR)
    par = pm.parentConstraint([target] + [weaponR], mo=False)

    startTime = pm.playbackOptions(query=True, minTime=True)
    endTime = pm.playbackOptions(query=True, maxTime=True)

    pm.bakeResults(weaponR, simulation=True, t=(startTime, endTime))

    pm.showHidden(above=True)

    pm.delete(par)
    pm.delete(target)

    print("Bake Process it done")
    return weaponCorR


def weaponCorL():
    delete_animation_keys(weaponLList)

    sel = pm.ls(sl=True, fl=True)
    name = sel[0]

    target = pm.spaceLocator(n='%s_Loc' % name)

    pos = pm.parentConstraint(sel, target, mo=0)

    startTime = pm.playbackOptions(query=True, minTime=True)
    endTime = pm.playbackOptions(query=True, maxTime=True)
    pm.bakeResults(target, simulation=True, t=(startTime, endTime))

    pm.delete(pos)
    pm.select(clear=True)
    pm.cutKey(weaponL)
    par = pm.parentConstraint([target] + [weaponL], mo=False)

    startTime = pm.playbackOptions(query=True, minTime=True)
    endTime = pm.playbackOptions(query=True, maxTime=True)

    pm.bakeResults(weaponL, simulation=True, t=(startTime, endTime))

    pm.showHidden(above=True)

    pm.delete(par)
    pm.delete(target)
    print("Bake Process it done")
    return weaponCorL


def weaponNoTargR():
    delete_animation_keys(weaponRList)

    wristR = pm.ls('Wrist_R', r=True)[0]
    pm.select(clear=True)
    pm.cutKey(weaponR)
    loc = pm.spaceLocator(n='reference')

    pm.parent(loc, wristR)
    pm.xform(loc, t=(0.08, 0, -0.035), ro=(0, 90, 180))

    par = pm.parentConstraint([loc] + [weaponR], mo=0)

    startTime = pm.playbackOptions(query=True, minTime=True)
    endTime = pm.playbackOptions(query=True, maxTime=True)

    pm.bakeResults(weaponR, simulation=True, t=(startTime, endTime))

    pm.showHidden(above=True)

    pm.delete(par, loc)
    print("Bake Process it done")
    return weaponNoTargR


def weaponNoTargL():
    delete_animation_keys(weaponLList)

    wristL = pm.ls('Wrist_L', r=True)[0]
    pm.select(clear=True)
    pm.cutKey(weaponL)
    loc = pm.spaceLocator(n='reference')

    pm.parent(loc, wristL)
    pm.xform(loc, t=(-0.08, 0, 0.035), ro=(0, 90, 180))

    par = pm.parentConstraint([loc] + [weaponL], mo=0)

    startTime = pm.playbackOptions(query=True, minTime=True)
    endTime = pm.playbackOptions(query=True, maxTime=True)

    pm.bakeResults(weaponL, simulation=True, t=(startTime, endTime))

    pm.showHidden(above=True)

    pm.delete(par, loc)
    print("Bake Process it done")
    return weaponNoTargL


