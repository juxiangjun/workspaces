#!/usr/bin/env python
import sys
from handler.trans_data_handler import TransDataHandler
from handler.stock_handler import StockHandler
from handler.profile_handler import ProfileHandler
from handler.dividend_handler import DividendHandler
from handler.sina_report_handler import SinaReportHandler

class Main:

	def get_stocks(self):
		handler = StockHandler()
		handler.run()
		handler = ProfileHandler()
		handler.run()
		handler = DividendHandler()
		handler.run()

	def get_trans_data(self):
		handler = TransDataHandler()
		handler.run()

	def get_sina_reports(self):
		handler = SinaReportHandler()
		handler.run()


if __name__ == '__main__':
	main = Main()
	action = sys.argv[1]
	

	if action == '0':
		main.get_stock()

	if action == '1':
		main.get_trans_data()	

	if action == '2':
		main.get_sina_reports()	


