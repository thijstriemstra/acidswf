# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
@since: 1.0.0
"""

from django.conf.urls.defaults import *
import os

urlpatterns = patterns('',

    # AMF Remoting Gateway
    # The gateway parameter may also be a direct reference
    # to a pyamf.remoting.gateway.django.DjangoGateway instance
    (r'^$', 'acidswf.gateway.amfGateway'),
    
    # Serve crossdomain.xml from the directory below __file__
    (r'^crossdomain.xml$', 'django.views.static.serve',
        {'document_root': os.path.abspath(os.path.join(os.path.dirname(__file__), '..')), 'path': 'crossdomain.xml'})
)
