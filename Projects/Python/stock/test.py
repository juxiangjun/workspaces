#!/usr/bin/env python
from env import config,config_file
class Test:

	node = ''
	def __init__(self, node):
		self.node = node
	def run(self):
		print self.node


if __name__ == '__main__':
	print config.get('trans_data', 'seq')
	config.set('trans_data', 'seq', '1')
	f = open(config_file, 'w')
	config.write(f)
	f.close()


