from django.conf.urls import patterns, include, url
from django.contrib import admin
# admin.autodiscover()
from django.views.generic.base import TemplateView


urlpatterns = patterns('',
	# url(r'^admin/', include(admin.site.urls)),
	url(r'^$', 'dashboard.views.page1', name='page1'),
	url(r'^page1/$', 'dashboard.views.page1', name='page1'),
	url(r'^page2/$', 'dashboard.views.page2', name='page2'),
	url(r'^page3/$', 'dashboard.views.page3', name='page3'),
	url(r'^page4/$', 'dashboard.views.page4', name='page4'),
	url(r'^page5/$', 'dashboard.views.page5', name='page5'),
)