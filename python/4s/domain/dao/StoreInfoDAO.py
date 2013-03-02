from env import Session 
from domain.model.StoreInfo import StoreInfo

class StoreInfoDAO:

    def getStoreInfolist (self):
        return Session.query(StoreInfo).all()

    def add(self, StoreInfo):
        Session.add(StoreInfo)
