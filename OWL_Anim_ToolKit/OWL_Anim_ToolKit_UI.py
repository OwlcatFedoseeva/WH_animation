import maya.cmds as cmds
import sys
import os


# Internal Modules
import projectData
import _common.block_logo as logo
import _common.block_project_data as project_data

def create_owl_anim_tool_kit_window():
    
    if cmds.window("OWLAnimationToolKitID", exists=True):
        cmds.deleteUI("OWLAnimationToolKitID", window=True)
    if cmds.windowPref("OWLAnimationToolKitID", exists=True):
        cmds.windowPref("OWLAnimationToolKitID", remove=True)
    
    window = cmds.window("OWLAnimationToolKitID", title="OWL Animation Tool Kit 0.0.0")
    
    # LAYOUTS
    main_layout = cmds.formLayout()
    top_section_logo_layout = cmds.columnLayout(adjustableColumn=True, parent=main_layout)
    top_project_set_section_layout = cmds.formLayout(parent=main_layout)
    mid_section_layout = cmds.formLayout(parent=main_layout)
    bottom_section_layout = cmds.formLayout(parent=main_layout)
    
    # TOP SECTION
    logo.create_block_logo(top_section_logo_layout)
    project_data.create_block_project(top_project_set_section_layout)
    
    # TAB SECTION
    cmds.formLayout(main_layout, edit=True,
        attachForm=[
            (top_section_logo_layout, 'top', 0),
            (top_section_logo_layout, 'left', 0),
            (top_section_logo_layout, 'right', 0),
            (top_project_set_section_layout, 'left', 0),
            (top_project_set_section_layout, 'right', 0),
            (mid_section_layout, 'left', 0),
            (mid_section_layout, 'right', 0),
            (bottom_section_layout, 'left', 0),
            (bottom_section_layout, 'right', 0)
        ],
        attachControl=[
            (top_project_set_section_layout, 'top', 0, top_section_logo_layout),
            (mid_section_layout, 'top', 0, top_project_set_section_layout),
            (bottom_section_layout, 'top', 0, mid_section_layout)
        ]
    )

    cmds.showWindow(window)


if __name__ == "__main__":
    create_owl_anim_tool_kit_window()