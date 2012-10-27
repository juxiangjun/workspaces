import uuid

from sqlalchemy import Column, Float, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

from utils.app_util import get_now, get_data

Base = declarative_base()

class TransData(Base):
	__tablename__ = 'trans_data'

	id=Column(String, primary_key=True)
	stock_code = Column(String)
	stock_name = Column(String)
	created_time = Column(String)

	end_value = Column(Float)
	start_value = Column(Float)
	max_value = Column(Float)
	min_value = Column(Float)
	current = Column(Float)
	qty = Column(Float)
	total = Column(Float)
	ratio  = Column(Float)
	trans_date = Column(String)
	seq = Column(Integer)
	status = Column(String)

	def __init__(self, stock, seq, data):
		self.id = uuid.uuid1()
		self.stock_code = stock.code
		self.stock_name = stock.name
		self.seq = seq
		self.trans_date = get_now(1)
		self.created_time = get_now(0)

		self.end_value = get_data(data[0]) 
		self.start_value = get_data(data[1]) 
		self.max_value = get_data(data[2]) 
		self.min_value =get_data(data[3]) 
		self.current = get_data(data[4]) 
		self.qty = get_data(data[5]) 
		self.total = get_data(data[6]) 
		self.ratio = get_data(data[7]) 

		if self.current is None:
			self.status = '0'
		else:
			self.status = '1'
