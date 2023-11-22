from WeaponBake import process
reload(process)
import pymel.core as pm

############################

#          UI             #

############################


myWindow = pm.window(title="Weapon Position Fix")
pm.columnLayout("basicTools", adjustableColumn=True)

pm.gridLayout("CreateGrid", numberOfRowsColumns=(1, 1), cellWidthHeight=(180, 30), parent="basicTools")


pm.separator(style='in')
pm.button(c='process.weaponCorR()', label='Right Hand Weapon', parent="CreateGrid")
pm.separator(style='in')
pm.button(c='process.weaponNoTargR()', label='Right Hand No Weapon', parent="CreateGrid")
pm.separator(style='in')
pm.button(c='process.weaponCorL()', label='Left Hand Weapon', parent="CreateGrid")
pm.separator(style='in')
pm.button(c='process.weaponNoTargL()', label='Left Hand No Weapon', parent="CreateGrid")
pm.separator(style='in')

pm.showWindow(myWindow)


############################
