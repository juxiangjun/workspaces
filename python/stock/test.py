#!/usr/bin/env python
from utils.db_engine import DBEngine
from utils.app_config import AppConfig
if __name__ == '__main__':
	config = AppConfig().load('config/config.ini')
	engine = DBEngine(config)
	engine = engine.create_engine()
	engine.execute('select 1')
	
