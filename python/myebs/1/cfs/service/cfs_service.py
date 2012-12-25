#!/usr/bin/env python
#coding: utf-8
import json
from cfs.dao.cfs_metric_dao import CfsMetricDAO
from cfs.dao.cfs_rpt_data_dao import CfsRptDataDAO

class CfsService:

	def __init__(self):
		self.cfsMetricDAO = CfsMetricDAO()
		self.cfsRptDataDAO = CfsRptDataDAO()

	def get_cfs_metric_list(self):
		return self.cfsMetricDAO.get_all()

	def get_metric_by_id(self, metric_id):
		return self.cfsMetricDAO.get_metric_by_id(metric_id)

	def get_rpt_data(self, user_id, formular, year):
		data = {}
		rpt_code = formular['rpt']
		item_code = formular['code']
		key = formular['id']
		value = self.cfsRptDataDAO.get_rpt_data(user_id, rpt_code, item_code, year) 	 
		data[key]=value
		return data

	def update_formular_id(self, f_id, formulars):
		previous_id = f_id-1
		tmp = json.dumps(formulars)
		tmp = tmp.replace('yn-1', 'y'+str(previous_id))
		tmp = tmp.replace('yn', 'y'+str(f_id))
		tmp = json.loads(tmp)
		return tmp

	def get_min_value(self, years):
		result = None
		m = 0
		for year in years:
			year = int(year)
			if m==0:
				result = year
			else:
				if year<result:
					result = year
			m = m + 1
		return result

	def get_column_data_by_formular(self, formular, data):
		result = {}
		f = formular['formular']
		print f
		for (k,v) in data.items():
			f = f.replace(str(k),str(v))
		print formular['id'], eval(f)
		result[formular['id']] = eval(f)
		return result

	def generate_report(self, user_id, rpt_year, metric):
		years = metric.years.split(',')
		columns = len(years)+1
		title = ['item']

		fixed_items = metric.fixed_items.split(',') 
		rows = len(fixed_items)
		value_items = json.loads(metric.value_items)
		cnt = len(value_items) 
		year_data_list = []

		formulars = value_items[0]['formulars']

		total_values = {}
		if cnt==2:
			year = rpt_year+self.get_min_value(years)-1
			year_data = self.get_year_data(0, year, formulars, total_values)
			year_data_list.append(year_data)
			total_values.update(year_data)
			formulars = value_items[1]['formulars']
			title.append(str(year))

		n = 1
		for year in years:
			year = int(year) + rpt_year
			title.append(str(year))
			updated_formulars = self.update_formular_id(n, formulars)	
			year_data = self.get_year_data(n, year, updated_formulars, total_values)
			year_data_list.append(year_data)
			n = n + 1

		data = []
		for item in year_data_list:
			column = []	
			t = sorted(item.items(), key=lambda d: d[0])
			for key, value in t:
				column.append(value)
			data.append(column)

		return self.format_data(title, fixed_items, data)

	def get_year_data(self, seq, year, formulars, total_values):
		year_data = {}
		default_items = []

		for formular in formulars:
			data_type = int(formular['type'])
			if data_type==-1:
				default_items.append(formular["id"])
			column_data = self.get_column_data(seq, year, formular, total_values)
			year_data.update(column_data)
			total_values.update(column_data)

		for item in default_items:
			del(year_data[item])
		return year_data

	def get_column_data(self,seq,  year, formular, total_values):
		data_type = int(formular['type'])
		ignore = int(formular['ignore'])
		data = {}

		if ignore == seq:
			data_type = -1

		if data_type==0:
			data = self.get_rpt_data(0, formular, year)

		if data_type==1:
			data = self.get_column_data_by_formular(formular, total_values)

			
		if data_type<0:
			key = str(formular['id'])
			value = str(formular['value'])
			data[key]=value
		return data

	def format_data(self, title, fixed_items, data):
		i = len(fixed_items)
		m = 0
		n = len(data)
		rows = []
		rows.append(title)
		for m in xrange(i):
			row = []
			row.append(fixed_items[m])
			for index in xrange(n):
				row.append(data[index][m])	
			rows.append(row)
		return rows
