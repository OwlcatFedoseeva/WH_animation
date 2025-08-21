# -*- coding: utf-8 -*-

import os
from PySide2 import QtWidgets
import maya.cmds as cmds
import maya.api.OpenMaya as om 
import importlib

USERAPPDIR = cmds.internalVar(userAppDir=True)
DIRECTORY = os.path.join(USERAPPDIR, 'scripts', 'ST_CH_Skinning')
# наш экспортер (модуль)
import ST_CH_Skinning._logic.export_skin_to_JSON as owl_export_skin_to_json
importlib.reload(owl_export_skin_to_json)

def get_scene_parent_dir():
    """Папка на УРОВЕНЬ ВЫШЕ папки сцены. Туда кладём RIG, Skinned_FBX и т.п."""
    scene_path = cmds.file(q=True, sn=True)
    if not scene_path:
        return None
    scene_dir = os.path.dirname(scene_path)
    parent_dir = os.path.dirname(scene_dir)
    return parent_dir

def ensure_skinData_dir_or_warn():
    """
    Проверяет наличие RIG и создаёт RIG/skinData.
    Возвращает путь к skinData или None, если RIG нет.
    """
    parent_dir = get_scene_parent_dir()
    if not parent_dir:
        return None

    rig_dir = os.path.join(parent_dir, "RIG")
    if not os.path.isdir(rig_dir):
        return None

    skin_data_dir = os.path.join(rig_dir, "skinData")
    if not os.path.isdir(skin_data_dir):
        os.makedirs(skin_data_dir)
    return skin_data_dir

def collect_mesh_names_from_scroll(scroll_content=None, mesh_items=None):
    """
    Возвращает список имён мешей.
    Можно передать либо mesh_items (список строк), либо scroll_content (QWidget).
    """
    # Если передан список mesh_items
    if mesh_items and isinstance(mesh_items, (list, tuple)):
        seen, out = set(), []
        for name in mesh_items:
            name = (name or "").strip()
            if name and name not in seen:
                seen.add(name)
                out.append(name)
        return out

    meshes = []
    if scroll_content:
        for w in scroll_content.findChildren(QtWidgets.QWidget):
            if isinstance(w, QtWidgets.QLineEdit):
                name = w.text().strip()
                if name:
                    meshes.append(name)
            elif isinstance(w, QtWidgets.QLabel):
                name = w.text().strip()
                if name and not name.lower().startswith("mesh"):
                    meshes.append(name)
            elif isinstance(w, QtWidgets.QCheckBox):
                name = w.text().strip()
                if name and w.isChecked():
                    meshes.append(name)

    # Убираем дубликаты, сохраняя порядок
    seen, uniq = set(), []
    for m in meshes:
        if m not in seen:
            seen.add(m)
            uniq.append(m)
    return uniq


def transform_from_mesh_or_shape(node):
    """Принимаем и transform, и shape; возвращаем transform-узел для имени файла."""
    if cmds.objExists(node):
        if cmds.nodeType(node) == "transform":
            return node
        if cmds.nodeType(node) == "mesh":
            parents = cmds.listRelatives(node, p=True, f=True) or []
            return parents[0] if parents else node
    return node  # экспортер сам сообщит об ошибке, если узла нет

def find_first_joint_variant(name: str):
    """Ищет joint по имени name и по шаблону '*:name'. Возвращает полное имя или None."""
    if cmds.objExists(name) and cmds.nodeType(name) == "joint":
        return name
    hits = cmds.ls(f"*:{name}", type="joint") or []
    return hits[0] if hits else None


# ---------- snapshot / restore via OPM ----------


def _set_opm(node, mat16):
    """
    Устанавливает offsetParentMatrix на узле.
    mat16 — список из 16 чисел (row-major), как возвращает cmds.xform(..., m=True).
    """
    # Никаких вызовов m(i,j) — сразу скармливаем список
    cmds.setAttr(node + ".offsetParentMatrix", *mat16, type="matrix")

def snapshot_pose(joints):
    """
    Сохраняет мировую матрицу 4x4 (16 чисел) для каждого joint через cmds.xform.
    Возвращает dict: { jointFullName: [16 чисел], ... }
    """
    snap = {}
    for j in joints:
        if not cmds.objExists(j):
            continue
        # Матрица мирового пространства, плоский список из 16 чисел
        mat16 = cmds.xform(j, q=True, m=True, ws=True)
        if mat16 and len(mat16) == 16:
            snap[j] = [float(x) for x in mat16]
    return snap

def restore_pose(snapshot_dict):
    """
    Восстанавливает позу из snapshot_pose().
    """
    for j, mat16 in snapshot_dict.items():
        if cmds.objExists(j):
            _set_opm(j, mat16)


