#!/usr/bin/env python
import uuid, re
from env import config, handler, domain, Session, debug
from utils.web_fetcher import WebFetcher
from model.fund_company import FundCompany
from dao.fund_company_dao import FundCompanyDAO 
from utils.app_util import print_list

class FundCompanyHandler:

	node = 'fund_company'
	dao = FundCompanyDAO()

	def run(self):
		encode = config.get(self.node, 'encode')
		url = config.get(self.node, 'url')
		print domain
		fetcher = WebFetcher(domain)
		data = fetcher.get(url, int(encode))
		records = handler.get_records(config, self.node, data)
		m = 0
		for record in records:
			if m<70:
				self.save(record)
		Session.commit()

	def save(self, record):
		code = re.search('[\d]{8}',record[1])	
		if code != None:
			record[1] = code.group(0)
		else:
			code = ''
		print_list(record)
		company = FundCompany(record)	
		self.dao.add(company) 
