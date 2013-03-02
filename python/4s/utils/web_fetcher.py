import httplib
from utils.app_util import encode_data

class WebFetcher:

    def __init__(self, domain):
        self.conn = httplib.HTTPConnection(domain)

    def get(self, url, encode=0):
        try:
            self.conn.request('GET', url)
            response = self.conn.getresponse()
            #print url, response.status, response.reason
            data = response.read()
            if int(encode):
                data = encode_data(data)
            return data
        except:
            print 'error:', url
            raise
        
    def close(self):
        self.conn.close()
