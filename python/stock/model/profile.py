import uuid
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from utils.app_util import get_now, get_data

Base = declarative_base()

class Profile(Base):
	__tablename__ = 'stk_profile'

	id=Column(String, primary_key=True)
	stock_id = Column(String)
	stock_code = Column(String)
	stock_name = Column(String)
	ab_code= Column(String)
	issued_date = Column(String)
	transferable = Column(String)
	short_name = Column(String)
	full_name = Column(String)
	registration_addr = Column(String)
	addr = Column(String)
	principal = Column(String)
	board_secretary = Column(String)
	email = Column(String)
	tel = Column(String)
	web_site = Column(String)
	industry = Column(String)
	sse_industry = Column(String)
	province = Column(String)
	ab_status = Column(String)
	is_sample = Column(String)
	overseas_listing = Column(String)
	overseas_addr = Column(String)
	created_time = Column(String)

	def __init__(self, stock, data):
		self.id = uuid.uuid1()
		self.stock_id = stock.id
		self.stock_code = stock.code
		self.stock_name = stock.name
		self.created_time = get_now(0)

		self.ab_code= get_data(data[0])
		self.issued_date = get_data(data[1])
		self.transferable = get_data(data[2])
		self.short_name = get_data(data[3])
		self.full_name = get_data(data[4])
		self.registration_addr = get_data(data[5])
		self.addr = get_data(data[6])
		self.principal = get_data(data[7])
		self.board_secretary = get_data(data[8])
		self.email = get_data(data[9])
		self.tel = get_data(data[10])
		self.web_site = get_data(data[11])
		self.industry = get_data(data[12])
		self.sse_industry = get_data(data[13])
		self.province = get_data(data[14])
		self.ab_status = get_data(data[15])
		self.is_sample = get_data(data[16])
		self.overseas_listing = get_data(data[17])
		self.overseas_addr = get_data(data[18])
