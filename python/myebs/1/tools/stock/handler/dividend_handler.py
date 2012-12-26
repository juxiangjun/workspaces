#!/usr/bin/env python
import uuid
from admin.stock.env import config, data_handler, domain, Session, debug, config_file
from admin.stock.handler.base_handler import BaseHandler
from admin.stock.utils.web_fetcher import WebFetcher
from admin.stock.model.dividend import Dividend 
from admin.stock.dao import dividend_dao as dao

class DividendHandler(BaseHandler):

	node = 'dividend'
	
	def run(self):
		url_list = self.get_url_list(config, self.node)
		encode = config.get(self.node, 'encode')
		handler = data_handler
		fetcher = WebFetcher(domain)
		m = 0
		for url in url_list:
			data = fetcher.get(url, encode)
			data = handler.get_soup_data(config, self.node, data)	
			self.save(self.stocks[m], data)
			m = m + 1
		Session.commit()

	def save(self, stock, data):
		if int(debug[3]):
			for record in data:
				dividend = Dividend(stock, record)
				dao.add(dividend)
