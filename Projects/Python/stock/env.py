#!/usr/bin/env python
from utils.app_config import AppConfig
from utils.db_engine import DBEngine
from utils.web_fetcher import WebFetcher
from handler.data_handler import DataHandler

config_file = 'config/config.ini'
app_config = AppConfig().load(config_file)
config = app_config
# skipped errors
skipped_errors = int(app_config.get('app', 'skipped_errors'))
# debug
debug = app_config.get('app', 'debug').split(',')
# web fetcher
domain = app_config.get('app', 'domain')
fetcher = WebFetcher(domain)
# data handler
data_handler = DataHandler(debug)

# db engine
engine = DBEngine(app_config)
Session = engine.get_session()
