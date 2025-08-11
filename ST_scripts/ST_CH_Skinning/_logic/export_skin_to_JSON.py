import json
import os
import maya.cmds as cmds
import maya.OpenMaya as om
import maya.OpenMayaAnim as oma


def _short(n): 
    return n.split("|")[-1]

def _get_shape(mesh_or_shape):
    n = mesh_or_shape
    if cmds.nodeType(n) == "transform":
        shapes = cmds.listRelatives(n, s=True, ni=True, f=True) or []
        for s in shapes:
            if cmds.nodeType(s) == "mesh":
                return s
    elif cmds.nodeType(n) == "mesh":
        return n
    raise RuntimeError("Не найден meshShape у: %s" % mesh_or_shape)

def _get_dagpath(node):
    sel = om.MSelectionList(); sel.add(node)
    dag = om.MDagPath(); sel.getDagPath(0, dag)
    return dag

def _get_mobject(node):
    sel = om.MSelectionList(); sel.add(node)
    obj = om.MObject(); sel.getDependNode(0, obj)
    return obj

def _find_skincluster(shape):
    hist = cmds.listHistory(shape, pdo=True) or []
    skins = [n for n in hist if cmds.nodeType(n) == "skinCluster"]
    if not skins:
        raise RuntimeError("У меша нет skinCluster: %s" % shape)
    return skins[0]


# ---------- основной экспорт ----------
def export_skin_to_json(mesh, out_path, weight_eps=1e-8, round_ndigits=6):
    import json, os
    import maya.cmds as cmds
    import maya.OpenMaya as om
    import maya.OpenMayaAnim as oma

    def _short(n): return n.split("|")[-1]
    def _get_shape(n):
        if cmds.nodeType(n) == "mesh":
            return n
        if cmds.nodeType(n) == "transform":
            shapes = cmds.listRelatives(n, s=True, ni=True, f=True) or []
            for s in shapes:
                if cmds.nodeType(s) == "mesh":
                    return s
        raise RuntimeError("Не найден meshShape у: %s" % n)
    def _get_mobject(node):
        sel = om.MSelectionList(); sel.add(node)
        obj = om.MObject(); sel.getDependNode(0, obj)
        return obj
    def _get_dagpath(node):
        sel = om.MSelectionList(); sel.add(node)
        dag = om.MDagPath(); sel.getDagPath(0, dag)
        return dag
    def _find_skincluster(shape):
        hist = cmds.listHistory(shape, pdo=True) or []
        skins = [n for n in hist if cmds.nodeType(n) == "skinCluster"]
        if not skins:
            raise RuntimeError("У меша нет skinCluster: %s" % shape)
        return skins[0]

    shape = _get_shape(mesh)
    xform = cmds.listRelatives(shape, p=True, f=True)[0]
    sc = _find_skincluster(shape)

    sc_obj = _get_mobject(sc)
    sc_fn = oma.MFnSkinCluster(sc_obj)

    # Влиянщие кости (и их количество)
    inf_paths = om.MDagPathArray()
    sc_fn.influenceObjects(inf_paths)
    influences = [inf_paths[i].fullPathName() for i in range(inf_paths.length())]
    num_infl = len(influences)

    # Компонент "все вершины"
    dag = _get_dagpath(shape)
    vcount = cmds.polyEvaluate(shape, v=True)
    comp_fn = om.MFnSingleIndexedComponent()
    vtx_comp = comp_fn.create(om.MFn.kMeshVertComponent)
    comp_fn.setCompleteData(vcount)

    inf_indices = om.MIntArray()
    for i in range(num_infl):
        inf_indices.append(i)
    weights_flat = om.MDoubleArray()
    sc_fn.getWeights(dag, vtx_comp, inf_indices, weights_flat)  # перегрузка #3

    # Разреженный вывод
    weights_sparse = []
    for vi in range(vcount):
        base = vi * num_infl
        items = []
        for ci in range(num_infl):
            w = weights_flat[base + ci]
            if abs(w) > weight_eps:
                if round_ndigits is not None:
                    w = round(float(w), round_ndigits)
                items.append([ci, w])
        if items:
            weights_sparse.append({"v": vi, "w": items})

    data = {
        "version": 1,
        "meshShape": shape,
        "meshTransform": xform,
        "skinCluster": sc,
        "vertexCount": vcount,
        "influences": [{"index": i, "path": influences[i]} for i in range(num_infl)],
        "weights": weights_sparse,
        "meta": {"normalize": True, "createdIn": "Maya 2023", "generator": "export_skin_to_json.py"}
    }

    folder = os.path.dirname(out_path)
    if folder and not os.path.exists(folder):
        os.makedirs(folder)
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, separators=(",", ":"), indent=2)

    om.MGlobal.displayInfo(u"[skin JSON] Экспортировано: %s (verts=%d, infl=%d)" %
                           (out_path, vcount, num_infl))



# ---- пример вызова (раскомментируй и подставь свои имена) ----
# export_skin_to_json("HD_Base01_M_HM", r"C:/Users/OGFedoseeva/Desktop/Other/Test/HD_Base01_M_HM.json")
