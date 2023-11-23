import os
import maya.cmds as cmds


def main():
    folder_path = 'C:/Users/Valeriya/Documents/maya/testAnims'

    if not os.path.isdir(folder_path):
        raise ValueError("Folder is not valid")

    files = []

    for i in os.listdir(folder_path):

        filename, file_ext = os.path.splitext(i)

        if file_ext == ".fbx":
            files.append(i)

    print(files)

if __name__ == "__main__":
    main()