#!/usr/bin/env python
#coding: utf-8
import random
from cfs.models import CfsRptData

class CfsRptDataDAO:
	
	def get_rpt_data(self, user_id, rpt_code, item_code, year):
		return  random.choice(range(100))
		#return CfsRptData.objects.get(user_id=user_id, rpt_code=rpt_code, item_code=item_code)	


