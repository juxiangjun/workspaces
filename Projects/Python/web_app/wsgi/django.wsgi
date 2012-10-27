import os, sys
sys.path.append('/Users/tju/Workspaces/Projects/Python/web_app')
os.environ['DJANGO_SETTINGS_MODULE'] = 'web_app.settings'

import django.core.handlers.wsgi

application = django.core.handlers.wsgi.WSGIHandler()
