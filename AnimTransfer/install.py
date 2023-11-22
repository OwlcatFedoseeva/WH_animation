import os
import maya.cmds as cmds

USERAPPDIR = cmds.internalVar(userAppDir=True)
DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'AnimTransfer')

script_folder = DIRECTORY
script_name = 'run.py'

def read_script_contents(script_folder, script_name):
    script_path = os.path.join(script_folder, script_name)
    with open(script_path, 'r') as script_file:
        script_contents = script_file.read()
    return script_contents


def create_shelf_button(script_folder, script_name):
    active_shelf = cmds.shelfTabLayout("ShelfLayout", query=True, selectTab=True)
    
    # Create the shelf if it doesn't exist
    if not cmds.shelfLayout(active_shelf, exists=True):
        cmds.shelfLayout(active_shelf, parent="ShelfLayout")
    
    # Define the icon path (replace 'icon.png' with your actual icon file)
    icon_path = os.path.join(script_folder, 'AnimTransferIcon.png')
    icon_path = os.path.normpath(icon_path)
    
    # Read the script contents
    script_contents = read_script_contents(script_folder, script_name)

    # Create the shelf button with the script contents as the command
    button_label = script_name.split('.')[0]  # Using the script name as the button label
    shelf_button = cmds.shelfButton(
        label=button_label,
        image=icon_path,
        annotation=button_label,
        command=script_contents,
        parent=active_shelf
    )


# Create the shelf button with script contents as the command
create_shelf_button(script_folder, script_name)