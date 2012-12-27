#!/usr/bin/evn python
#coding utf-8
import time
from env import Session
from utils.web_fetcher import WebFetcher
from dao.stock_dao import StockDAO 
from dao.usr_rpt_data_dao import UsrRptDataDAO
from model.usr_rpt_data import UsrRptData

class SinaReportHandler:

	def __init__(self):
		self.fetcher = WebFetcher('money.finance.sina.com.cn')
		self.usr_rpt_data_dao = UsrRptDataDAO()

	def reconnect(self):
		self.fetcher.close();
		print 'take a break for 5 seconds'
		time.sleep(5)
		self.fetcher = WebFetcher('money.finance.sina.com.cn')

	def run(self):
		url = '/corp/go.php/vDOWN_BalanceSheet/displaytype/4/stockid/{code}/ctrl/all.phtml'
		stock_dao = StockDAO()
		stock_list = stock_dao.get_stock_list()
		header = []
		i = 1
		for stock in stock_list:
			print stock.code, stock.name
			self.get_balance_sheet(stock.code)
			self.get_profit_statement(stock.code)
			self.get_cash_flow(stock.code)
			Session.commit()			
			if i % 5 ==0:
				self.reconnect()
			i = i+1
		

	def get_cash_flow(self, code):
		url = '/corp/go.php/vDOWN_CashFlow/displaytype/4/stockid/{code}/ctrl/all.phtml'
		self.save_to_db(code, url, '03')

	def get_profit_statement(self, code):
		url = '/corp/go.php/vDOWN_ProfitStatement/displaytype/4/stockid/{code}/ctrl/all.phtml'
		self.save_to_db(code, url, '02')

	def get_balance_sheet(self, code):
		url = '/corp/go.php/vDOWN_BalanceSheet/displaytype/4/stockid/{code}/ctrl/all.phtml'
		self.save_to_db(code, url, '01')
			
	def save_to_db(self, code, url, rpt_type):
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
					self.save_record(code, header, record, rpt_type)
										
				line = ''
				i = i + 1

	def save_record(self, code, header, record, rpt_type):
		rpt_data = UsrRptData()
		rpt_data.stock_code = code
		rpt_data.rpt_type_code = rpt_type
		rpt_data.rpt_item_name = record[0]
		n = len(record)

		if n>2:
			m,i = 0,1
			q1, q2, q3, q4 = [],[],[],[]
			m1, m2, m3, m4 = 0, 0, 0, 0
			for date in header:
				if i>1 and i<n-1:
					year = date[0:4]
					value = '%f'%eval(record[i-1])
					tmp = date[4:8] 
					if tmp=='0331':
						json = self.get_json_str(m1, year, value, date)
						q1.append(json)	
						m1 = m1 + 1
					if tmp == '0630':
						json = self.get_json_str(m2, year, value, date)
						q2.append(json)	
						m2 = m2 + 1
					if tmp == '0930':
						json = self.get_json_str(m3, year, value, date)
						q3.append(json)	
						m3 = m3 + 1
					if tmp == '1231':
						json = self.get_json_str(m4, year, value, date)
						q4.append(json)	
						m4 = m4 + 1
				i = i +1		
			rpt_data.q1 = ''.join(q1)
			rpt_data.q2 = ''.join(q2)
			rpt_data.q3 = ''.join(q3)
			rpt_data.q4 = ''.join(q4)
		self.usr_rpt_data_dao.add(rpt_data)
	
	def get_json_str(self, m, year, value, date):
		result = ''
		if int(m)>0:
			result = ',{\'year\':\''+str(year)+'\',\'value\':\''+str(value)+'\',\'date\':\''+str(date)+'\'}'
		else:
			result = '{\'year\':\''+str(year)+'\',\'value\':\''+str(value)+'\',\'date\':\''+str(date)+'\'}'
		return result



	def fetch_report_data(self, code, url):
		url = url.replace('{code}', code)
		data = self.fetcher.get(url, 1)	
		return data
