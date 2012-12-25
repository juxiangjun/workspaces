#!/usr/bin/env python
import uuid
from admin.stock.env import config, data_handler, domain, Session, debug
from admin.stock.utils.app_util import encode
from admin.stock.handler.url_handler import UrlHandler
from admin.stock.utils.web_fetcher import WebFetcher
from admin.stock.model.stock import Stock
from admin.stock.dao import stock_dao as dao 

class StockHandler:

	node = 'stock'

	def get_url_list(self):
		handler = UrlHandler()
		values = []
		m = 0
		n = 1 
		for m in xrange(20):
			value = []
			value.append(m*50+n)
			values.append(value)
			m = m + 1
		url_list = handler.get_url_list(config, self.node, values)
		return url_list

	def run(self):
		url_list = self.get_url_list()
		handler = data_handler
		stocks = dao.get_stock_list()
		encode = config.get(self.node, 'encode')
		fetcher = WebFetcher(domain)
		m = 0
		for url in url_list:
			m = m + 1
			data = fetcher.get(url, int(encode))
			data = handler.get_soup_data(config, self.node, data)
			for item in data:
				self.save(stocks, item)		
		Session.commit()

	def save(self, stocks, item):
		code = item[0]
		new = 1 

		if int(debug[2]):
				print item
	
		for stock in stocks:
			if stock.code == code:
				new = 0
		if new:
			name = item[1]
			stock = Stock(code, name)

		
			if int(debug[3]):
				dao.add(stock)	
