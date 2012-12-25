#!/usr/bin/env python

from utils.web_fetcher import WebFetcher

if __name__ == '__main__':
	domain = 'www.howbuy.com'
	url = '/fund/company/'
	fetcher = WebFetcher(domain)
	data = fetcher.get(url, 0)
	print data
