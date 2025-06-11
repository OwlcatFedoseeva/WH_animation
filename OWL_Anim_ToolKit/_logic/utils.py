import os

def clear_temp_files(temp_dir):
    if not os.path.exists(temp_dir):
        return
    deleted_count = 0
    for filename in os.listdir(temp_dir):
        if filename.startswith("temp_"):
            file_path = os.path.join(temp_dir, filename)
            try:
                os.remove(file_path)
                deleted_count += 1
            except Exception as e:
                print(f"❌ Не удалось удалить {file_path}: {e}")
    print(f"🧹 Удалено {deleted_count} временных файлов из: {temp_dir}")
