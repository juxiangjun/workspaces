#!/usr/bin/env python
from env import app_config
from utils.app_config import AppConfig
from handler.trans_data_handler import TransDataHandler
from handler.stock_handler import StockHandler
from handler.profile_handler import ProfileHandler

class Main:
	def run(self):
		self.get_stocks()

	def get_stocks(self):
		handler = StockHandler()
		handler.run()

if __name__ == '__main__':
	main = Main()
	main.run()
