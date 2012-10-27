from utils import *

global server_addr
global file_path
global stock_index_url

class Stock:
	def get_index(self):
		html_file_name = 'stock_index.html'
		url = stock_index_url + '1'
		file_name = file_path + html_file_name;

		fetcher = HTMLFetcher(server_addr)
		data = fetcher.run(url, file_name)
	
		index_parser = StockIndexParser()
		total_page = index_parser.read(data)
		total_page = total_page[1]

			

		#parser = StockHTMLParser()
		#content = parser.read(data)

		print total_page[1]

if __name__ == '__main__':
	# get the parameters from config file.
	config = AppConfig()
	config = config.load_config()
	server_addr = config.get('sse', 'server_addr')
	file_path = config.get('run', 'file_path')
	stock_index_url = config.get('sse', 'stock_index_url')

	# get the stock index pages
	stock = Stock()
	stock.get_index()
	 
		
