import sys
from sqlalchemy import *
import sqlalchemy.util as util
from sqlalchemy.orm import *
import string, sys

class DBEngine:
	# initialize paramters which used for db connection
	def __init__(self, config):
		database = 'db'
		self.host = config.get(database, 'host')
		self.port = config.get(database, 'port')
		self.user = config.get(database, 'user')
		self.password = config.get(database, 'password')
		self.db = config.get(database, 'db')
	# create db engine
	def __create_engine(self):
	
		url = 'mysql://'+self.user+':'+self.password+'@'+self.host+':'+self.port+'/'+self.db
		try:
			engine = create_engine (url, connect_args={'charset':'utf8'}, echo=False )
			return engine
		except Exception as e:
			print 'fetal error encounted', e
			sys.exit()
	# return session for client
	def get_session(self):
		engine = self.__create_engine()
		Session = scoped_session(sessionmaker(bind=engine));
		return Session()
