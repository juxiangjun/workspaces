#!/usr/bin/env python
#coding: utf-8
import re, string, chardet
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import get_value, get_now, encode_data

Base = declarative_base()

class Fund(Base):
	__tablename__ = 'fund'
	# 1- 5
	id=Column(Integer, primary_key=True)
	code =  Column(String)
	short_name = Column(String)
	full_name = Column(String)
	issued_date = Column(String)
	# 6 - 10
	catelog_name = Column(String)
	manager = Column(String)
	administrator = Column(String)
	custodian = Column(String)
	investment_goal = Column(String)
	# 11- 15
	investment_vision = Column(String)
	investment_scale = Column(String)
	investment_strategy = Column(String)
	characteristics = Column(String)
	benchmark  = Column(String)
	# 16 - 20
	operation_mode = Column(String)
	fund_company_id = Column(Integer)
	fund_company_name = Column(String)
	catelog_id = Column(String)
	status = Column(String)
	# 21 - 22
	created_time = Column(DateTime)
	last_updated_time = Column(DateTime)
	
	def __init__(self, company, code, html_data):

		
		self.code = code
		self.short_name = get_value(html_data[0])
		self.full_name = get_value(html_data[1])

		self.issued_date = self.__format_issued_date(html_data[2])		
		self.catelog_name = get_value(html_data[3])
		self.manager = get_value(html_data[4])

		self.administrator = get_value(html_data[5])
		self.custodian = get_value(html_data[6])
		self.investment_goal = get_value(html_data[7])
		self.investment_vision = get_value(html_data[8])
		self.investment_scale = get_value(html_data[9])

		self.investment_strategy = get_value(html_data[10])
		self.characteristics = get_value(html_data[11])
		self.benchmark = get_value(html_data[12])
		self.operation_mode = get_value(html_data[13])

		self.fund_company_id = company.id
		self.fund_company_name = company.full_name
		self.catelog_id = None
		self.status = '0' 
		self.created_time = get_now(0)
		self.last_updated_time = get_now(0) 

	def __format_issued_date(self, issued_date):
		if issued_date != None:
			if (len(issued_date)>20):
				issued_date = issued_date.strip()[0:10] 
			issued_date = issued_date.encode('utf-8').replace('年','-').replace('月','-').replace('日','').replace('起','') 
			issued_date = issued_date.replace('/','-')

			regex = '\d{2,4}-\d{1,2}-\d{1,2}'
			re_date = re.compile(regex)
			result = re_date.findall(issued_date)
			print result, issued_date
			if len(result)>0:
				issued_date = result[0]
			else:
				issued_date = None

		return issued_date
