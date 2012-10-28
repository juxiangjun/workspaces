#!/usr/bin/env python
from handler.trans_data_handler import TransDataHandler
from handler.stock_handler import StockHandler
from handler.profile_handler import ProfileHandler

class Main:
	def run(self):
		#self.get_stocks()
		self.get_profiles()

	def get_stocks(self):
		handler = StockHandler()
		handler.run()


	def get_profiles(self):
		handler = ProfileHandler()
		handler.run()

if __name__ == '__main__':
	main = Main()
	main.run()
