import json
import os
import maya.cmds as cmds

def ensure_dir(path):
    """Create directory if missing (no-op if exists)."""
    try:
        os.makedirs(path, exist_ok=True)
    except Exception:
        # swallow errors here; caller will handle write failures
        pass

# mapping Maya timeUnit -> fps (покрывает стандартные наименования)
_TIMEUNIT_TO_FPS = {
    "game": 15,
    "film": 24,
    "pal": 25,
    "ntsc": 30,
    "show": 48,
    "palf": 50,
    "ntscf": 60,
    # explicit fps names that can appear on some systems
    "24fps": 24, "25fps": 25, "30fps": 30, "48fps": 48, "50fps": 50, "60fps": 60
}

def maya_timeunit_to_fps(timeunit):
    """
    Попытка корректно распарсить timeUnit Maya в числовой fps.
    Если распознать не удалось — вернём None.
    """
    if not timeunit:
        return None
    tu = str(timeunit).lower()
    if tu in _TIMEUNIT_TO_FPS:
        return _TIMEUNIT_TO_FPS[tu]
    # иногда timeUnit выглядит как "30fps" или "60fps" — попробуем извлечь число
    import re
    m = re.search(r'(\d+)', tu)
    if m:
        try:
            return int(m.group(1))
        except Exception:
            pass
    return None

def get_scene_time_info():
    """
    Возвращает (fps, timeUnitStr).
    fps может быть None, если не распознали.
    """
    try:
        tu = cmds.currentUnit(q=True, time=True)  # например "ntsc" или "24fps"
    except Exception:
        tu = None
    fps = maya_timeunit_to_fps(tu)
    return fps, tu

def write_scene_metadata(save_folder, clip_name, start, end, source_scene=None):
    """
    Запишет JSON файл с метаданными сцены рядом с айтемом SL.
    Имя файла: <clip_name>.sl_meta.json
    """
    ensure_dir(save_folder)
    meta_name = f"{clip_name}.sl_meta.json"
    meta_path = os.path.join(save_folder, meta_name)

    fps, timeUnit = get_scene_time_info()
    data = {
        "version": 1,
        "fps": fps,
        "timeUnit": timeUnit,
        "start": int(start),
        "end": int(end),
        "scene": source_scene or (cmds.file(q=True, sn=True) or "")
    }
    try:
        with open(meta_path, "w", encoding="utf-8") as fh:
            json.dump(data, fh, ensure_ascii=False, indent=2)
    except Exception as e:
        # Не ломаем экспорт, но логируем
        print("# Warning: failed to write scene metadata:", e)
    else:
        print(f"# Scene metadata saved: {meta_path}")

