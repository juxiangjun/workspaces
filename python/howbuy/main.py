#!/usr/bin/env python
from handler.fund_company_handler import FundCompanyHandler

class Main:
	def run(self):
		self.get_fund_companys()

	def get_fund_companys(self):
		handler = FundCompanyHandler()
		handler.run()


if __name__ == '__main__':
	main = Main()
	main.run()
