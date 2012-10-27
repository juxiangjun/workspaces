import urllib
import httplib
import datetime


'''
t11 = datetime.datetime.now()
html =urllib.urlopen('http://www.sseinfo.com'+url)
html.read()
t12 = datetime.datetime.now()
print 'cost11=' + str(t12-t11)
'''
class WebFetcher:
	def __init__(self):
		self.conn = httplib.HTTPConnection('www.sseinfo.com')

	def run(self, url):
		start_time = datetime.datetime.now()
		self.conn.request('GET', url)
		response = self.conn.getresponse()
		data = response.read()
		end_time = datetime.datetime.now()
		print url, "elaspe time:"+ str(end_time - start_time)


if __name__ == '__main__':

	types = ['1','2','3','4','5','6']

	fetcher = WebFetcher()

	for item in types: 
		url = '/infonet/web/fund.do?method=showFund&&date=2012-06-05&type='+item
		fetcher.run(url)
