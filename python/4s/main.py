#!/usr/bin/env python
from domain.handler.StoreInfoHandler import StoreInfoHandler
import sys


class Main:

    def getStoreInfo(self):
        handler = StoreInfoHandler()
        handler.run()

if __name__ == '__main__':
    main = Main()
    main.getStoreInfo()
