#!/usr/bin/env python
from env import app_config
from utils.app_config import AppConfig
from handler.trans_data_handler import TransDataHandler
from handler.stock_handler import StockHandler
from handler.profile_handler import ProfileHandler

class Main:
	def run(self):
		nodes = app_config.get('app', 'nodes').split(',')
		actions = app_config.get('app', 'actions').split(',')
		m = 0
		for node in nodes:
			if m==0:
				config_file = 'config/' + node + '.ini'
				config = AppConfig().load(config_file)
				action = actions[m]+'(config)'
				handler = eval(action)
				handler.run()
				m = m + 1

if __name__ == '__main__':
	main = Main()
	main.run()
