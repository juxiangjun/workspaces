from admin.stock.env import Session 
from admin.stock.model.stock import Stock

class StockDAO:

	def get_stock_list (self):
		return Session.query(Stock).all()

	def add(self, stock):
		Session.add(stock)
