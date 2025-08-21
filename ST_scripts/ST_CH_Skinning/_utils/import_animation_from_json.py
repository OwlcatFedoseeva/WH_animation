# -*- coding: utf-8 -*-
import os
import json
import maya.cmds as cmds

# ---------- helpers ----------

def _maya_set_fps(fps):
    """Устанавливает time unit по числу FPS (24 → '24fps')."""
    try:
        cmds.currentUnit(time=f"{float(fps)}fps")
    except Exception:
        pass

def _timeline_set(start_frame, end_frame):
    start_frame = int(start_frame)
    end_frame = int(end_frame)
    cmds.playbackOptions(ast=start_frame, min=start_frame, aet=end_frame, max=end_frame)

def _build_shortname_index(node_type="joint"):
    """
    Индекс для быстрого поиска ноды по короткому имени:
    возвращает dict short_name -> [full_paths...]
    """
    result = {}
    for n in cmds.ls(type=node_type) or []:
        short = n.split(":")[-1]
        result.setdefault(short, []).append(n)
    return result

def _resolve_node(short_name, namespace=None, short_index=None):
    """
    Возвращает имя ноды в сцене для данного короткого имени.
    1) если задан namespace — пробуем 'ns:short'
    2) иначе — ищем в индексе коротких имён
    """
    if namespace:
        candidate = f"{namespace}{short_name}"
        if cmds.objExists(candidate):
            return candidate
    short_index = short_index or _build_shortname_index("joint")
    hits = short_index.get(short_name, [])
    return hits[0] if hits else None

def _cut_keys_range(node, start, end, attrs=("tx","ty","tz","rx","ry","rz")):
    for a in attrs:
        plug = f"{node}.{a}"
        if cmds.objExists(plug):
            try:
                cmds.cutKey(plug, time=(start, end), option="keys")
            except Exception:
                pass

# ---------- main ----------

def import_animation_from_json(
    json_path,
    *,
    namespace=None,
    clear_existing=True,
    set_timeline=True,
    auto_detect_namespace_root="Pelvis"  # если namespace не задан, попробуем угадать
):
    """
    Импортирует анимацию из JSON:
      {
        "fps": 30.0,
        "start_frame": 1,
        "end_frame": 61,
        "keys": {
          "Pelvis": {"tx":[[1,0.0],...], "ry":[[1,0.0], ...]},
          "Spine":  {...}
        }
      }

    Параметры:
      - namespace: строка вида "rig1:"; если None — попытаемся autodetect по авто-руту.
      - clear_existing: True — удалить существующие ключи на диапазоне перед импортом.
      - set_timeline: True — выставить fps и диапазон таймлайна под анимацию.
      - auto_detect_namespace_root: имя корневого джойнта (без ns) для авто-детекта.

    Возвращает dict с итогами:
      {
        "fps": ...,
        "frame_range": (start,end),
        "applied_joints": [...],
        "missing_joints": [...],
        "total_channels": int
      }
    """
    if not os.path.isfile(json_path):
        raise RuntimeError(f"JSON not found: {json_path}")

    with open(json_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    fps = data.get("fps", 30.0)
    start = int(data.get("start_frame", 1))
    end = int(data.get("end_frame", start))

    if set_timeline:
        _maya_set_fps(fps)
        _timeline_set(start, end)

    # autodetect namespace при необходимости (ищем '*:Pelvis' и т.п.)
    if namespace is None and auto_detect_namespace_root:
        cands = cmds.ls(f"*:{auto_detect_namespace_root}", type="joint") or []
        if cands:
            namespace = cands[0].split(":")[0] + ":"

    short_index = _build_shortname_index("joint")

    applied_joints = []
    missing_joints = []
    total_channels = 0

    keys_dict = data.get("keys", {})
    for short_jnt, chans in keys_dict.items():
        node = _resolve_node(short_jnt, namespace=namespace, short_index=short_index)
        if not node:
            missing_joints.append(short_jnt)
            continue

        if clear_existing:
            _cut_keys_range(node, start, end)

        # Ставим ключи
        for attr, klist in chans.items():
            plug = f"{node}.{attr}"
            if not cmds.objExists(plug):
                continue
            for t, v in klist:
                cmds.setKeyframe(plug, t=float(t), v=float(v))
            total_channels += 1

        applied_joints.append(node)

    # по желанию: выровнять тангенты
    # try:
    #     cmds.keyTangent(applied_joints, itt="auto", ott="auto", time=(start, end))
    # except Exception:
    #     pass

    return {
        "fps": float(fps),
        "frame_range": (start, end),
        "applied_joints": applied_joints,
        "missing_joints": missing_joints,
        "total_channels": int(total_channels),
        "namespace_used": namespace or ""
    }
