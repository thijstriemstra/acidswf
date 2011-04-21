# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
@since: 1.0
"""

import logging

from twisted.python import log
from twisted.web import server, resource, static

from rtmpy.server import ServerFactory

from pyamf import register_class
from pyamf.remoting.gateway.twisted import TwistedGateway

from acidswf import data


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

        self._registerClass(data.RemoteClass)
        self._registerClass(data.ExternalizableClass)

        gateway = TwistedGateway(services, expose_request=False,
                                 logger=logging)

        root = resource.Resource()
        root.putChild('', gateway)
        root.putChild('crossdomain.xml', static.File(crossdomain,
                      defaultType='application/xml'))

        server.Site.__init__(self, root)


    def _registerClass(self, klass): 
        """
        Map ActionScript class to Python class.
        """
        register_class(klass, '%s.%s' % (data.NAMESPACE,
                                         klass.__class__.__name__))


class RTMPServer(ServerFactory):
    """
    RTMP server.
    """

    def __init__(self, app):
        ServerFactory.__init__(self, app)


class SSLServerContextFactory:

    def getContext(self):
        """
        Create an SSL context.
        """
        from OpenSSL import SSL

        ctx = SSL.Context(SSL.SSLv23_METHOD)
        ctx.use_certificate_file('ssl/ca.pem')
        ctx.use_privatekey_file('ssl/privkey.pem')

        return ctx
