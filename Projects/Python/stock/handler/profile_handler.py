#!/usr/bin/env python
import uuid
from env import config, data_handler, fetcher, Session, debug, config_file
from handler.base_handler import BaseHandler
from model.profile import Profile 
from dao import trans_data_dao as dao

class ProfileHandler(BaseHandler):

	node = 'profile'
	
	def run(self):
		url_list = self.get_url_list(config, self.node)
		encode = config.get(self.node, 'encode')
		handler = data_handler
		m = 0
		for url in url_list:
			if m ==0:
				data = fetcher.get(url, encode)
				data = handler.get_soup_data(config, self.node, data)	
				self.save(self.stocks[m], data)
			m = m + 1
		Session.commit()

	def save(self, stock, data):
		profile = Profile(stock, data)
		if int(debug[3]):
			dao.add(trans_data)
