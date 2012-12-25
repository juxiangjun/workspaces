from django.shortcuts import render_to_response
from django.template import RequestContext
from users.service.user_service import UserService
def index(request):
	userService = UserService()
	users = userService.get_users()	
	return render_to_response("main/index.html",{'users':users}, RequestContext(request))
