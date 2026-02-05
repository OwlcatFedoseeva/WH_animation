import os
import sys
import maya.cmds as cmds
import json
import traceback
import re
import importlib
import glob

from OWL_AnimStudioLib_Tool._utils import config


modules_to_reload = [
    'OWL_AnimStudioLib_Tool._utils.scale_anim_curves',
    'OWL_AnimStudioLib_Tool._utils.JSON_Import_Scene_Data',
]
for mod_name in modules_to_reload:
    mod = importlib.import_module(mod_name)
    importlib.reload(mod)


from OWL_AnimStudioLib_Tool._utils.scale_anim_curves import scale_translate_keys
try:
    from OWL_AnimStudioLib_Tool._utils.JSON_Import_Scene_Data import write_scene_metadata, get_current_fps
    print("# ✅ JSON metadata functions imported successfully")
except ImportError as e:
    print("# ❌ Could not import JSON metadata functions:", e)
    # Define fallback functions
    def write_scene_metadata(save_folder, clip_name, start_frame, end_frame, source_scene=None):
        metadata = {
            "version": 1,
            "fps": 24,
            "timeUnit": "film",
            "start": int(start_frame),
            "end": int(end_frame),
            "scene": source_scene or "",
            "clipName": clip_name
        }
        metadata_file = os.path.join(save_folder, f"{clip_name}.sl_meta.json")
        with open(metadata_file, 'w') as f:
            json.dump(metadata, f, indent=2)
        return metadata_file
    
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


def apply_timeline_from_meta(anim_item_folder):
    # 1) Find any meta json in this folder
    candidates = glob.glob(os.path.join(anim_item_folder, "*.sl_meta.json"))
    if not candidates:
        print("[SL Import] No .sl_meta.json found in:", anim_item_folder)
        return False

    meta_path = candidates[0]  # or choose best match if you want
    print("[SL Import] Using meta:", meta_path)

    # 2) Load meta
    with open(meta_path, "r", encoding="utf-8") as f:
        meta = json.load(f)

    # 3) Apply (guard keys)
    time_unit = meta.get("timeUnit")
    fps_value = meta.get("fps")

    if time_unit:
        cmds.currentUnit(time=str(time_unit))
    elif fps_value:
        fps_to_unit = {
            15: 'game', 24: 'film', 25: 'pal',
            30: 'ntsc', 48: 'show', 50: 'palf', 60: 'ntscf'
        }
        cmds.currentUnit(time=fps_to_unit.get(fps_value, 'film'))


    start = meta.get("start")
    end   = meta.get("end")
    if start is not None and end is not None:
        cmds.playbackOptions(min=start, max=end, ast=start, aet=end)
        print(f"[SL Import] Timeline set to {start} - {end}")
        return True

    print("[SL Import] Meta missing start/end keys:", meta_path)
    return False

def find_meta_for_ma(ma_path):

    if not ma_path or not os.path.exists(ma_path):
        return None

    base = os.path.splitext(ma_path)[0]
    direct_meta = base + ".sl_meta.json"
    if os.path.isfile(direct_meta):
        return direct_meta

    folder = os.path.dirname(ma_path)
    # 2. Любой .sl_meta.json в этой папке
    for f in os.listdir(folder):
        if f.lower().endswith(".sl_meta.json"):
            return os.path.join(folder, f)

    # 3. В родительской папке (если структура вида folder/anim.ma и folder.sl_meta.json рядом)
    parent = os.path.dirname(folder)
    anim_name = os.path.basename(folder)
    candidate = os.path.join(parent, anim_name + ".sl_meta.json")
    if os.path.isfile(candidate):
        return candidate

    return None
def apply_json_metadata(anim_folder, source_dir):
    """
    Apply timeline and FPS settings from corresponding JSON metadata file.
    Uses the standardized format from JSON_Import_Scene_Data.py
    
    Args:
        anim_folder (str): Path to the animation folder
        source_dir (str): Root directory where JSON files are located
    """
    try:
        # Find the corresponding JSON file
        json_file = find_corresponding_json(anim_folder, source_dir)
        if not json_file:
            print(f"# No JSON metadata found for: {os.path.basename(anim_folder)}")
            return False
        
        print(f"# Applying JSON metadata from: {os.path.basename(json_file)}")
        
        # Load and parse JSON data
        with open(json_file, 'r') as f:
            metadata = json.load(f)
        
        # Print metadata info for debugging
        print(f"# Metadata: start={metadata.get('start')}, end={metadata.get('end')}, "
              f"fps={metadata.get('fps')}, timeUnit={metadata.get('timeUnit')}")
        
        # Apply FPS settings
        if 'fps' in metadata or 'timeUnit' in metadata:
            set_fps_from_metadata(metadata)
        
        # Apply timeline range
        if 'start' in metadata and 'end' in metadata:
            set_timeline_from_metadata(metadata)
        
        return True
        
    except Exception as e:
        print(f"# Warning: Failed to apply JSON metadata: {e}")
        return False

