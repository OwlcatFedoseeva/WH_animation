import json
import maya.cmds as cmds
import maya.OpenMaya as om
import maya.OpenMayaAnim as oma


def _short(n): 
    return n.split("|")[-1].split(":")[-1]

def _get_shape(node):
    if cmds.nodeType(node) == "mesh":
        return node
    if cmds.nodeType(node) == "transform":
        shapes = cmds.listRelatives(node, s=True, ni=True, f=True) or []
        for s in shapes:
            if cmds.nodeType(s) == "mesh":
                return s
    raise RuntimeError("Не найден meshShape у: %s" % node)

def _get_mobject(node):
    sel = om.MSelectionList(); sel.add(node)
    obj = om.MObject(); sel.getDependNode(0, obj)
    return obj

def _get_dagpath(node):
    sel = om.MSelectionList(); sel.add(node)
    dag = om.MDagPath(); sel.getDagPath(0, dag)
    return dag

def _skinclusters_on_shape(shape):
    hist = cmds.listHistory(shape, pdo=True) or []
    return [n for n in hist if cmds.nodeType(n) == "skinCluster"]

def _find_node_by_full_or_short(path_str):
    if not path_str:
        return None
    if cmds.objExists(path_str):
        return path_str
    short = _short(path_str)
    cands = cmds.ls(short, long=True) or []
    return cands[0] if cands else None


def import_skin_from_json_replace(mesh, json_path, influence_remap=None, strict_topology=True, remove_existing_skin=True,
                                  force_exact_sc_name=True, normalize=True, verbose=True):
    """
    Полный «реплейс»:
    1) импортирует JSON
    2) удаляет существующие skinCluster на меше (опц.)
    3) создаёт новый skinCluster на меше с именем из JSON (опц. форс-имя)
    4) записывает ВСЕ веса из JSON, отсутствующие — нули, и нормализует (опц.)

    influence_remap: dict для переименования костей из JSON -> ноды в сцене.
    strict_topology: True — требует совпадение vertexCount; False — возьмём min().
    remove_existing_skin: удалить все skinCluster на меше перед созданием.
    force_exact_sc_name: попытаться получить точное имя skinCluster как в JSON.
                         Если в сцене уже есть нода с таким именем — будет переименование.
    normalize: нормализовать по вершинам перед записью.
    """

    with open(json_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    j_infl = data["influences"]          # [{index, path}, ...]
    j_vcount = int(data["vertexCount"])
    j_weights = data.get("weights", [])  # [{v, w:[[idx, weight], ...]}, ...]
    desired_sc_name = data.get("skinCluster", "skinCluster1")
    want_normalize = bool(normalize or data.get("meta", {}).get("normalize", True))

    shape = _get_shape(mesh)
    xform = cmds.listRelatives(shape, p=True, f=True)[0]

    if remove_existing_skin:
        for sc in _skinclusters_on_shape(shape):
            try:
                cmds.delete(sc)
            except Exception:
                pass

    desired_infs = []
    jidx_to_scene = {}

    for it in j_infl:
        idx = int(it["index"])
        src = it["path"]
        if influence_remap and src in influence_remap:
            src = influence_remap[src]
        if influence_remap and _short(it["path"]) in influence_remap:
            src = influence_remap[_short(it["path"])]

        jnode = _find_node_by_full_or_short(src)
        if not jnode:
            if verbose:
                om.MGlobal.displayWarning(u"[skin JSON] В сцене не найдено влияние: %s (index=%d)" % (it["path"], idx))
            continue
        desired_infs.append(jnode)
        jidx_to_scene[idx] = jnode

    _seen = set(); _clean = []
    for j in desired_infs:
        if j not in _seen:
            _seen.add(j); _clean.append(j)
    desired_infs = _clean

    if not desired_infs:
        raise RuntimeError("Не найдено ни одного влияния из JSON в текущей сцене.")


    if force_exact_sc_name and cmds.objExists(desired_sc_name) and cmds.nodeType(desired_sc_name) != "skinCluster":
        tmp_new = desired_sc_name + "_OLD"
        try:
            cmds.rename(desired_sc_name, tmp_new)
        except Exception:
            pass

    sc = cmds.skinCluster(desired_infs, xform, tsb=True, nw=2, mi=8, dr=4.0,
                          n=desired_sc_name if force_exact_sc_name else None)[0]

    if force_exact_sc_name and sc != desired_sc_name:
        try:
            sc = cmds.rename(sc, desired_sc_name)
        except Exception:
            if verbose:
                om.MGlobal.displayWarning(u"[skin JSON] Не удалось присвоить точное имя skinCluster: %s" % desired_sc_name)


    sc_obj = _get_mobject(sc)
    sc_fn = oma.MFnSkinCluster(sc_obj)

    dag = _get_dagpath(shape)
    scene_vcount = cmds.polyEvaluate(shape, v=True)

    if strict_topology and scene_vcount != j_vcount:
        raise RuntimeError("Несовпадение числа вершин: JSON=%d, сцена=%d" % (j_vcount, scene_vcount))

    use_vcount = min(j_vcount, scene_vcount)

    comp_fn = om.MFnSingleIndexedComponent()
    vtx_comp = comp_fn.create(om.MFn.kMeshVertComponent)
    comp_fn.setCompleteData(use_vcount)

    inf_paths = om.MDagPathArray()
    sc_fn.influenceObjects(inf_paths)
    sc_infl_names = [inf_paths[i].fullPathName() for i in range(inf_paths.length())]

    used_indices = om.MIntArray()
    used_names = []
    for i, nm in enumerate(sc_infl_names):
        used_indices.append(i)
        used_names.append(nm)

    num_used = len(used_names)
    name_to_col = {nm: ci for ci, nm in enumerate(used_names)}
    per_vert = [[0.0]*num_used for _ in range(use_vcount)]

    for entry in j_weights:
        vi = int(entry["v"])
        if vi >= use_vcount:
            continue
        for jidx, w in entry["w"]:
            jidx = int(jidx)
            scene_node = jidx_to_scene.get(jidx)
            if not scene_node:
                continue
            if scene_node not in name_to_col:
                continue
            ci = name_to_col[scene_node]
            per_vert[vi][ci] = float(w)

    if want_normalize:
        for vi in range(use_vcount):
            s = sum(per_vert[vi])
            if s > 1e-10:
                inv = 1.0 / s
                per_vert[vi] = [w*inv for w in per_vert[vi]]


    flat = om.MDoubleArray()
    flat.setLength(use_vcount * num_used)
    k = 0
    for vi in range(use_vcount):
        row = per_vert[vi]
        for ci in range(num_used):
            flat[k] = row[ci]
            k += 1

    dummy_out = om.MDoubleArray()
    sc_fn.setWeights(dag, vtx_comp, used_indices, flat, False, dummy_out)

    try:
        cmds.setAttr(sc + ".normalizeWeights", 1)  # Interactive
        cmds.skinPercent(sc, xform, normalize=True)
    except Exception:
        pass

    om.MGlobal.displayInfo(u"[skin JSON] Полная замена завершена: %s (verts=%d, infl=%d, sc=%s)" %
                           (xform, use_vcount, num_used, sc))


# ---- пример вызова ----
# import_skin_from_json_replace("HD_Base01_M_HM", r"C:/Users/OGFedoseeva/Desktop/Other/Test/HD_Base01_M_HM.json")
