#!/usr/bin/env python
#coding: utf-8

from users.dao.user_dao import UserDAO

class UserService:

	def __init__(self):
		self.user_dao = UserDAO()

	def get_users(self):
		return self.user_dao.get_all()

	def get_user_by_id(self, user_id):
		return self.user_dao.get_user_by_id(user_id)
