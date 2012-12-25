from env import Session 
from model.dividend import Dividend 

class DividendDAO:

	def get_dividend_list (self):
		return Session.query(Dividend).all()

	def add(self, dividend):
		Session.add(dividend)