def find_corresponding_json(anim_folder, source_dir):
    """
    Find the corresponding .sl_meta.json file for an animation folder.
    Now looks for files created by JSON_Import_Scene_Data.py
    
    Args:
        anim_folder (str): Path to animation folder
        source_dir (str): Root directory to search for JSON files
    
    Returns:
        str: Path to JSON file or None if not found
    """
    anim_name = os.path.basename(anim_folder)
    
    # Remove .anim extension if present
    base_name = anim_name.replace('.anim', '')
    
    # Look for JSON file with same base name (created by JSON_Import_Scene_Data.py)
    json_patterns = [
        f"{base_name}.sl_meta.json",  # Primary pattern
        f"{base_name}_meta.json",
        f"{base_name}.json"
    ]
    
    # Search strategies in order of priority:
    
    # 1. Same directory as animation folder
    anim_parent_dir = os.path.dirname(anim_folder)
    for pattern in json_patterns:
        json_path = os.path.join(anim_parent_dir, pattern)
        if os.path.exists(json_path):
            return json_path
    
    # 2. Parent directory of animation folder
    grandparent_dir = os.path.dirname(anim_parent_dir)
    for pattern in json_patterns:
        json_path = os.path.join(grandparent_dir, pattern)
        if os.path.exists(json_path):
            return json_path
    
    # 3. Recursive search in source directory
    for root, dirs, files in os.walk(source_dir):
        for file in files:
            if file.lower().endswith('.sl_meta.json'):
                file_base = os.path.splitext(os.path.splitext(file)[0])[0]  # Remove .sl_meta.json
                if file_base == base_name:
                    return os.path.join(root, file)
    
    print(f"# Could not find JSON metadata for: {base_name}")
    print(f"# Searched patterns: {json_patterns}")
    return None

def set_fps_from_metadata(metadata):
    """
    Set Maya FPS based on JSON metadata from JSON_Import_Scene_Data.py
    """
    fps_mapping = {
        'film': 'film',      # 24fps
        'ntsc': 'ntsc',      # 30fps
        'pal': 'pal',        # 25fps
        'game': 'game',      # 15fps
        'show': 'show',      # 48fps
        'palf': 'palf',      # 50fps
        'ntscf': 'ntscf'     # 60fps
    }
    
    # Priority: timeUnit > fps
    time_unit = metadata.get('timeUnit')
    fps_value = metadata.get('fps')
    
    if time_unit and time_unit in fps_mapping:
        maya_unit = fps_mapping[time_unit]
        cmds.currentUnit(time=maya_unit)
        print(f"# Set FPS to: {maya_unit} ({time_unit})")
    elif fps_value:
        # Convert numeric FPS to Maya unit
        fps_to_unit = {
            15: 'game',
            24: 'film', 
            25: 'pal',
            30: 'ntsc',
            48: 'show',
            50: 'palf',
            60: 'ntscf'
        }
        maya_unit = fps_to_unit.get(fps_value, 'film')  # Default to film
        cmds.currentUnit(time=maya_unit)
        print(f"# Set FPS to: {maya_unit} ({fps_value}fps)")
    else:
        # Default to film (24fps)
        cmds.currentUnit(time='film')
        print("# Set FPS to: film (24fps) - default")

def set_timeline_from_metadata(metadata):
    start_frame = metadata.get('start')
    end_frame = metadata.get('end')

    if start_frame is not None and end_frame is not None:
        cmds.playbackOptions(
            minTime=start_frame,
            maxTime=end_frame,
            animationStartTime=start_frame,
            animationEndTime=end_frame
        )
        cmds.currentTime(start_frame)
        print(f"# Set timeline EXACT: {start_frame} - {end_frame}")


def _iter_ma_files(src_dir, recursive=True):
    if recursive:
        for root, _, files in os.walk(src_dir):
            for f in files:
                if f.lower().endswith(".ma"):
                    yield os.path.join(root, f)
    else:
        for f in os.listdir(src_dir):
            p = os.path.join(src_dir, f)
            if os.path.isfile(p) and f.lower().endswith(".ma"):
                yield p

