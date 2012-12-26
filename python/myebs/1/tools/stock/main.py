#!/usr/bin/env python
import sys
from admin.stock.handler.trans_data_handler import TransDataHandler
from admin.stock.handler.stock_handler import StockHandler
from admin.stock.handler.profile_handler import ProfileHandler
from admin.stock.handler.dividend_handler import DividendHandler

class Main:

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
	data = sys.argv[1]

	if data == 0:
		main.get_stock()
		main.get_profiles()
		main.get_divident()

	if data == 1:
		main.get_trans_data()	
