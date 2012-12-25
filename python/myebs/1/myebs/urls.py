from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
	url(r'^$','myebs.main.index'),
    url(r'^cfs/', include('cfs.urls')),
    url(r'^stock/', include('stock.urls')),
    url(r'^admin/', include('admin.urls')),
    # url(r'^$', 'myebs.views.home', name='home'),
    # url(r'^myebs/', include('myebs.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
