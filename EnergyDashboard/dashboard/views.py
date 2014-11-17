from django.shortcuts import render, redirect, get_object_or_404
from django.core.urlresolvers import reverse

# page1
def page1(request):
	context = {}
	return render(request, 'dashboard/page1.html', context)

# page2
def page2(request):
	context = {}
	return render(request, 'dashboard/page2.html', context)


