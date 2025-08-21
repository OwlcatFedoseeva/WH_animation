import maya.cmds as cmds
import os
import json
import maya.api.OpenMaya as om


file_name = cmds.file(q=True, sn=True)
file_path = os.path.dirname(file_name)
file_name, _ = os.path.splitext(file_name)
file_name = file_name.split('/')[-1]


def _maya_time_to_fps():
    tu = cmds.currentUnit(q=True, time=True)
    if tu.endswith("fps"):
        try:
            return float(tu[:-3])
        except:
            pass
    mapping = {
        "film": 24.0,
        "pal": 25.0,
        "ntsc": 30.0,
        "show": 48.0,
        "palf": 50.0,
        "ntscf": 60.0,
        "game": 15.0,
    }
    return mapping.get(tu, 30.0)  # дефолт 30

def _collect_joints(root_joint=None):
    if root_joint and cmds.objExists(root_joint):
        kids = cmds.listRelatives(root_joint, ad=True, type="joint") or []
        res = (kids + [root_joint])
        seen = set()
        ordered = []
        for j in res:
            if j not in seen:
                seen.add(j)
                ordered.append(j)
        ordered.reverse()
        return ordered
    else:
        return cmds.ls(type="joint") or []

def _export_keys_for_attr(node, attr):
    plug = f"{node}.{attr}"
    if not cmds.objExists(plug):
        return None
    times = cmds.keyframe(plug, q=True, timeChange=True)
    if not times:
        return None
    values = cmds.keyframe(plug, q=True, valueChange=True) or []
    keys = [[float(t), float(v)] for t, v in zip(times, values)]
    return keys if keys else None

def export_animation_to_json(output_path, root_joint=None):
    fps = _maya_time_to_fps()
    start = int(cmds.playbackOptions(q=True, ast=True))
    end = int(cmds.playbackOptions(q=True, aet=True))

    joints = _collect_joints(root_joint=root_joint)
    data = {
      "fps": fps,
      "start_frame": int(start),
      "end_frame": int(end),
      "keys": {}
    }

    attrs = ("tx","ty","tz","rx","ry","rz")

    for j in joints:
        short = j.split(":")[-1]
        joint_dict = {}
        has_any = False
        for a in attrs:
            keys = _export_keys_for_attr(j, a)
            if keys:
                joint_dict[a] = keys
                has_any = True
        if has_any:
            data["keys"][short] = joint_dict

    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    return output_path, data



#path = r"C:\Users\OGFedoseeva\Documents\maya\scripts\ST_CH_Skinning\animations\WHI_anim" + "/" + file_name + '.json'
#export_animation_to_json(path, root_joint="Position")