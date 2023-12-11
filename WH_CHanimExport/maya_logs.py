import logging
import os
import json

dir_ = os.path.dirname(__file__)
log_file = os.path.join(dir_, "logs", "export.log")

logger = logging.getLogger("ExportLogs")
logger.setLevel(logging.DEBUG)

#clean logger
for hnd in logging.handlers:
    print("Removing {} handler".format(hnd))
    logger.removeHandler(handler)

file_handler = logging.FileHandler(log_file, mode = 'w')
file_handler_format = logging.Formatter('[%(module)s.%(funcName)s.%(lineno)d]%(levelname)s:%(message)s')
file_handler.setFormatter(file_handler_format)

logger.addHandler(file_handler)

def main():
    logger.debug("Debug")
    logger.error("Error")
    logger.warning("Warning")

    file_handler.close()
    logger.removeHandler(file_handler)

if __name__:
    main()