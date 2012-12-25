# Create your views here.

from django.shortcuts import render_to_response
from django.template import RequestContext
from cfs.service.cfs_service import CfsService
from cfs.models import CfsMetric

cfsService = CfsService()

def index(request):
	metric_list = cfsService.get_cfs_metric_list()
	return render_to_response(\
			"cfs/index.html",\
			{'metric_list':metric_list},RequestContext(request))

def gen_report(request, metric_id):
	
	metric = cfsService.get_metric_by_id(metric_id)
	table = cfsService.generate_report(0, 2001, metric)
	return render_to_response(\
			"cfs/report.html",\
			{"metric":metric, 'table':table},RequestContext(request))
