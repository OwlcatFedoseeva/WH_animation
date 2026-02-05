import maya.cmds as cmds

def scale_translate_keys(scale_factor=100.0):
    # Получаем выделенные объекты
    selected_objects = cmds.ls(selection=True, transforms=True)
    if not selected_objects:
        cmds.warning("Нет выделенных объектов.")
        return

    for obj in selected_objects:
        for axis in ['X', 'Y', 'Z']:
            attr = f"{obj}.translate{axis}"
            if not cmds.objExists(attr):
                continue

            # Проверяем, есть ли ключи на этом канале
            if not cmds.keyframe(attr, query=True, keyframeCount=True):
                continue

            # Получаем все кадры, где есть ключи
            key_times = cmds.keyframe(attr, query=True, timeChange=True)
            key_values = cmds.keyframe(attr, query=True, valueChange=True)

            # Масштабируем значения и записываем обратно
            for t, v in zip(key_times, key_values):
                # robustly coerce the returned value to a float
                try:
                    if isinstance(v, numbers.Number):
                        val = float(v)
                    else:
                        # if v is a sequence (list/tuple/array), take first element
                        val = float(v[0])
                except Exception:
                    # fallback: try direct float conversion, otherwise skip
                    try:
                        val = float(v)
                    except Exception:
                        continue

                new_value = val * float(scale_factor)
                cmds.keyframe(attr, edit=True, time=(t,), valueChange=new_value)

    cmds.inViewMessage(amg=f'✅ Значения ключей <hl>translate</hl> умножены на {scale_factor}.', pos='midCenter', fade=True)
    print("Готово: значения translate-ключей умножены на", scale_factor)

# Запуск
#scale_translate_keys(100.0)
