from PySide2 import QtWidgets, QtCore, QtGui
import logging

class LoggerWidget(QtWidgets.QTextEdit):
    appendRequested = QtCore.Signal(str)

    def __init__(self, parent=None, max_blocks=2000):
        super().__init__(parent)
        self.setReadOnly(True)
        self.setMinimumHeight(140)
        self.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.MinimumExpanding)
        self._autoscroll = True
        self._max_blocks = int(max_blocks)
        self.appendRequested.connect(self.append_log)

    @QtCore.Slot(str)
    def append_log(self, html_message: str):
        # Добавляем сообщение
        self.append(html_message)

        # Ограничение количества строк (blocks)
        doc = self.document()
        while doc.blockCount() > self._max_blocks:
            cursor = self.textCursor()
            cursor.movePosition(QtGui.QTextCursor.Start)
            cursor.select(QtGui.QTextCursor.BlockUnderCursor)
            cursor.removeSelectedText()
            cursor.deleteChar()

        # Автопрокрутка
        if self._autoscroll:
            self.moveCursor(QtGui.QTextCursor.End)
            self.ensureCursorVisible()

    def clear_logs(self):
        self.clear()

    def set_autoscroll(self, enabled: bool):
        self._autoscroll = bool(enabled)

    def autoscroll(self) -> bool:
        return self._autoscroll


def _level_to_index(levelno: int) -> int:
    order = [logging.DEBUG, logging.INFO, logging.WARNING, logging.ERROR, logging.CRITICAL]
    try:
        return order.index(levelno)
    except ValueError:
        return 1  # INFO по умолчанию


def create_logger_section(parent=None, logger: logging.Logger = None):
    """
    Возвращает (layout, LoggerWidget).
    Кнопки: Clear, Pause/Resume, Save… + выбор уровня логирования.
    Если передан logger — выпадайка управляет его уровнем и уровнями хэндлеров.
    """
    layout = QtWidgets.QVBoxLayout()
    layout.setContentsMargins(0, 0, 0, 0)

    # --- Toolbar ---
    toolbar = QtWidgets.QHBoxLayout()
    btn_clear = QtWidgets.QPushButton("Clear")
    btn_pause = QtWidgets.QPushButton("Pause autoscroll")
    btn_save  = QtWidgets.QPushButton("Save…")
    combo_lvl = QtWidgets.QComboBox()
    combo_lvl.addItems(["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"])

    toolbar.addWidget(btn_clear)
    toolbar.addWidget(btn_pause)
    toolbar.addStretch(1)
    toolbar.addWidget(QtWidgets.QLabel("Level:"))
    toolbar.addWidget(combo_lvl)
    toolbar.addWidget(btn_save)

    # --- Log widget ---
    widget = LoggerWidget(parent)

    layout.addLayout(toolbar)
    layout.addWidget(widget)

    # Wire: clear
    btn_clear.clicked.connect(widget.clear_logs)

    # Wire: pause/resume autoscroll
    def _toggle_pause():
        widget.set_autoscroll(not widget.autoscroll())
        btn_pause.setText("Resume autoscroll" if not widget.autoscroll() else "Pause autoscroll")
    btn_pause.clicked.connect(_toggle_pause)

    # Wire: level combo → logger level
    def _change_level(text: str):
        if logger is None:
            return
        lvl = getattr(logging, text, logging.INFO)
        logger.setLevel(lvl)
        for h in list(logger.handlers):
            try:
                h.setLevel(lvl)
            except Exception:
                pass
    combo_lvl.currentTextChanged.connect(_change_level)

    # Инициализация состояния выпадайки по текущему уровню логгера
    if logger is not None:
        idx = _level_to_index(logger.level or logging.INFO)
        combo_lvl.setCurrentIndex(idx)

    # Wire: save to file
    def _save_logs():
        path, _ = QtWidgets.QFileDialog.getSaveFileName(
            parent, "Save log", "ST_CH_Skinning.log",
            "Log files (*.log);;Text files (*.txt);;All files (*.*)"
        )
        if not path:
            return
        try:
            text = widget.toPlainText()
            with open(path, "w", encoding="utf-8") as f:
                f.write(text)
        except Exception as e:
            QtWidgets.QMessageBox.critical(parent, "Save log failed", str(e))
    btn_save.clicked.connect(_save_logs)

    return layout, widget
