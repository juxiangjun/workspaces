#!/usr/bin/env python
from bs4 import BeautifulSoup
if __name__ == '__main__':
	soup = BeautifulSoup(open('a.html'))
	m = 0
	for td in soup.find_all('td'):
		if td.find('table') is None:
			print td.get_text()
