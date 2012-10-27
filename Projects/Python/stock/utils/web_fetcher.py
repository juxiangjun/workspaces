import httplib
from utils.app_util import encode

class WebFetcher:

	def __init__(self, domain):
		self.conn = httplib.HTTPConnection(domain)

	def get(self, url, encode_data=0):
		try:
			self.conn.request('GET', url)
			response = self.conn.getresponse()
			print url, response.status, response.reason
			data = response.read()
			if int(encode_data):
				data = encode(data)	
			return data
		except:
			print 'error:', url
			raise
		
	def close(self):
		self.conn.close()