def import_selected_animation_from_library(library_path, animation_name, target_objects=None, start_frame=None, option=None):
    """
    Import a selected animation from Studio Library into the current scene.
    
    Args:
        library_path (str): Path to the Studio Library folder
        animation_name (str): Name of the animation to import (folder name)
        target_objects (list): List of target objects to apply animation to. If None, uses source objects.
        start_frame (int): Frame to start the animation. If None, uses original start frame.
        option (str): Paste option - "insert", "replace", "replace all", "replaceCompletely"
    """
    
    # Construct the full path to the animation folder
    anim_path = os.path.join(library_path, animation_name)
    
    print(f"# Looking for animation at: {anim_path}")
    
    if not os.path.exists(anim_path):
        # Try alternative path construction
        alt_path = os.path.join(library_path, animation_name + ".anim")
        if os.path.exists(alt_path):
            anim_path = alt_path
            print(f"# Found animation at alternative path: {anim_path}")
        else:
            # List available animations for debugging
            available_anims = []
            if os.path.exists(library_path):
                for item in os.listdir(library_path):
                    item_path = os.path.join(library_path, item)
                    if os.path.isdir(item_path):
                        available_anims.append(item)
            
            print(f"# Available animations in {library_path}:")
            for anim in available_anims:
                print(f"#   - {anim}")
            
            raise ValueError(f"Animation not found: {anim_path}. Tried: {anim_path} and {alt_path}")
    
    print(f"# Loading animation from: {anim_path}")
    
    mutils = _load_mutils()
    anim = mutils.Animation.fromPath(anim_path)
    
    if target_objects is None:
        target_objects = cmds.ls(selection=True) or []
    
    anim.load(
        objects=target_objects,
        startFrame=start_frame,
        option=option,
        currentTime=(start_frame is None)  # Use current time if no start frame specified
    )
    
    print(f"# Successfully imported animation: {animation_name}")

def import_multiple_animations_from_library(library_path, animation_names, target_objects=None, start_frame=None, spacing=1):
    """
    Import multiple animations from Studio Library in sequence.
    
    Args:
        library_path (str): Path to the Studio Library folder
        animation_names (list): List of animation names to import
        target_objects (list): List of target objects to apply animation to
        start_frame (int): Frame to start the first animation
        spacing (int): Frames between each animation
    """
    
    # Construct full paths to animations
    anim_paths = [os.path.join(library_path, name) for name in animation_names]
    
    # Verify all animations exist
    for path in anim_paths:
        if not os.path.exists(path):
            raise ValueError(f"Animation not found: {path}")
    
    # Load animations in sequence
    mutils = _load_mutils()
    mutils.Animation.loadAnims(
        paths=anim_paths,
        objects=target_objects,
        startFrame=start_frame,
        spacing=spacing
    )
    
    print(f"Successfully imported {len(animation_names)} animations")

def get_available_animations(library_path):
    """
    Get list of available animations in the Studio Library folder.
    
    Args:
        library_path (str): Path to the Studio Library folder
    
    Returns:
        list: List of animation names
    """
    if not os.path.exists(library_path):
        return []
    
    animations = []
    for item in os.listdir(library_path):
        item_path = os.path.join(library_path, item)
        if os.path.isdir(item_path):
            # Check if it has the required animation files
            maya_path = os.path.join(item_path, "animation.mb")
            pose_path = os.path.join(item_path, "pose.json")
            if os.path.exists(maya_path) or os.path.exists(pose_path):
                animations.append(item)
    
    return sorted(animations)

def import_selected_animation_with_ui():
    """
    Interactive function to import animation with a simple UI for selection.
    """
    # Replace this with your actual Studio Library path
    library_path = "C:/StudioLibrary/Animations"  # Update this path
    
    # Get available animations
    available_anims = get_available_animations(library_path)
    
    if not available_anims:
        cmds.warning("No animations found in the library folder!")
        return
    
    # Create simple selection dialog
    result = cmds.promptDialog(
        title="Import Animation from Studio Library",
        message="Enter animation name:",
        text=available_anims[0],
        button=['OK', 'Cancel'],
        defaultButton='OK',
        cancelButton='Cancel',
        dismissString='Cancel'
    )
    
    if result == 'OK':
        anim_name = cmds.promptDialog(query=True, text=True)
        
        if anim_name in available_anims:
            try:
                import_selected_animation_from_library(
                    library_path=library_path,
                    animation_name=anim_name,
                    target_objects=cmds.ls(selection=True),
                    start_frame=int(cmds.currentTime(q=True)),
                    option="replaceCompletely"
                )
            except Exception as e:
                cmds.warning(f"Failed to import animation: {str(e)}")
        else:
            cmds.warning(f"Animation '{anim_name}' not found in library!")

