# -*- coding: utf-8 -*-
import os
from PySide2 import QtWidgets
import maya.cmds as cmds
import maya.OpenMaya as OpenMaya
import importlib

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
