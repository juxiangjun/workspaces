from django.db import models

# Create your models here.
class CfsMetric(models.Model):
    id = models.IntegerField(primary_key=True)
    code = models.CharField(max_length=24, blank=True)
    name = models.CharField(max_length=192, blank=True)
    parent_id = models.CharField(max_length=24, blank=True)
    is_rpt = models.IntegerField(null=True, blank=True)
    years = models.CharField(max_length=24, blank=True)
    formular = models.TextField(blank=True)
    comments = models.CharField(max_length=768, blank=True)
    used_items = models.CharField(max_length=768, blank=True)
    fixed_items = models.CharField(max_length=768, blank=True)
    value_items = models.TextField(blank=True)
    measurement_interval= models.CharField(max_length=768, blank=True)
    status = models.CharField(max_length=8, blank=True)
    class Meta:
        db_table = u'cfs_metric'


class CfsRptData(models.Model):
    id = models.IntegerField(primary_key=True)
    usr_id = models.IntegerField(null=True, blank=True)
    cfs_rpt_item_id = models.IntegerField(null=True, blank=True)
    cfs_rpt_item_code = models.CharField(max_length=24, blank=True)
    cfs_rpt_item_name = models.CharField(max_length=192, blank=True)
    amount = models.FloatField(null=True, blank=True)
    comments = models.CharField(max_length=384, blank=True)
    cfs_rpt_type_id = models.IntegerField(null=True, blank=True)
    cfs_rpt_type_code = models.CharField(max_length=12, blank=True)
    created_by = models.CharField(max_length=96, blank=True)
    created_date = models.DateTimeField(null=True, blank=True)
    last_modified_by = models.CharField(max_length=765, blank=True)
    last_modified_date = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'cfs_rpt_data'

class CfsRptItem(models.Model):
    id = models.IntegerField(primary_key=True)
    code = models.CharField(max_length=24, blank=True)
    name = models.CharField(max_length=192, blank=True)
    is_reduce_item = models.CharField(max_length=3, blank=True)
    formular = models.CharField(max_length=384, blank=True)
    cfs_rpt_prop_id = models.IntegerField(null=True, blank=True)
    cfs_rpt_prop_code = models.CharField(max_length=12, blank=True)
    cfs_rpt_prop_name = models.CharField(max_length=96, blank=True)
    cfs_rpt_type_id = models.IntegerField(null=True, blank=True)
    cfs_rpt_type_code = models.CharField(max_length=12, blank=True)
    cfs_rpt_type_name = models.CharField(max_length=96, blank=True)
    class Meta:
        db_table = u'cfs_rpt_item'

class CfsRptParams(models.Model):
    id = models.IntegerField(primary_key=True)
    min_years = models.IntegerField(null=True, blank=True)
    versions = models.CharField(max_length=114, blank=True)
    curr_verersion = models.CharField(max_length=24, blank=True)
    class Meta:
        db_table = u'cfs_rpt_params'

class CfsRptProp(models.Model):
    id = models.IntegerField(primary_key=True)
    code = models.CharField(max_length=12, blank=True)
    name = models.CharField(max_length=96, blank=True)
    cfs_rpt_type_id = models.IntegerField(null=True, blank=True)
    cfs_rpt_type_code = models.CharField(max_length=12, blank=True)
    cfs_rpt_name = models.CharField(max_length=48, blank=True)
    class Meta:
        db_table = u'cfs_rpt_prop'

class CfsRptStyle(models.Model):
    id = models.IntegerField(primary_key=True)
    line_no = models.IntegerField(null=True, blank=True)
    code = models.CharField(max_length=24, blank=True)
    name = models.CharField(max_length=192, blank=True)
    parent_id = models.IntegerField(null=True, blank=True)
    is_reduce_item = models.CharField(max_length=3, blank=True)
    formular = models.CharField(max_length=384, blank=True)
    cfs_rpt_prop_id = models.IntegerField(null=True, blank=True)
    cfs_rpt_prop_code = models.CharField(max_length=12, blank=True)
    cfs_rpt_prop_name = models.CharField(max_length=96, blank=True)
    cfs_rpt_type_id = models.IntegerField(null=True, blank=True)
    cfs_rpt_type_code = models.CharField(max_length=12, blank=True)
    cfs_rpt_type_name = models.CharField(max_length=96, blank=True)
    column_id = models.IntegerField(null=True, blank=True)
    version = models.CharField(max_length=24, blank=True)
    province_id = models.IntegerField(null=True, blank=True)
    province_name = models.CharField(max_length=96, blank=True)
    class Meta:
        db_table = u'cfs_rpt_style'

class CfsRptType(models.Model):
    id = models.IntegerField(primary_key=True)
    code = models.CharField(max_length=12, blank=True)
    short_name = models.CharField(max_length=48, blank=True)
    full_name = models.CharField(max_length=192, blank=True)
    columns = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'cfs_rpt_type'

class CfsUsrRpt(models.Model):
    id = models.IntegerField(null=True, blank=True)
    usr_id = models.IntegerField(null=True, blank=True)
    usr_name = models.CharField(max_length=96, blank=True)
    fiscal_years = models.CharField(max_length=192, blank=True)
    fiscal_year_status = models.CharField(max_length=192, blank=True)
    versions = models.CharField(max_length=114, blank=True)
    last_modified_time = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'cfs_usr_rpt'
