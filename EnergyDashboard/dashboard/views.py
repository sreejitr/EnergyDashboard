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

# page3
def page3(request):
	context = {}
	return render(request, 'dashboard/page3.html', context)

# page4
def page4(request):
	context = {}
	return render(request, 'dashboard/page4.html', context)

# page5
def page5(request):
	context = {}
	return render(request, 'dashboard/page5.html', context)

# page6
def page6(request):
	context = {}
	return render(request, 'dashboard/page6.html', context)


