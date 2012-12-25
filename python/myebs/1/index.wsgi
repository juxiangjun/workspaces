import sys, os, sae
app_root = os.path.dirname(__file__)
sys.path.insert(1, os.path.join(app_root, 'virtualenv.bundle'))
from myebs import wsgi
application = sae.create_wsgi_app(wsgi.application)
