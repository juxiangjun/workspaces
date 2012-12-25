import uuid

from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

from admin.stock.utils.app_util import get_now

Base = declarative_base()

class User(Base):
	__tablename__ = 'user'

	id=Column(String, primary_key=True)
	name = Column(String)

	def __init__(self, name):
		self.name = name
	
	


