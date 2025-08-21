import logging
from PySide2 import QtCore

class QtLogHandler(logging.Handler):
    def __init__(self, widget):
        super().__init__()
        self.widget = widget
        # аккуратный формат; при желании вынеси в конфиг
        self.setFormatter(logging.Formatter("%(asctime)s | %(levelname)s | %(message)s"))

    def emit(self, record):
        try:
            msg = self.format(record)
            # лёгкая HTML-подсветка уровня
            level = record.levelname
            html = f"<div><b>{level}</b> — {msg}</div>"
            # безопасно в UI-поток:
            self.widget.appendRequested.emit(html)
        except Exception:
            # не роняем логгер, даже если UI закрыт
            pass

def attach_qt_handler(logger, widget):
    # удалить прежние QtLogHandler, чтобы не дублировать при переоткрытии окна
    for h in list(logger.handlers):
        if isinstance(h, QtLogHandler):
            logger.removeHandler(h)
    h = QtLogHandler(widget)
    h.setLevel(logger.level)  # можно поставить logging.INFO
    logger.addHandler(h)
    return h