# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
Echo test mod_wsgi example.

You can use this example with the echo_test.swf clients.

@since: 0.1
"""

import sys, os.path

sys.path.append(os.path.dirname(__file__))

import echo
import pyamf

from pyamf.remoting.gateway.wsgi import WSGIGateway

services = {
    'echo': echo.echo,
    'Red5Echo': echo
}

gw = WSGIGateway(services)

def application(environ, start_response):
    if environ['PATH_INFO'] == '/crossdomain.xml':
        fn = os.path.join(os.getcwd(), os.path.dirname(__file__), 'crossdomain.xml')

        fp = open(fn, 'rt')
        buffer = fp.readlines()
        fp.close()

        start_response('200 OK', [
            ('Content-Type', 'application/xml'),
            ('Content-Length', str(len(''.join(buffer))))
        ])

        return buffer

    return gw(environ, start_response)

