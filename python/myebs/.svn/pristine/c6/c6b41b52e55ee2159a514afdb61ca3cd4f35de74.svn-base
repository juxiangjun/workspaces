#!/usr/bin/env python
import uuid, time
from env import config, data_handler,  domain, Session, debug, config_file
from handler.base_handler import BaseHandler
from model.profile import Profile 
from utils.web_fetcher import WebFetcher
from dao import profile_dao as dao

class ProfileHandler(BaseHandler):

	node = 'profile'
	
	def run(self):
		url_list = self.get_url_list(config, self.node)
		encode = config.get(self.node, 'encode')
		handler = data_handler
		fetcher = WebFetcher(domain)
		m = 0
		for url in url_list:
			if m !=0 and  m % 100 == 0:
				fetcher.close()
				print 'close current connection and re-connnect to server now.'
				#time.sleep(10)
				fetcher = WebFetcher(domain)
			data = fetcher.get(url, encode)
			record = handler.get_soup_data(config, self.node, data)	
			self.save(self.stocks[m], record)
			m = m + 1
		
		Session.commit()

	def save(self, stock, data):
		profile = Profile(stock, data)
		if int(debug[3]):
			dao.add(profile)
