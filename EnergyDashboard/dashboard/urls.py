from django.conf.urls import patterns, include, url
from django.contrib import admin
# admin.autodiscover()
from django.views.generic.base import TemplateView


urlpatterns = patterns('',
	# url(r'^admin/', include(admin.site.urls)),
	url(r'^$', 'dashboard.views.page1', name='page1'),
	url(r'^page2/$', 'dashboard.views.page2', name='page2'),
)