#!/usr/bin/env python
import uuid
from env import config, data_handler, fetcher, Session, debug, config_file
from handler.base_handler import BaseHandler
from model.dividend import Dividend 
from dao import trans_data_dao as dao

class DividendHandler(BaseHandler):

	node = 'dividend'
	
	def run(self):
		url_list = self.get_url_list(config, self.node)
		encode = config.get(self.node, 'encode')
		handler = data_handler
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
