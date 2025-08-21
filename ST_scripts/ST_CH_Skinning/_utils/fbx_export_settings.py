# -*- coding: utf-8 -*-
import os
import logging
import maya.cmds as cmds
import maya.mel as mel

__all__ = [
    "ensure_fbx",
    "exists",
    "call",
    "set_unity_fbx_flags",
    "export_fbx",
]

def get_logger(logger=None):
    return logger or logging.getLogger("ST_CH_Skinning.fbx")

def ensure_fbx(logger=None):
    """
    Гарантирует, что плагин FBX загружен. Возвращает True/False.
    Пишет подробный лог: попытки загрузки, путь и версия плагина.
    """
    log = get_logger(logger)
    if cmds.pluginInfo("fbxmaya", q=True, loaded=True):
        try:
            plug_path = cmds.pluginInfo("fbxmaya", q=True, path=True)
        except Exception:
            plug_path = "<unknown>"
        log_fbx_version(log)
        log.debug("FBX plugin already loaded: %s", plug_path)
        return True

    # Пробуем загрузить под разными именами (Windows/Linux)
    for name in ("fbxmaya", "fbxmaya.mll", "fbxmaya.bundle"):
        try:
            log.info("Loading FBX plugin: %s", name)
            cmds.loadPlugin(name)
            if cmds.pluginInfo("fbxmaya", q=True, loaded=True):
                plug_path = cmds.pluginInfo("fbxmaya", q=True, path=True)
                log_fbx_version(log)
                log.info("FBX plugin loaded: %s", plug_path)
                return True
        except Exception as e:
            log.debug("Load attempt failed for %s: %s", name, e)

    log.error("FBX plugin NOT loaded. Install/enable 'fbxmaya'.")
    return False

def log_fbx_version(log):
    try:
        # В большинстве версий есть процедура MEL FBXPlugInVersion
        ver = mel.eval("FBXPlugInVersion;")
        log.info("FBX plugin version: %s", ver)
    except Exception:
        # Тихо — версия не критична
        pass

def exists(flag, logger=None):
    """
    Проверяет наличие MEL-процедуры/флага, безопасно.
    """
    log = get_logger(logger)
    try:
        ok = bool(mel.eval(f'exists "{flag}"'))
        log.debug("exists('%s') -> %s", flag, ok)
        return ok
    except Exception as e:
        log.debug("exists('%s') check failed: %s", flag, e)
        return False

def call(s, logger=None):
    """
    Безопасный вызов MEL-строки с логированием.
    Если в этой версии плагина нет такого флага — логируем и пропускаем.
    """
    log = get_logger(logger)
    try:
        log.debug("MEL: %s", s.strip())
        mel.eval(s)
    except RuntimeError as e:
        msg = str(e)
        if "Cannot find procedure" in msg or "Unknown" in msg:
            log.warning("[FBX] skip (no such flag/proc): %s", s.strip())
        else:
            log.error("[FBX] MEL error on: %s", s.strip())
            raise

def set_unity_fbx_flags(logger=None):
    """
    Применяет набор экспортных флагов под Unity (аналог XML-пресета).
    Возвращает True/False.
    """
    log = get_logger(logger)
    if not ensure_fbx(log):
        return False

    log.info("Apply FBX export flags (Unity preset)")
    # --- Reset/версия/тип файла/оси/юниты ---
    call("FBXResetExport;", log)
    if exists("FBXExportFileVersion", log):
        call('FBXExportFileVersion -v "FBX201800";', log)  # Экспорт в 2018 для совместимости
    if exists("FBXExportInAscii", log):
        call("FBXExportInAscii -v 0;", log)                # Binary
    if exists("FBXExportUpAxis", log):
        call("FBXExportUpAxis y;", log)                    # UpAxis=Y
    # Auto units остаётся по умолчанию (DynamicScaleConversion=1)

    # --- Include ▸ Geometry ---
    if exists("FBXExportSmoothingGroups", log):
        call("FBXExportSmoothingGroups -v 0;", log)
    if exists("FBXExportHardEdges", log):
        call("FBXExportHardEdges -v 0;", log)
    if exists("FBXExportTangents", log):
        call("FBXExportTangents -v 0;", log)
    if exists("FBXExportSmoothMesh", log):
        call("FBXExportSmoothMesh -v 1;", log)
    if exists("FBXExportSelectionSet", log):
        call("FBXExportSelectionSet -v 0;", log)
    if exists("FBXExportBlindData", log):
        call("FBXExportBlindData -v 1;", log)
    if exists("FBXExportInstances", log):
        call("FBXExportInstances -v 0;", log)
    if exists("FBXExportReferencedAssetsContent", log):
        call("FBXExportReferencedAssetsContent -v 1;", log)
    if exists("FBXExportTriangulate", log):
        call("FBXExportTriangulate -v 0;", log)

    # --- Include ▸ Animation (верхний тумблер Animation=0, без запекания) ---
    if exists("FBXExportAnimationOnly", log):
        call("FBXExportAnimationOnly -v 0;", log)
    if exists("FBXExportBakeComplexAnimation", log):
        call("FBXExportBakeComplexAnimation -v 0;", log)
    if exists("FBXExportSplitAnimationIntoTakes", log):
        call("FBXExportSplitAnimationIntoTakes -c;", log)
    if exists("FBXExportDeleteOriginalTakeOnSplitAnimation", log):
        call("FBXExportDeleteOriginalTakeOnSplitAnimation -v 1;", log)

    # Deformation
    if exists("FBXExportSkins", log):
        call("FBXExportSkins -v 1;", log)
    if exists("FBXExportShapes", log):
        call("FBXExportShapes -v 1;", log)

    # --- Cameras/Lights/Audio/Embed Media ---
    if exists("FBXExportCameras", log):
        call("FBXExportCameras -v 0;", log)
    if exists("FBXExportLights", log):
        call("FBXExportLights -v 0;", log)
    if exists("FBXExportEmbeddedTextures", log):
        call("FBXExportEmbeddedTextures -v 0;", log)
    if exists("FBXExportBindPose", log):
        call("FBXExportBindPose -v 1;", log)

    # --- Connections ---
    if exists("FBXExportInputConnections", log):
        call("FBXExportInputConnections -v 1;", log)
    if exists("FBXExportIncludeChildren", log):
        call("FBXExportIncludeChildren -v 1;", log)

    log.info("FBX export flags applied.")
    return True

def export_fbx(filepath, selection=True, apply_flags=True, logger=None):
    """
    Полный цикл экспорта:
      - опционально применяет пресет флагов
      - выполняет FBXExport
    Возвращает True/False.
    """
    log = get_logger(logger)
    if apply_flags and not set_unity_fbx_flags(log):
        log.error("Export aborted: FBX flags not applied.")
        return False

    if not filepath:
        log.error("Export aborted: empty filepath.")
        return False

    # Нормализуем путь для MEL
    dst = os.path.normpath(filepath).replace("\\", "/")
    # Убедимся, что каталог существует
    try:
        os.makedirs(os.path.dirname(dst), exist_ok=True)
    except Exception:
        pass

    try:
        log.info("FBXExport → %s (selection=%s)", dst, selection)
        mel.eval('FBXExport -f "{}" {};'.format(dst, "-s" if selection else ""))
        log.info("FBXExport: done")
        return True
    except Exception as e:
        log.exception("FBXExport failed for %s", dst)
        return False
