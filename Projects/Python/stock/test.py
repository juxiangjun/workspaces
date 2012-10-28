#!/usr/bin/env python
from bs4 import BeautifulSoup
if __name__ == '__main__':
	soup = BeautifulSoup(open('a.html'))
	print soup.prettify()
	for td in soup.find_all('td'):
		print td.get_text().replace('\n','')
