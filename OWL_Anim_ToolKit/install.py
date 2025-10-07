import os
import maya.cmds as cmds

def create_owl_anim_toolkit_shelf_button():
    user_script_dir = cmds.internalVar(userAppDir=True)
    toolkit_path = os.path.join(user_script_dir, "scripts", "OWL_Anim_ToolKit")
    run_script = os.path.join(toolkit_path, "run_command.py")
    icon_path = os.path.join(toolkit_path, "icons", "OWL_AnimToolkit_icon.png")
    
    if not os.path.exists(run_script):
        cmds.warning("❌ Не найден файл run_command.py по пути: " + run_script)
        return

    if not os.path.exists(icon_path):
        icon_path = "commandButton.png"  # fallback на стандартную иконку Maya

    # Считываем код команды запуска
    with open(run_script, "r", encoding="utf-8") as f:
        command = f.read()

    # Текущая активная полка
    active_shelf = cmds.shelfTabLayout("ShelfLayout", query=True, selectTab=True)
    if not cmds.shelfLayout(active_shelf, exists=True):
        cmds.warning("❌ Активная полка не найдена")
        return

    label = "OWL_Anim"

    # Удаляем старую кнопку с тем же лейблом, игнорируя разделители и прочие контролы
    children = cmds.shelfLayout(active_shelf, query=True, childArray=True) or []
    for child in children:
        # пропускаем не-кнопки
        if not cmds.shelfButton(child, exists=True):
            continue
        try:
            if cmds.shelfButton(child, query=True, label=True) == label:
                cmds.deleteUI(child)
        except RuntimeError:
            # на случай, если элемент уже удалён или неожиданно изменился
            pass

    # Создаем кнопку
    cmds.shelfButton(
        label=label,
        command=command,
        annotation="Запуск OWL Anim ToolKit",
        image=icon_path,
        imageOverlayLabel="OWL",
        sourceType="python",
        parent=active_shelf
    )

    print("✅ Кнопка OWL_Anim успешно добавлена на полку:", active_shelf)

# Запуск при drag-and-drop
create_owl_anim_toolkit_shelf_button()
