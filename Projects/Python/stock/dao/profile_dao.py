from env import Session 
from model.profile import Profile 

class ProfileDAO:

	def get_profile_list (self):
		return Session.query(Profile).all()

	def get_stock_by_province(self):
		return Session.query(Profile).filter_by(province=' like %sse%').all()

	def add(self, profile):
		Session.add(profile)
