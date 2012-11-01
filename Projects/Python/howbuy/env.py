#!/usr/bin/env python
from utils.app_config import AppConfig
from utils.db_engine import DBEngine
from utils.web_fetcher import WebFetcher
from handler.data_handler import DataHandler

config_file = 'config/config.ini'
config = AppConfig().load(config_file)
config = config
# skipped errors
skipped_errors = int(config.get('app', 'skipped_errors'))
# debug
debug = config.get('app', 'debug').split(',')
# web fetcher
domain = config.get('app', 'domain')
# data handler
handler = DataHandler(debug)

# db engine
engine = DBEngine(config)
Session = engine.get_session()