def _safe_set_members(s):
    """Безопасно вернуть участников сета (без flatten), не падая на ошибках Maya."""
    try:
        return cmds.sets(s, q=True) or []
    except Exception:
        return []
def _flatten_set(members):
    """Ручной flatten: разворачиваем вложенные objectSet'ы, игнорим битые ноды."""
    out, stack, seen = [], list(members), set()
    while stack:
        m = stack.pop()
        if not m or m in seen or not cmds.objExists(m):
            continue
        seen.add(m)
        try:
            if cmds.nodeType(m) == "objectSet":
                stack.extend(_safe_set_members(m))
            else:
                out.append(m)
        except Exception:
            # на всякий случай проглатываем странные типы
            pass
    return out

def _select_controls_from_controlset(set_name="ControlSet"):
    """
    Ищет сет ControlSet (без/с любым неймспейсом), выбирает всех его участников,
    фильтрует до DAG/трансформов и делает select. Возвращает список.
    """
    # кандидаты: "ControlSet" и "*:ControlSet"
    candidates = cmds.ls([set_name, "*:%s" % set_name], type="objectSet") or []
    # иногда куски рига могут создать дубликаты — уберём повторы и биты
    candidates = [c for c in dict.fromkeys(candidates) if cmds.objExists(c)]

    if not candidates:
        print("# WARNING: ControlSet не найден.")
        cmds.select(clear=True)
        return []

    # считаем размер через безопасный ручной flatten
    def _count(s):
        return len(_flatten_set(_safe_set_members(s)))
    
    control_set = max(candidates, key=_count)
    members = _flatten_set(_safe_set_members(control_set))
    cleaned = []
    for m in members:
        if not cmds.objExists(m):
            continue
        nt = cmds.nodeType(m)
        if nt in ("transform", "joint"):
            cleaned.append(m)
            continue
        parents = cmds.listRelatives(m, p=True, path=True) or []
        if parents:
            cleaned.append(parents[0])

    # финальная чистка + select
    cleaned = sorted(set(x for x in cleaned if cmds.objExists(x)))
    if cleaned:
        cmds.select(cleaned, r=True)
    else:
        print("# WARNING: ControlSet пустой.")
        cmds.select(clear=True)

    return cleaned
def example_single_animation_import():
    """Example: Import a single specific animation"""
    library_path = "C:/Users/OGFedoseeva/Documents/StudioLibrary_Anim/WH1_Anim/SpaceMarine/1H_FreeHand/Climb"  # Update this path
    animation_name = "SpaceMarine_1H_FreeHands_Climb_2M_Down.anim"  # Replace with your animation name
    
    import_selected_animation_from_library(
        library_path=library_path,
        animation_name=animation_name,
        target_objects=cmds.ls(selection=True),  # Apply to selected objects
        start_frame=1,  # Start at frame 1
        option="replaceCompletely"
    )


