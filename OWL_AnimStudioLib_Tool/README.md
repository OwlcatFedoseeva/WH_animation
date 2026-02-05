# OWL AnimStudioLib Tool

## Overview
This Maya tool provides a small UI for batch exporting animations to Studio Library and batch importing Studio Library animations onto a rig. It is designed to streamline animation library workflows by:
1. Exporting .ma scenes as Studio Library .anim items (with thumbnails).
2. Writing a per-clip metadata JSON (.sl_meta.json) that stores FPS and frame range.
3. Importing Studio Library animations onto a referenced rig.
4. Scaling translation keys on import.
5. Rebuilding the timeline/FPS from metadata when available.

## Requirements
1. Autodesk Maya with Python and PySide2 available.
2. Studio Library installed (the tool uses the `mutils` module from Studio Library).
3. Your rigs/scenes should include a `ControlSet` objectSet for control selection.

## Installation
1. Copy the folder `OWL_AnimStudioLib_Tool` into your Maya scripts directory:
   `C:\Users\<You>\Documents\maya\scripts\`
2. Start Maya (or restart if it was already open).

## Launching The Tool
Run this in Maya's Script Editor (Python tab):

```python
import OWL_AnimStudioLib_Tool.run
```

Alternative:

```python
from OWL_AnimStudioLib_Tool import OWL_AnimStudioLib_Tool_UI
OWL_AnimStudioLib_Tool_UI.main()
```

## Initial Setup (Studio Library Path)
The tool needs access to Studio Library's `mutils` module. Set it once:
1. Open the tool window.
2. Go to `Settings` -> `Studio Library Path...`
3. Choose the Studio Library **src** folder (the folder that contains `mutils`).

The path is stored here:
`<MayaUserAppDir>\OWL_AnimStudioLib_Tool_settings.json`

You can also edit that file directly if needed.

## Usage

### Export Animation to SL
1. Set **Source Folder** to a directory containing .ma files.
2. Set **Destination Folder** to the target Studio Library folder.
3. Click **EXPORT**.

What happens:
1. Each .ma file is opened.
2. Animation layers are merged to base.
3. Controls are selected from `ControlSet`.
4. A Studio Library .anim item is created.
5. A thumbnail is generated.
6. A `.sl_meta.json` file is written next to the animation item.

### Import Animation from SL
1. Select a **Rig File** (.ma or .mb) to reference.
2. Set **Studio Library Folder** (source animations).
3. Set **Destination Folder** (where new .ma files will be saved).
4. Set **Scale Value** (defaults to 1.0).
5. Click **Create Animation Files**.

What happens:
1. The rig is referenced and `ControlSet` is used to find controls.
2. Each Studio Library animation folder is imported onto the rig.
3. Translation keys are scaled by the Scale Value.
4. FPS and timeline are set from `.sl_meta.json` if found.
5. A new .ma file is saved per animation into the destination folder.

## Troubleshooting
1. **"mutils not found"**: Set the Studio Library path in Settings.
2. **No controls selected**: Ensure the rig contains a `ControlSet` objectSet.
3. **Nothing exported**: Confirm the source folder has .ma files and each has a valid `ControlSet`.

