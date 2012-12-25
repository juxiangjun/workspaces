from admin.stock.env import Session 
from admin.stock.model.trans_data import TransData

class TransDataDAO:

	def get_trans_data_list (self):
		return Session.query(TransData).all()

	def add(self, trans_data):
		Session.add(trans_data)