_CHANNEL_ATTRS = ("tx","ty","tz","rx","ry","rz")

def snapshot_channels(joints, attrs=_CHANNEL_ATTRS):
    """
    Запоминает текущие значения каналов для каждого джойнта.
    Возврат: { joint: {attr: value, ...}, ... }
    """
    snap = {}
    for j in joints:
        if not cmds.objExists(j):
            continue
        jd = {}
        for a in attrs:
            plug = f"{j}.{a}"
            if cmds.objExists(plug):
                try:
                    jd[a] = cmds.getAttr(plug)
                except Exception:
                    pass
        if jd:
            snap[j] = jd
    return snap

def restore_channels(snapshot_dict):
    """
    Восстанавливает значения каналов из snapshot_channels().
    """
    for j, chans in snapshot_dict.items():
        if not cmds.objExists(j):
            continue
        for a, v in chans.items():
            plug = f"{j}.{a}"
            if cmds.objExists(plug):
                try:
                    cmds.setAttr(plug, v)
                except Exception:
                    pass

def remove_keys_on_joints(joints, frame_range, attrs=_CHANNEL_ATTRS):
    """
    Срезает ключи на диапазоне для заданных атрибутов.
    """
    start, end = frame_range
    for j in joints:
        for a in attrs:
            plug = f"{j}.{a}"
            if cmds.objExists(plug):
                try:
                    cmds.cutKey(plug, time=(int(start), int(end)), option="keys")
                except Exception:
                    pass

def detect_root_joint(candidates=("Pelvis","Position")):
    # как у тебя ранее (любой метод, который уже работает)
    hits = []
    for c in candidates:
        if cmds.objExists(c) and cmds.nodeType(c) == "joint":
            return c
        alts = cmds.ls(f"*:{c}", type="joint") or []
        if alts:
            return alts[0]
    # фоллбек: верхний joint
    all_joints = cmds.ls(type="joint") or []
    roots = [j for j in all_joints if not cmds.listRelatives(j, p=True, type="joint")]
    if roots:
        roots.sort(key=lambda x: len(cmds.listRelatives(x, ad=True, type="joint") or []), reverse=True)
        return roots[0]
    return None

def collect_joints_from_root(root_joint):
    kids = cmds.listRelatives(root_joint, ad=True, type="joint") or []
    res = list(dict.fromkeys(kids + [root_joint]))
    res.reverse()
    return res

def animations_root_dir() -> str:
    return os.path.join(DIRECTORY, "animations")

def animations_dir_for_project(project_name: str) -> str:
    """
    Возвращает animations/<PROJECT>_anim. Не зависит от UI.
    """
    project_name = (project_name or "").strip()
    return os.path.join(animations_root_dir(), f"{project_name}_anim") if project_name else animations_root_dir()


def get_clean_file_name():
    full_path = cmds.file(q=True, sn=True)
    if not full_path:
        return ""
    file_name = os.path.splitext(os.path.basename(full_path))[0]
    if file_name.endswith("_skeleton"):
        file_name = file_name[:-9]  # убираем "_skeleton"
    return file_name

def scene_base_name() -> str:
    scene_path = cmds.file(q=True, sn=True) or ""
    base = os.path.splitext(os.path.basename(scene_path))[0]
    return base or "animation"

def pick_target_anim_subfolder(parent=None, project_name: str = "") -> str:
    """
    Диалог выбора папки ВНУТРИ /animations. Можно задать parent (QWidget) и имя проекта для стартовой папки.
    """
    root_dir = os.path.abspath(animations_root_dir())
    start_dir = animations_dir_for_project(project_name)
    if not os.path.isdir(start_dir):
        start_dir = root_dir

    target_dir = QtWidgets.QFileDialog.getExistingDirectory(
        parent, "Select target subfolder inside /animations", start_dir
    )
    if not target_dir:
        return ""

    target_dir = os.path.abspath(target_dir)
    try:
        if os.path.commonpath([target_dir, root_dir]) != root_dir:
            QtWidgets.QMessageBox.warning(parent, "Export Animation",
                                          f"Please choose a folder INSIDE:\n{root_dir}")
            return ""
    except Exception:
        return ""
    return target_dir

def detect_root_joint_safe(candidates=("Pelvis","Position")) -> str:
    try:
        return detect_root_joint(candidates) or ""
    except Exception:
        return ""

def confirm_overwrite(out_path: str, parent=None) -> bool:
    if not os.path.exists(out_path):
        return True
    btn = QtWidgets.QMessageBox.question(
        parent, "Export Animation",
        f"File exists:\n{out_path}\n\nOverwrite?",
        QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No,
        QtWidgets.QMessageBox.No
    )
    return btn == QtWidgets.QMessageBox.Yes

