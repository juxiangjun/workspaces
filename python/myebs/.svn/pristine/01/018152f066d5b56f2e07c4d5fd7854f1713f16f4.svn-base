from admin.stock.env import Session 
from admin.stock.model.fund_company import FundCompany

class FundCompanyDAO:

	def get_fund_company_list (self):
		return Session.query(FundCompany).all()

	def add(self, fund_company):
		Session.add(fund_company)
