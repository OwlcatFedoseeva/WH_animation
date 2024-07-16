import sys
import importlib

USERAPPDIR = cmds.internalVar(userAppDir=True)
print(USERAPPDIR)

# Ensure the directory containing WH_modelCheckerExport_Tool is in the system path
tool_path = USERAPPDIR + 'scripts/WH_modelCheckerExport_Tool'

print(tool_path)
if tool_path not in sys.path:
    sys.path.append(tool_path)

print("System path updated:")
print(sys.path)

# Try importing the module again
try:
    from WH_modelCheckerExport_Tool import model_checker_UI
except ModuleNotFoundError as e:
    print(f"Import failed: {e}")

# Reload the module
try:
    importlib.reload(model_checker_UI)
    print("Reload successful")
except ModuleNotFoundError as e:
    print(f"Reload failed: {e}")

# Try running the main function
try:
    model_checker_UI.main()
    print("main() executed successfully")
except Exception as e:
    print(f"Error executing main(): {e}")