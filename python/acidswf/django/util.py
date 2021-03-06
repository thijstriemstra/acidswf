# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
Echo client and server examples.

Support for:

 - U{Twisted<http://twistedmatrix.com>}
 - U{WSGI<http://wsgi.org>}
 - U{Django<http://www.djangoproject.com>}
 - U{WASD<http://wasd.vsm.com.au/WASD/>}
 
@since: 1.0.0
"""

import os, os.path

import logging


logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s %(levelname)-5.5s [%(name)s] %(message)s'
)


def run_wsgi_server(name, options, services):
    """
    Runs the AMF services using the
    L{WSGIGateway<pyamf.remoting.gateway.wsgi.WSGIGateway>}.

    @param options: Commandline options.
    @type options: C{dict}
    @param services: List of services for the Flash gateway.
    @type services: C{dict}
    @return: The function that will run the server.
    @rtype: C{callable}
    """
    from pyamf.remoting.gateway.wsgi import WSGIGateway
    from wsgiref import simple_server

    host = options.host
    port = int(options.port)

    gw = WSGIGateway(services, logger=logging)

    httpd = simple_server.WSGIServer(
        (host, port),
        simple_server.WSGIRequestHandler,
    )

    def app(environ, start_response):
        if environ['PATH_INFO'] == '/crossdomain.xml':
            fn = os.path.join(os.getcwd(), os.path.dirname(__file__),
                'crossdomain.xml')

            fp = open(fn, 'rt')
            buffer = fp.readlines()
            fp.close()

            start_response('200 OK', [
                ('Content-Type', 'application/xml'),
                ('Content-Length', str(len(''.join(buffer))))
            ])

            return buffer

        return gw(environ, start_response)

    httpd.set_app(app)

    print "Started %s - WSGI Server on http://%s:%d" % (name, host, port)

    return httpd.serve_forever


def run_django_server(name, options, services):
    """
    Runs the AMF services using the
    L{DjangoGateway<pyamf.remoting.gateway.django.DjangoGateway>}.

    Essentially, we use the C{django.core.handlers.wsgi} to
    run the base server and pass the requests to the Django handler.

    @param options: Commandline options.
    @type options: C{dict}
    @param services: List of services for the Flash gateway.
    @type services: C{dict}
    @return: The function that will run the server.
    @rtype: C{callable}
    """
    import os
    if 'DJANGO_SETTINGS_MODULE' not in os.environ:
        os.environ['DJANGO_SETTINGS_MODULE'] = 'acidswf.settings'

    import subprocess

    host = options.host
    port = int(options.port)
    address = '%s:%d' % (host, port)
    path = os.path.join('acidswf', 'manage.py')

    print "Started %s - Django Server on http://%s:%d" % (name, host, port)

    return subprocess.call('python %s runserver %s' % (path, address), shell=True)


def run_twisted_server(name, options, services):
    """
    Runs the AMF services using the
    L{TwistedGateway<pyamf.remoting.gateway.twisted.TwistedGateway>}.

    @param options: Commandline options
    @type options: C{dict}
    @param services: List of services for the Flash gateway.
    @type services: C{dict}
    @return: The function that will run the server.
    @rtype: C{callable}
    """
    from twisted.internet import reactor
    from twisted.web import server, static, resource

    from pyamf.remoting.gateway.twisted import TwistedGateway

    host = options.host
    port = int(options.port)
    path = options.path
    
    gw = TwistedGateway(services, expose_request=False, logger=logging)
    root = resource.Resource()

    root.putChild('', gw)
    root.putChild('/'+path, gw)
    root.putChild('crossdomain.xml', static.File(os.path.join(
        os.getcwd(), os.path.dirname(__file__), 'crossdomain.xml'),
        defaultType='application/xml'))

    print "Started %s - Twisted Server on http://%s:%d/%s" % (name, host, port, path)

    reactor.listenTCP(port, server.Site(root), 50, host)   
    return reactor.run


def run_wasd_server(name, options, services):
    """
    Runs the AMF services using the
    L{WSGIGateway<pyamf.remoting.wsgigateway.WSGIGateway>}.

    @param options: Commandline options.
    @type options: C{dict}
    @param services: List of services for the Flash gateway.
    @type services: C{dict}
    @return: The function that will run the server.
    @rtype: C{callable}
    """
    from pyamf.remoting.gateway.wsgi import WSGIGateway
    import wasd

    gw = WSGIGateway(services, logger=logging)

    def app(environ, start_response):
        if environ['PATH_INFO'] == '/crossdomain.xml':
            fn = os.path.join(os.getcwd(), os.path.dirname(__file__),
                'crossdomain.xml')

            fp = open(fn, 'rt')
            buffer = fp.readlines()
            fp.close()

            start_response('200 OK', [
                ('Content-Type', 'application/xml'),
                ('Content-Length', str(len(''.join(buffer))))
            ])

            return buffer

        return gw(environ, start_response)

    def serve_forever():
        while wasd.cgiplus_begin():
            wasd.wsgi_run(app)

    return serve_forever


def run_server(name, options, services):
    """
    Starts the echo AMF server.

    @param options: Commandline options.
    @type options: C{dict}
    @param services: List of services for the Flash gateway.
    @type services: C{dict}
    """
    if options.amf_type == 'wsgi':
        func = run_wsgi_server(name, options, services)
    elif options.amf_type == 'twisted':
        func = run_twisted_server(name, options, services)
    elif options.amf_type == 'django':
        func = run_django_server(name, options, services)
    elif options.amf_type == 'wasd':
        func = run_wasd_server(name, options, services)

    import pyamf

    print 'using PyAMF from %s' % (pyamf.__file__,)
    try:
        func()
    except KeyboardInterrupt:
        pass


def new_amf_client(name, options, service):
    """
    Runs AMF services for a C{RemotingService} echo client.

    @param options: Commandline options
    @type options: C{dict}
    @param service: Target service path on the AMF gateway.
    @type service: C{str}
    @return: The function that will run the client.
    @rtype: C{callable}
    """
    from pyamf.remoting.client import RemotingService

    host = options.host
    port = int(options.port)
    path = options.path
    url = "http://%s:%d/%s" % (host, port, path)

    print "Started %s - AMF Client for %s" % (name, url)

    gateway = RemotingService(url, logger=logging)
    echo_service = gateway.getService(service)

    return echo_service


def new_client(name, options, service):
    """
    Starts the echo AMF client.

    @param name: Name of the example.
    @type name: C{str}
    @param options: Commandline options.
    @type options: C{dict}
    @param service: Target servicepath on the AMF gateway.
    @type service: C{str}
    """
    return new_amf_client(name, options, service)


def parse_args(args):
    """
    Parse commandline options.
    """
    from optparse import OptionParser

    parser = OptionParser()
    parser.add_option('-t', '--type', dest='type',
        choices=['amf', 'rtmp'], default='amf',
        help='Determines which type of gateway to use: amf or rtmp [default: %default]')
    parser.add_option('-a', '--amf-type', dest='amf_type',
        choices=['wsgi', 'twisted', 'django', 'wasd'], default='wsgi',
        help='Determines which AMF gateway type to use [default: %default]')
    parser.add_option('--host', dest='host', default='localhost',
                      help='The host address for the gateway [default: %default]')
    parser.add_option('-p', '--port', dest='port', default=8000,
                      help='The port number the server is listening on [default: %default]')
    parser.add_option('-l', '--path', dest='path', default='',
                      help='The gateway path [default: %default]')
    parser.add_option('-s', '--service', dest='service', default='echo',
                      help='The remote service name [default: %default]')
    return parser.parse_args(args)
