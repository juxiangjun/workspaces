from django.db import models

# Create your models here.
class User(models.Model):
    id = models.CharField(max_length=108, primary_key=True)
    user_name = models.CharField(max_length=192, blank=True)
    password = models.CharField(max_length=192, blank=True)
    class Meta:
        db_table = u'user'
