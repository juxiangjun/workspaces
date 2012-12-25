from admin.stock.dao.stock_dao import StockDAO
from admin.stock.dao.profile_dao import ProfileDAO
from admin.stock.dao.trans_data_dao import TransDataDAO
from admin.stock.dao.dividend_dao import DividendDAO


stock_dao = StockDAO()
profile_dao = ProfileDAO()
trans_data_dao = TransDataDAO()
dividend_dao = DividendDAO()
