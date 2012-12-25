import httplib

class WebFetcher:

	def __init__(self, domain):
		self.conn = httplib.HTTPConnection(domain)

	def get(self, url, is_encode):
		try:
			self.conn.request('GET', url)
			response = self.conn.getresponse()
			print url, response.status, response.reason
			data = response.read()
			if is_encode:
				data = encode_data(data)
			return data
		except:
			print 'error:', url
			raise
		
	def close(self):
		self.conn.close()
