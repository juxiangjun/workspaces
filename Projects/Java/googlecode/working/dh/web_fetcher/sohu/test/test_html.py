from utils import *
import httplib


config = AppConfig()
config = config.load_config()
fetcher = WebFetcher(config.get('sohu', 'server_addr'))
html_data = fetcher.run('/bank/bksearch.html?yh=1&pageNO=1&bkstatus=1', '')
print html_data

