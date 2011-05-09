# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
@since: 1.0
"""

import logging

from twisted.web import server, resource, static

from rtmpy.server import ServerFactory

from pyamf.remoting.gateway.twisted import TwistedGateway

from acidswf import data


class WebServer(server.Site):
    """
    Webserver serving an AMF gateway and crossdomain.xml file.
    """

    def __init__(self, services, logLevel=logging.DEBUG,
                 crossdomain='crossdomain.xml'):
        # create logger
        gateway_logger = logging.getLogger("WebServer")
        gateway_logger.setLevel(logging.DEBUG)
        
        # create console handler and set level to debug
        ch = logging.StreamHandler()
        ch.setLevel(logging.DEBUG)
        
        formatter = logging.Formatter("%(asctime)s [%(name)s] %(message)s",
                                      '%Y-%m-%d %H:%M:%S%z')
        ch.setFormatter(formatter)
        gateway_logger.addHandler(ch)
  
        gateway = TwistedGateway(services, expose_request=False,
                                 logger=gateway_logger, debug=True)

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
