import sys, os
from sqlalchemy import *
import sqlalchemy.util as util
from sqlalchemy.orm import *
import string, sys
from sae.const import (MYSQL_HOST, MYSQL_HOST_S,
    MYSQL_PORT, MYSQL_USER, MYSQL_PASS, MYSQL_DB
)



class DBEngine:
	# initialize paramters which used for db connection
	def __init__(self, config):
		if 'SERVER_SOFTWARE' in os.environ:
			from sae.const import (
				MYSQL_HOST, MYSQL_PORT, MYSQL_USER, MYSQL_PASS, MYSQL_DB
			)   
		else:
			# Make `python manage.py syncdb` works happy!
			MYSQL_HOST = 'localhost'
			MYSQL_PORT = '3306'
			MYSQL_USER = 'test'
			MYSQL_PASS = 'test'
			MYSQL_DB   = 'stock'

		self.host = MYSQL_HOST 
		self.port = MYSQL_PORT
		self.user = MYSQL_USER 
		self.password = MYSQL_PASS 
		self.db = MYSQL_DB 
	# create db engine
	def create_engine(self):
		url = 'mysql://'+self.user+':'+self.password+'@'+self.host+':'+self.port+'/'+self.db
		try:
			engine = create_engine (url, connect_args={'charset':'utf8'}, echo=False, pool_recycle=7200 )
			return engine
		except Exception as e:
			print 'fetal error encounted', e
			sys.exit()

	#return session for client
	def get_session(self):
		engine = self.create_engine()
		Session = scoped_session(sessionmaker(bind=engine));
		return Session()
