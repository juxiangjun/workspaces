#!/usr/bin/env python
#coding: utf-8

from users.models import User

class UserDAO:
	def get_all(self):
		return User.objects.all()

	def get_user_by_id(self, user_id):
		return User.object.get(id=user_id)
		
