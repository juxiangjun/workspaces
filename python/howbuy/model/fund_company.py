import uuid

from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import get_value, get_now

from utils.app_util import get_now

Base = declarative_base()

class FundCompany(Base):
	__tablename__ = 'fund_company'

	id=Column(String, primary_key=True)
	code = Column(String)
	short_name = Column(String)
	foundation_date = Column(String)
	created_time = Column(String)

	def __init__(self, html_data ):
		self.id = uuid.uuid1()
		self.code = get_value(html_data[1])
		self.short_name = get_value(html_data[0])
		self.foundation_date = get_value(html_data[2]) 
		self.created_time = get_now(0)
