#!/usr/bin/evn python
#coding utf-8
import json
from utils.web_fetcher import WebFetcher
from dao.stock_dao import StockDAO 
from dao.usr_rpt_data_dao import UsrRptDataDAO

class SinaReportHandler:

	def __init__(self):
		self.fetcher = WebFetcher('money.finance.sina.com.cn')
		self.usr_rpt_data_dao = UsrRptDataDAO()

	def run(self):
		url = '/corp/go.php/vDOWN_BalanceSheet/displaytype/4/stockid/{code}/ctrl/all.phtml'
		stock_dao = StockDAO()
		stock_list = stock_dao.get_stock_list()
		header = []
		for stock in stock_list:
			if stock.code == '600000':
				self.get_balance_sheet(stock.code)
				self.get_profit_statement(stock.code)
				self.get_cash_flow(stock.code)

	def get_cash_flow(self, code):
		url = '/corp/go.php/vDOWN_CashFlow/displaytype/4/stockid/{code}/ctrl/all.phtml'
		self.save_to_db(code, url)

	def get_profit_statement(self, code):
		url = '/corp/go.php/vDOWN_ProfitStatement/displaytype/4/stockid/{code}/ctrl/all.phtml'
		self.save_to_db(code, url)

	def get_balance_sheet(self, code):
		url = '/corp/go.php/vDOWN_BalanceSheet/displaytype/4/stockid/{code}/ctrl/all.phtml'
		self.save_to_db(code, url)
			
	def save_to_db(self, code, url):
		i = 1
		line = ''
		data = self.fetch_report_data(code, url)
		for data in data:
			if data != '\n':
				line = line + data
			else:
				record = line.split('\t')
				if i == 1:
					header = record
				if i>2:
					print record
					self.save_record(code, header, record)
										
				line = ''
				i = i + 1

	def save_record(self, code, header, record):
		rpt_data = UsrRptData()
		rpt_data.stock_code = code
		rpt_data.rpt_item_name = record[0]

		i = 1
		for year in header:
			if i>1:
					
			i = i +1		

	def fetch_report_data(self, code, url):
		url = url.replace('{code}', code)
		data = self.fetcher.get(url, 1)	
		return data
