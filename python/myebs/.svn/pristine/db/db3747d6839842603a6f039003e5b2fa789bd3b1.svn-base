#!/usr/bin/env python
#coding: utf-8

from cfs.models import CfsMetric

class CfsMetricDAO:

	def get_all(self):
		return CfsMetric.objects.all();

	def get_metric_by_id(self, metric_id):
		return CfsMetric.objects.get(id=metric_id);
