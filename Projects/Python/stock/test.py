#!/usr/bin/env python

from utils.app_config import AppConfig

if __name__ == '__main__':

	config = AppConfig().load('a.ini')
	config.set("node",'bb','1')
	f = open('a.ini', 'w')
	config.write(f)
	f.close()
