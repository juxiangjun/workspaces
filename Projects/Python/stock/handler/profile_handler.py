#!/usr/bin/env python
import uuid
from env import config, data_handler, fetcher, Session, debug, config_file
from handler.base_handler import BaseHandler
from model.trans_data import TransData 
from dao import trans_data_dao as dao

class ProfileHandler(BaseHandler):
	
	def run(self):
		url_list = self.get_url_list(config)
		encode = config.get(self.node, 'encode')
		handler = data_handler
		seq = int(config.get(self.node, 'seq'))
		m = 0
		for url in url_list:
			if m ==0:
				data = fetcher.get(url, encode)
				data = handler.get_soup_data(config, self.node, data)	
				self.save(self.stocks[m], seq, data)
			m = m + 1
		Session.commit()
		self.update_seq(seq)	

	def save(self, stock, seq, data):
		trans_data = TransData(stock, seq, data)
		dao.add(trans_data)

	def update_seq(self, seq):
		seq = seq + 1
		f = open(config_file, 'w')
		config.set(self.node, 'seq', seq)
		config.write(f)
		f.close()
		
		
