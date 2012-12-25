#!/usr/bin/env python
from bs4 import BeautifulSoup
from admin.stock.utils.app_util import print_list,divide_by_record
from admin.stock.utils.page_info_parser import PageInfoParser
import os, string, json, re, urllib

class DataHandler:

	def __init__(self, debug):
		self.debug = debug

	def get_json_data(self, config, node, data):
		data_node = config.get(node, 'data_node')
		data = json.loads(data)
		return data[data_node]

	def get_html_data(self, config, node, data, multi):
		# get settings.
		data_index = config.get(node, 'data_index').strip().split(',')
		start_index = int(config.get(node, 'start_index'))
		tmp = []
		m = 1
		for item in data:            
			if m > start_index:
				tmp.append(item)
			m = m + 1
		data = tmp
		if multi:
			field_count = int(config.get(node, 'field_count'))
			data = self.get_collections(data, field_count, data_index)
		else:
			tmp = []
			length = len(data)
			for index in data_index:
				index = int(index)
				if index>=length:
					index = -1
				if index == -1:
					tmp.append('')
				else:
					tmp.append(data[index])
			data = tmp

		if (int(self.debug[1])):
			print_list(data)
		return data

	def get_collections(self, data,field_count, data_index):
		m = 0
		data = divide_by_record(data, field_count)	
		records = []
		for item in data:
			record = []
			length = len(item)
			for index in data_index:
				index = int(index)
				if index > length:
					index = -1

				if index == -1:
					record.append('')
				else:
					tmp = item[index]
					record.append(tmp)

			records.append(record)
		return records	

	def get_soup_data (self, config, node, data):
		keys = config.get(node, 'property_name').split(',')	
		values = config.get(node, 'property_value').split(',')	
		data_tag  = config.get(node, 'data_tag').strip()
		soup_index = config.get(node, 'soup_index').split(',')
		soup = BeautifulSoup(data)
		m = 0	
		attrs = '{'
		for key in keys:
			if key.strip() != '':
				attrs = attrs + '\"' + key +'\":\"' + values[m] + '\"'
				m = m + 1
		attrs = attrs + '}';
		
		attrs_value = json.loads(attrs);		

		if data_tag.strip() != '':
			if len(attrs_value)>0:
				data = soup(data_tag, attrs = attrs_value)
			else:
				data = soup(data_tag)

		length = len(data)
		tmp = []
		include_tag = config.get(node, 'include_tag')
		exclude_tag = config.get(node, 'exclude_tag')
		for index in soup_index:
			index = int(index)
			if index < length:
				item = data[index].prettify()
				n = 0
				for td in data[index].find_all(include_tag):
					get_text = True
					if len(exclude_tag.strip())>0:
						if td.find(exclude_tag) is not None:
							get_text = False

					if get_text:
						n = n + 1
						text = td.get_text()
						value = ''
						for line in text:
							value = value + line.strip().replace('\n','') 
						tmp.append(value)			
		data = tmp

		if int(self.debug[0]):
			print_list(data)

		return self.parser(config, node, data)

	def parser(self, config, node, data):
		multi = int(config.get(node, 'multi'))
		tmp = self.get_html_data(config, node, data, multi)
		return tmp
