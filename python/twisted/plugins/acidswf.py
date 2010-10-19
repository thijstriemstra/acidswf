# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
AcidSWF plugin for twistd.

:see: http://twistedmatrix.com
"""


import logging

from zope.interface import implements

from twisted.python import usage, log
from twisted.plugin import IPlugin
from twisted.web import server, resource, static
from twisted.application import internet, service

from rtmpy import __version__
from rtmpy.server import ServerFactory, Application

from pyamf import version
from pyamf.remoting.gateway.twisted import TwistedGateway

import echo


class LiveApplication(Application):
    """
    Live app.
    """

    def echo(self, data):
        return data
        

class WebServer(server.Site):
    """
    Webserver with a AMF gateway and crossdomain.xml.
    """
    
    def __init__(self, services, logLevel=logging.ERROR,
                 crossdomain='crossdomain.xml'):
        observer = log.PythonLoggingObserver()

        logging.basicConfig(
            level=logLevel, datefmt='%Y-%m-%d %H:%M:%S%z',
            format='%(asctime)s [%(name)s] %(message)s'
        )

        gateway = TwistedGateway(services, expose_request=False,
                                 logger=logging)

        root = resource.Resource()
        root.putChild('', gateway)
        root.putChild('crossdomain.xml', static.File(crossdomain,
                      defaultType='application/xml'))

        server.Site.__init__(self, root)


class RTMPServer(ServerFactory):
    """
    RTMP server.
    """

    def __init__(self, app):
        ServerFactory.__init__(self, app)


class AcidSWFService(service.Service):
    """
    AcidSWF service.
    """

    def startService(self):
        service.Service.startService(self)
        log.msg('PyAMF %s' % str(version))
        log.msg('RTMPy %s' % str(__version__))
        log.msg('AcidSWF service completed startup.')


class Options(usage.Options):
    """
    command-line options.
    """

    optParameters = [
        ['log-level', None, logging.ERROR, 'Log level.'],
        ['amf-host', None, 'localhost', 'The interface for the AMF gateway to listen on.'],
        ['amf-service', None, 'acidswf', 'The service name.'],
        ['amf-port', None, 8000, 'The port number for the AMF gateway to listen on.'],
        ['rtmp-port', None, 1935, 'The port number for the RTMP server to listen on.'],
        ['rtmp-host', None, 'localhost', 'The interface for the RTMP server to listen on.'],
        ['rtmp-app', None, 'acidswf', 'The RTMP application name.'],
        ['crossdomain', None, 'crossdomain.xml', 'Path to a crossdomain.xml file.'],
    ]


class AcidSWFServiceMaker(object):
    """
    Object which knows how to construct a service.
    """

    implements(service.IServiceMaker, IPlugin)

    tapname = "acidswf"
    description = "Plugin to test AMF/RTMP implementations."
    options = Options

    def makeService(self, options):
        top_service = service.MultiService()
        acidswf_service = AcidSWFService()
        acidswf_service.setServiceParent(top_service)

        # web
        services = {
            options['amf-service']: echo.echo,
            options['amf-service'] + "RO": echo
        }
        factory = WebServer(services, options['log-level'], options['crossdomain'])
        web_service = internet.TCPServer(int(options['amf-port']), factory,
                                         interface=options['amf-host'])
        web_service.setServiceParent(top_service)
        
        # rtmp
        app = LiveApplication()
        factory = RTMPServer( {'oflaDemo': app, 'echo': app})
        rtmp_service = internet.TCPServer(int(options['rtmp-port']), factory,
                                         interface=options['rtmp-host'])
        rtmp_service.setServiceParent(top_service)

        return top_service


# entry point for twistd plugin system
service_maker = AcidSWFServiceMaker()
