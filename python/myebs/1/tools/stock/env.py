#!/usr/bin/env python
import os
from admin.stock.utils.app_config import AppConfig
from admin.stock.utils.db_engine import DBEngine
from admin.stock.utils.web_fetcher import WebFetcher
from admin.stock.handler.data_handler import DataHandler

file_path = os.path.dirname(__file__)
config_file = file_path+'/config/config.ini'
config = AppConfig().load(config_file)
config = config
# skipped errors
skipped_errors = int(config.get('app', 'skipped_errors'))
# debug
debug = config.get('app', 'debug').split(',')
# web fetcher
domain = config.get('app', 'domain')
# data handler
data_handler = DataHandler(debug)

# db engine
engine = DBEngine(config)
Session = engine.get_session()
