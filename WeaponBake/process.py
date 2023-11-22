import pymel.core as pm

weaponR = pm.ls('R_Weapon_ctrl', r=True)
weaponL = pm.ls('L_Weapon_ctrl', r=True)



def weaponCorR():
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
    return weaponCorR


def weaponCorL():
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

    return weaponCorL


def weaponNoTargR():
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
    return weaponNoTargR


def weaponNoTargL():
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
    return weaponNoTargL


