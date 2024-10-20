# -*- encoding:utf-8 -*-
import os
from logging import getLogger, StreamHandler, DEBUG
import sys

# logger setting
logger = getLogger(__name__)
handler = StreamHandler()
handler.setLevel(DEBUG)
logger.setLevel(os.getenv("LOG_LEVEL", DEBUG))
logger.addHandler(handler)
logger.propagate = False

def main():
    logger.debug(sys.argv)

if __name__ == "__main__":
    main()
