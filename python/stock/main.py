#!/usr/bin/env python
from handler.trans_data_handler import TransDataHandler
from handler.stock_handler import StockHandler
from handler.profile_handler import ProfileHandler
from handler.dividend_handler import DividendHandler

class Main:
	def run(self):
		#self.get_stocks()
		#self.get_profiles()
		self.get_trans_data()
		#self.get_dividend()

	def get_stocks(self):
		handler = StockHandler()
		handler.run()


	def get_profiles(self):
		handler = ProfileHandler()
		handler.run()

	def get_trans_data(self):
		handler = TransDataHandler()
		handler.run()

	def get_dividend(self):
		handler = DividendHandler()
		handler.run()

if __name__ == '__main__':
	main = Main()
	main.run()
