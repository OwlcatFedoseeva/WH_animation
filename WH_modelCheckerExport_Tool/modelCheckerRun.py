import sys

packages = ['WH_modelCheckerExport_Tool']

for i in sys.modules.keys()[:]:
    for package in packages:
        if package in i:
            del (sys.modules[i])

import WH_modelCheckerExport_Tool.model_checker_UI

reload(WH_modelCheckerExport_Tool.model_checker_UI)
WH_modelCheckerExport_Tool.model_checker_UI.main()

