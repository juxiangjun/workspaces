#!/usr/bin/evn python
#coding utf-8

import admin.stock.dao.stock_dao as dao
class SinaReportFetcher:
	def get_reports(self):
		stocks = dao.get_stock_list()
		for stock in stocks:
			print stock.code

if __name__ == '__main__':
	fetcher = SinaReportFetcher()
	fetcher.get_reports()
