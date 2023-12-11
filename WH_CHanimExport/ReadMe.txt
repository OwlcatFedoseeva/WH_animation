Установка

1 - сохранить всю папку [CHanimExport] в: C:\Users\YOURUSERNAME\Documents\maya\scripts\

2 - сохранить UMA_Male_Rig_AnimationExport.fbxexportpreset в: C:\Users\YOURUSERNAME\Documents\maya\FBX\Presets\2019.2\export
    (можно в другой удобной папке, главное не забыть где).
    Скопируй адрес где сохранил этот файл.

3 - Открой [CHanimExportProcess.py] в Notepad или другом редакторе.

4 - В четвертой строке в presetPathName вставь скопированный адрес. 
    Пример: presetPathName = "C:/Users/Valeriya/Documents/maya/FBX/Presets/2019.2/export/UMA_Male_Rig_AnimationExport.fbxexportpreset"

5 - Нажав [Ctrl + S] сохраняем изменения.

6 - Запускаем Maya

7 - в Script Editor открыть [RunProcess.py]. Выделив все содержимое нажать Enter. (Сделав это экспортирует анимацию в папку где сохранен текущий файл)

