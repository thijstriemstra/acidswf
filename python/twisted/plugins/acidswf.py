# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
AcidSWF plugin for twistd.
"""

import logging

from zope.interface import implements

from twisted.python import usage, log
from twisted.plugin import IPlugin
from twisted.web import server, resource, static
from twisted.application import internet, service

from rtmpy.server import ServerFactory, Application
from pyamf.remoting.gateway.twisted import TwistedGateway

import echo


class LiveApplication(Application):
    """
    Live app.
    """

    def clientDisconnected(self, client, reason):
        print 'client "%s" disconnected: %s' % (client, reason)
        

class WebServer(server.Site):
    """
    Webserver with a AMF gateway and crossdomain.xml.
    """
    
    def __init__(self, crossdomain, services, logLevel=logging.DEBUG):
        observer = log.PythonLoggingObserver()

        logging.basicConfig(
            level=logLevel, datefmt='%Y-%m-%d %H:%M:%S%z',
            format='%(asctime)s [%(name)s] %(message)s'
        )

        gateway = TwistedGateway(services, expose_request=False, logger=logging)

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
        log.msg('AcidSWF service completed startup.')


class Options(usage.Options):
    """
    command-line options.
    """

    optParameters = [
        ['amf_host', None, 'localhost', 'The interface for the AMF gateway to listen on.'],
        ['amf_port', None, 8000, 'The port number for the AMF gateway to listen on.'],
        ['rtmp_port', None, 1935, 'The port number for the RTMP server to listen on.'],
        ['rtmp_host', None, 'localhost', 'The interface for the RTMP server to listen on.'],
        ['crossdomain', None, 'crossdomain.xml', 'Path to the crossdomain.xml file.'],
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
            'echo': echo.echo,
            'Red5Echo': echo
        }
        factory = WebServer(options['crossdomain'], services)
        web_service = internet.TCPServer(int(options['amf_port']), factory,
                                         interface=options['amf_host'])
        web_service.setServiceParent(top_service)
        
        # rtmp
        app = LiveApplication()
        factory = RTMPServer( {'oflaDemo': app})
        rtmp_service = internet.TCPServer(int(options['rtmp_port']), factory,
                                         interface=options['rtmp_host'])
        rtmp_service.setServiceParent(top_service)

        return top_service


# entry point for twistd plugin system
service_maker = AcidSWFServiceMaker()
