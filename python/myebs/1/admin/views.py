# Create your views here.
from django.shortcuts import render_to_response
from django.template import RequestContext

from admin.stock.handler.trans_data_handler import TransDataHandler
from admin.stock.handler.stock_handler import StockHandler

from admin.stock.main import Main

main = Main()

def index(request):
	return render_to_response(\
			"admin/index.html",\
			{},RequestContext(request))

def get_stocks(request):
	main.get_stocks()	
	return render_to_response(\
		"admin/index.html",\
		{},RequestContext(request))

def get_trans_data(request):
	main.get_trans_data()
	return render_to_response(\
		"admin/index.html",\
		{},RequestContext(request))
