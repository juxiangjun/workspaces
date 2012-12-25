import uuid

from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

from admin.stock.utils.app_util import get_now

Base = declarative_base()

class Stock(Base):
	__tablename__ = 'stk_info'

	id=Column(String, primary_key=True)
	code = Column(String)
	name = Column(String)
	created_time = Column(String)

	def __init__(self, code, name):
		self.id = uuid.uuid1()
		self.code = code
		self.name = name
		self.created_time = get_now(0)
