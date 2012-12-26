#!/usr/bin/evn python
from admin.stock.dao import stock_dao as dao
from admin.stock.handler.url_handler import UrlHandler
class BaseHandler:
	
	def __init__(self):
		self.stocks = dao.get_stock_list()
		self.url_handler = UrlHandler()

	def get_url_list(self, config, node):
		values = []
		for stock in self.stocks:
			value = []
			value.append(stock.code)
			values.append(value)
		url_list = self.url_handler.get_url_list(config, node, values)
		return url_list

