#!/usr/bin/env python

from bs4 import BeautifulSoup

f = open('a.html')
data = f.read()
print data

soup = BeautifulSoup(data)
soup= soup("div")
print soup[0].get_text()
