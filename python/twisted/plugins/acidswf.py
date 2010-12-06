# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
AcidSWF plugin for twistd.

:see: http://twistedmatrix.com
"""


import logging

from OpenSSL import SSL

from zope.interface import implements

from twisted.python import usage, log
from twisted.plugin import IPlugin
from twisted.web import server, resource, static
from twisted.application import internet, service

from rtmpy import __version__
from rtmpy.server import ServerFactory, Application

from pyamf import version, AMF3
from pyamf.remoting.gateway.twisted import TwistedGateway

import echo


class LiveApplication(Application):
    """
    Live app.
    """

    def acceptConnection(self, client):
        print "Accepted connection for '%s' from client: %s" % (self.name, client.id)

    def onDisconnect(self, client):
        print "Client '%s' has been disconnected from the application" % client.id


    def echo(self, data):
        #print 'echo: %s' % data
        return data
 

class WebServer(server.Site):
    """
    Webserver serving an AMF gateway and crossdomain.xml file.
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


class ServerContextFactory:

    def getContext(self):
        """
        Create an SSL context.
        """
        ctx = SSL.Context(SSL.SSLv23_METHOD)
        ctx.use_certificate_file('ssl/ca.pem')
        ctx.use_privatekey_file('ssl/privkey.pem')

        return ctx


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

        log.msg('')
        log.msg('AcidSWF 1.0')
        log.msg(80 * '=')
        log.msg('')
        log.msg('AMF')
        log.msg(80 * '-')
        log.msg('')
        log.msg('       Gateway:      %s://%s:%s' % (self.options['amf-transport'],
                                                     self.options['amf-host'],
                                                     self.options['amf-port']))
        log.msg('       Service:      %s' % self.options['amf-service'])
        log.msg('       PyAMF:        %s' % str(version))
        log.msg('')
        log.msg('RTMP')
        log.msg(80 * '-')
        log.msg('')
        log.msg('       Server:       %s://%s:%s' % (self.options['rtmp-protocol'],
                                                  self.options['rtmp-host'],
                                                  self.options['rtmp-port']))
        log.msg('       Application:  %s' % self.options['rtmp-app'])
        log.msg('       RTMPy:        %s' % '.'.join([str(x) for x in __version__]))
        log.msg('')
        log.msg('Service completed startup.')


class Options(usage.Options):
    """
    command-line options.
    """

    optParameters = [
        ['log-level', None, logging.INFO, 'Log level.'],
        ['amf-transport', None, 'http', 'Run the AMF server on HTTP or HTTPS transport.'],
        ['amf-host', None, 'localhost', 'The interface for the AMF gateway to listen on.'],
        ['amf-service', None, 'acidswf', 'The remote service name.'],
        ['amf-port', None, 8000, 'The port number for the AMF gateway to listen on.'],
        ['rtmp-port', None, 1935, 'The port number for the RTMP server to listen on.'],
        ['rtmp-protocol', None, 'rtmp', 'Version of the RTMP protocol that the server should use.'],
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
        acidswf_service.options = options
        acidswf_service.setServiceParent(top_service)

        # amf
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
        factory = RTMPServer( {options['rtmp-app']: app})
        rtmp_service = internet.TCPServer(int(options['rtmp-port']), factory,
                                         interface=options['rtmp-host'])
        rtmp_service.setServiceParent(top_service)

        return top_service


# entry point for twistd plugin system
service_maker = AcidSWFServiceMaker()
