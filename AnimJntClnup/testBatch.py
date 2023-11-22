import os
from maya.standalone import standalone
from maya.cmds import cmds
import maya.mel as mel


if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: python standalone_process.py <anim_folder_path>")
    else:
        anim_folder_path = sys.argv[1]

        # Initialize standalone Maya
        standalone.initialize()

        # Load FBX export preset
        load_fbx_export_preset(presetPathName)

        # Get a list of FBX files in the specified folder
        files = [os.path.join(anim_folder_path, f) for f in os.listdir(anim_folder_path) if f.lower().endswith(".fbx")]

        # Check if the folder exists
        if not os.path.isdir(anim_folder_path):
            raise ValueError("Folder does not exist")

        # Check if there are FBX files in the folder
        if not files:
            print("There are no FBX files in the folder")

        # Process each FBX file
        for f in files:
            cmds.file(f, open=True, type='FBX', force=True)
            file_short_name = os.path.basename(f)
            file_name = file_short_name.split(".")[0]

            # Open Files in a given folder
            for joint in joint_list:
                cmds.cutKey(joint, attribute=['translateX', 'translateY', 'translateZ'], option="keys")

            # Save the file to overwrite it
            name_export = os.path.join(anim_folder_path, file_name + '.fbx')
            mel.eval('file -force -options "fbx" -type "FBX export" -pr -ea "{}";'.format(name_export))

            print("\nOutput:\n")
            print("\n" + file_name + "=>" + "Saved here => " + name_export)

        # Uninitialize standalone Maya
        standalone.uninitialize()