def batch_import_from_library(rig_path, source_dir, export_dir, scale_value=100.0,
                              recursive=True, use_current_selection=False,
                              spacing=1, apply_json_settings=True):
    """
    Enhanced batch import with JSON metadata support
    """
    # Set FPS first to avoid frame rate warnings
    cmds.currentUnit(time='ntsc')  # 30fps to match your rig
    
    # Reference the rig
    rig_namespace = os.path.splitext(os.path.basename(rig_path))[0]
    cmds.file(new=True, force=True)
    cmds.file(rig_path, reference=True, namespace=rig_namespace)
    
    # Select controls from the rig
    controls = _select_controls_from_controlset()
    if not controls:
        cmds.warning("No controls found in ControlSet. Animation may not apply correctly.")
    
    report = []
    
    # Find animation FOLDERS
    animation_folders = find_animation_folders(source_dir, recursive)
    if not animation_folders:
        print("# No animation folders found in source directory.")
        return
    
    print(f"# Found {len(animation_folders)} animation folders")
    
    for anim_folder in animation_folders:
        try:
            anim_name = os.path.basename(anim_folder)
            print(f"\n=== Processing: {anim_name} ===")
            
            # Use the FULL folder name for Studio Library import
            # Don't split or clean the name - use it as-is
            full_anim_name = anim_name
            
            # Import the animation using the full folder name
            print(f"# Importing animation: {full_anim_name}")
            import_selected_animation_from_library(
                library_path=os.path.dirname(anim_folder),  # Use the parent directory of the animation folder
                animation_name=full_anim_name,              # Use the full folder name
                target_objects=controls,
                start_frame=1,
                option="replaceCompletely"
            )
            
            # Apply scaling to animation curves
            controls = _select_controls_from_controlset()
            cmds.select(controls, r=True)
            scale_translate_keys(scale_factor=scale_value)
            
            # Apply JSON metadata if requested
            if apply_json_settings:
                # 1️⃣ First try meta inside / next to anim folder (most reliable)
                if not apply_timeline_from_meta(anim_folder):
                    # 2️⃣ Fallback to old name-based search
                    json_applied = apply_json_metadata(anim_folder, source_dir)
                    if not json_applied:
                        print("# Using default timeline settings")
                        setup_timeline_for_animation(anim_folder)
            else:
                setup_timeline_for_animation(anim_folder)

            
            # Create export filename - use cleaned name for output file
            clean_anim_name = anim_name.replace('.anim', '')
            if 'SpaceMarine_' in clean_anim_name:
                clean_anim_name = clean_anim_name.split('SpaceMarine_')[-1]
            
            new_scene_name = clean_anim_name
            if not new_scene_name.endswith('.ma'):
                new_scene_name += '.ma'
            
            new_scene_path = os.path.join(export_dir, new_scene_name)
            
            # Save the scene
            cmds.file(rename=new_scene_path)
            cmds.file(save=True, force=True, type='mayaAscii')
            print(f"# ✅ Saved scene: {new_scene_path}")
            
            report.append(f"SUCCESS: {anim_name} -> {new_scene_name}")
            
        except Exception as e:
            error_msg = f"FAILED: {anim_name} - {str(e)}"
            print(f"# ❌ {error_msg}")
            traceback.print_exc()
            report.append(error_msg)
            continue
    
    print("\n# Batch import completed.")
    print("# Report:")
    for item in report:
        print(f"# {item}")

def find_animation_folders(source_dir, recursive=True):
    """
    Find Studio Library animation folders (containing animation files)
    """
    animation_folders = []
    
    if recursive:
        for root, dirs, files in os.walk(source_dir):
            # Skip hidden directories
            dirs[:] = [d for d in dirs if not d.startswith('.')]
            
            for dir_name in dirs:
                dir_path = os.path.join(root, dir_name)
                if is_studio_library_animation(dir_path):
                    animation_folders.append(dir_path)
    else:
        for item in os.listdir(source_dir):
            item_path = os.path.join(source_dir, item)
            if os.path.isdir(item_path) and is_studio_library_animation(item_path):
                animation_folders.append(item_path)
    
    return animation_folders

def is_studio_library_animation(folder_path):
    """
    Check if a folder contains Studio Library animation files
    """
    required_files = [
        os.path.join(folder_path, "animation.mb"),
        os.path.join(folder_path, "animation.ma"), 
        os.path.join(folder_path, "pose.json")
    ]
    
    # Check if any of the required files exist
    for file_path in required_files:
        if os.path.exists(file_path):
            return True
    
    return False

def setup_timeline_for_animation(anim_folder):
    """
    Set up timeline based on animation metadata
    """
    try:
        # Try to load animation to get frame range
        mutils = _load_mutils()
        anim = mutils.Animation.fromPath(anim_folder)
        start_frame = anim.startFrame()
        end_frame = anim.endFrame()
        
        if start_frame is not None and end_frame is not None:
            # Set timeline with some padding
            cmds.playbackOptions(
                minTime=start_frame,
                maxTime=end_frame,
                animationStartTime=start_frame,
                animationEndTime=end_frame
            )
            cmds.currentTime(start_frame)
            print(f"# Set timeline: {start_frame} - {end_frame}")
            
    except Exception as e:
        print(f"# Warning: Could not set timeline: {e}")

def find_custom_JSON_data(source_dir, recursive=True, pattern=".json"):
    if not source_dir or not os.path.isdir(source_dir):
        print(f"# Error: source_dir not found: {source_dir}")

    found = []
    pat = pattern.lower()
    if recursive:
        for root, _, files in os.walk(source_dir):
            for f in files:
                if pat in f.lower():
                    found.append(os.path.join(root, f))
    else:
        for f in os.listdir(source_dir):
            p = os.path.join(source_dir, f)
            if os.path.isfile(p) and pat in f.lower():
                found.append(p)

    if not found:
        print("# No JSON files found.")
        return []

    print(f"# Found {len(found)} JSON file(s):")
    for p in found:
        print(" -", p)
    return found

