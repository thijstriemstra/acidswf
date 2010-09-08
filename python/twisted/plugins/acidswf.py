"""
twistd plugin for AcidSWF.
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
    
    def __init__(self, crossdomain, service):
        self.service = service
        
        amf_services = {
            'echo': echo.echo,
            'Red5Echo': echo
        }

        gateway = TwistedGateway(amf_services, expose_request=False, logger=logging)

        root = resource.Resource()
        root.putChild('', gateway)
        root.putChild('/', gateway)
        root.putChild('crossdomain.xml', static.File(crossdomain,
                      defaultType='application/xml'))

        server.Site.__init__(self, root)


class RTMPServer(ServerFactory):
    """
    RTMP server.
    """

    def __init__(self, app, service):
        self.service = service
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
        ['amf_port', 'p', 8000, 'The port number for the AMF gateway to listen on.'],
        ['rtmp_port', 'p', 1935, 'The port number for the RTMP server to listen on.'],
        ['amf_host', None, 'localhost', 'The interface for the AMF gateway to listen on.'],
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
        factory = WebServer(options['crossdomain'], acidswf_service)
        web_service = internet.TCPServer(int(options['amf_port']), factory,
                                         interface=options['amf_host'])
        web_service.setServiceParent(top_service)
        
        # rtmp
        app = LiveApplication()
        factory = RTMPServer( {'oflaDemo': app}, acidswf_service)
        rtmp_service = internet.TCPServer(int(options['rtmp_port']), factory,
                                         interface=options['rtmp_host'])
        rtmp_service.setServiceParent(top_service)

        return top_service


# entry point for twistd plugin system
service_maker = AcidSWFServiceMaker()
