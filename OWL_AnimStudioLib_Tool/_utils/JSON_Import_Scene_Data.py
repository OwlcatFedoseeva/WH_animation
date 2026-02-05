import json
import os
import maya.cmds as cmds
import sys
import traceback

from OWL_AnimStudioLib_Tool._utils import config

# add candidate paths if they exist
candidates = config.get_studio_lib_candidates()

_MUTILS = None
_MUTILS_ERROR = None

for p in candidates:
    if p and os.path.isdir(p) and p not in sys.path:
        sys.path.insert(0, p)


def _load_mutils():
    global _MUTILS, _MUTILS_ERROR
    if _MUTILS:
        return _MUTILS
    if _MUTILS_ERROR:
        raise RuntimeError(
            "mutils not found. Set Studio Library path in Settings -> Studio Library Path."
        ) from _MUTILS_ERROR
    if not candidates:
        raise RuntimeError(
            "Studio Library path is not set. Use Settings -> Studio Library Path in the tool UI "
            "or edit OWL_AnimStudioLib_Tool_settings.json in your Maya user app dir."
        )
    try:
        import mutils
        _MUTILS = mutils
        print("# mutils imported from:", getattr(mutils, "__file__", "<unknown>"))
        print("# mutils exports (sample):", sorted([n for n in dir(mutils) if not n.startswith("_")])[:40])
        return _MUTILS
    except Exception as e:
        _MUTILS_ERROR = e
        print("# ERROR importing mutils:", e)
        print("# sys.path (first 12 entries):")
        for p in sys.path[:12]:
            print("  ", p)
        traceback.print_exc()
        raise RuntimeError(
            "mutils not found. Ensure Studio Library is installed and the path is set."
        ) from e


def save_current_animation(save_folder, clip_name):
    """
    Save current animation using mutils (same as Studio Library).
    """
    mutils = _load_mutils()
    if not os.path.exists(save_folder):
        os.makedirs(save_folder)

    anim_path = os.path.join(save_folder, clip_name + ".anim")

    # Get objects: use selection, or fall back to all transforms
    objects = cmds.ls(selection=True)
    if not objects:
        objects = cmds.ls(type="transform")
        if not objects:
            raise ValueError("No objects selected and no default objects found!")

    # Get time range
    start = cmds.playbackOptions(q=True, min=True)
    end = cmds.playbackOptions(q=True, max=True)

    # Create animation from objects
    anim = mutils.Animation.fromObjects(objects)

    # Set metadata
    anim.setMetadata("name", clip_name)
    anim.setMetadata("description", "Saved via Python script")

    # Save animation
    anim.save(
        path=anim_path,
        time=(start, end),
        bakeConnected=True,
        fileType="mayaAscii"
    )

    # Generate thumbnail (existing logic)
    thumbnail_path = os.path.join(anim_path, "thumbnail.jpg")
    cmds.playblast(
        frame=[start],
        format='image',
        filename=os.path.splitext(thumbnail_path)[0],
        width=220,
        height=130,
        viewer=False,
        offScreen=True,
        framePadding=0,
        compression='jpg',
        showOrnaments=False,
        quality=100
    )

    # --- NEW: write scene metadata JSON for importer later ---
    try:
        write_scene_metadata(save_folder, clip_name, start, end, source_scene=cmds.file(q=True, sn=True))
    except Exception as e:
        print("# Warning: write_scene_metadata failed:", e)

    print(f"✅ Animation saved: {anim_path}")
    print(f"🖼️ Thumbnail saved: {thumbnail_path}")

# Add this function to your JSON_Import_Scene_Data.py file
def write_scene_metadata(save_folder, clip_name, start_frame, end_frame, source_scene=None):
    """
    Write scene metadata JSON file for later import.
    
    Args:
        save_folder (str): Directory to save the metadata
        clip_name (str): Name of the animation clip
        start_frame (int): Start frame of animation
        end_frame (int): End frame of animation  
        source_scene (str): Path to source scene file (optional)
    """
    metadata = {
        "version": 1,
        "fps": get_current_fps(),
        "timeUnit": cmds.currentUnit(q=True, time=True),
        "start": int(start_frame),
        "end": int(end_frame),
        "scene": source_scene or "",
        "clipName": clip_name,
        "exportTime": get_current_timestamp()
    }
    
    # Save metadata JSON
    metadata_file = os.path.join(save_folder, f"{clip_name}.sl_meta.json")
    with open(metadata_file, 'w') as f:
        json.dump(metadata, f, indent=2)
    
    print(f"📄 Metadata saved: {metadata_file}")
    return metadata_file

def get_current_fps():
    """Get current FPS as numeric value"""
    time_unit = cmds.currentUnit(q=True, time=True)
    fps_mapping = {
        'game': 15,
        'film': 24,
        'pal': 25, 
        'ntsc': 30,
        'show': 48,
        'palf': 50,
        'ntscf': 60
    }
    return fps_mapping.get(time_unit, 24)

def get_current_timestamp():
    """Get current timestamp for metadata"""
    from datetime import datetime
    return datetime.now().isoformat()
