#!/usr/bin/env python
import os, string, json, re, urllib
from bs4 import BeautifulSoup

from env import storeInfoConfig, domain, read, save, handler, Session, skipped_errors
from utils.app_util import *

from utils.app_config import AppConfig
from utils.web_fetcher import WebFetcher
from domain.handler.url_handler import UrlHandler
from domain.dao.StoreInfoDAO import StoreInfoDAO
from domain.model.StoreInfo import StoreInfo


class StoreInfoHandler:
    
    node = "StoreInfo"
    dao = None

    def getUrlList(self):
        handler = UrlHandler()
        value = []
        m = 1
        for m in xrange(59):
            m = m + 1
            value.append(m)
        url_list = handler.get_url_list(storeInfoConfig, self.node, value)
        return url_list

    def run(self):
        self.dao = StoreInfoDAO() 
        urlList = self.getUrlList()
        fetcher = WebFetcher(domain)
        encode = storeInfoConfig.get(self.node, "encode")
        m = 1
        for url in urlList:
            print url
            data = fetcher.get(url, encode)
            data = handler.get_records(storeInfoConfig, self.node, data)
            for item in data:
                self.save(item)
            m = m + 1
        Session.commit()

    def save(self, item):
        store = StoreInfo()
        store.name = item[0]
        store.brands = item[2]
        store.address = item[4]
        store.tel = item[8]
        self.dao.add(store)        
