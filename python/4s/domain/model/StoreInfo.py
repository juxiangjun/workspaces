import uuid

from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

from utils.app_util import get_now

Base = declarative_base()

class StoreInfo(Base):
    __tablename__ = 'store_info'

    id=Column(String, primary_key=True)
    code = Column(String)
    name = Column(String)
    brands = Column(String)
    address= Column(String)
    tel = Column(String)
    activity = Column(String)
    details = Column(String)
    created_time = Column(String)

    def __init__(self):
        self.id = uuid.uuid1()
        self.created_time = get_now(0)
