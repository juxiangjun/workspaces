#!/usr/bin/env python
import uuid, time
from env import config, data_handler, domain, Session, debug, config_file
from handler.base_handler import BaseHandler
from utils.web_fetcher import WebFetcher
from model.trans_data import TransData 
from dao import trans_data_dao as dao

class TransDataHandler(BaseHandler):
	node = 'trans_data'
	
	def run(self):
		url_list = self.get_url_list(config, self.node)
		encode = config.get(self.node, 'encode')
		handler = data_handler
		seq = int(config.get(self.node, 'seq'))
		fetcher = WebFetcher(domain)
		m = 0
		current = int(config.get(self.node, 'current'))
		try:
			for url in url_list:
				if m > current:
					print m+1
					data = fetcher.get(url, encode)
					data = handler.get_soup_data(config, self.node, data)	
					self.save(self.stocks[m], seq, data)
				m = m + 1

			self.set_config('current', '-1')
			self.set_config('seq', str(seq+1))
		except:
			self.set_current('current', str(m-1))
			raise
		finally:
			Session.commit()
	

	def set_config(self, sub_node, m):
		f = open(config_file, 'w')
		config.set(self.node, sub_node, m)
		config.write(f)
		f.close()

	def save(self, stock, seq, data):
		trans_data = TransData(stock, seq, data)
		if int(debug[3]):
			dao.add(trans_data)
