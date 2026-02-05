import json
import os
import maya.cmds as cmds

_CONFIG_FILENAME = "OWL_AnimStudioLib_Tool_settings.json"


def _config_path():
    user_dir = cmds.internalVar(userAppDir=True)
    return os.path.join(user_dir, _CONFIG_FILENAME)


def load_settings():
    path = _config_path()
    if not os.path.isfile(path):
        return {}
    try:
        with open(path, "r", encoding="utf-8") as fh:
            return json.load(fh) or {}
    except Exception:
        return {}


def save_settings(data):
    path = _config_path()
    try:
        with open(path, "w", encoding="utf-8") as fh:
            json.dump(data, fh, ensure_ascii=False, indent=2)
    except Exception:
        return False
    return True


def get_studio_lib_src():
    data = load_settings()
    return data.get("studio_lib_src", "")


def set_studio_lib_src(path):
    data = load_settings()
    data["studio_lib_src"] = path or ""
    return save_settings(data)


def get_studio_lib_candidates():
    studio_lib_src = get_studio_lib_src()
    if not studio_lib_src:
        return []

    base_dir = os.path.dirname(studio_lib_src)
    return [
        studio_lib_src,
        os.path.join(base_dir, "studiolibrary"),
        os.path.join(base_dir, "src"),
        os.path.join(base_dir, "lib"),
    ]
