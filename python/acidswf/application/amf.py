# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
Support for creating a service which runs a web server.

@since: 1.0
"""

import logging

from twisted.python import usage
from twisted.application import internet, service

from acidswf.server import WebServer
from acidswf.service import AMFService
from acidswf.application import echo


class Options(usage.Options):
    """
    Define the options accepted by the I{acidswf amf} plugin.
    """
    synopsis = "[amf options]"

    optParameters = [
        ['log-level', None, logging.INFO, 'Log level.'],
        ['transport', None, 'http', 'Run the AMF server on HTTP or HTTPS transport.'],
        ['host', None, 'localhost', 'The interface for the AMF gateway to listen on.'],
        ['service', None, 'acidswf', 'The remote service name.'],
        ['port', None, 8000, 'The port number for the AMF gateway to listen on.'],
        ['crossdomain', None, 'crossdomain.xml', 'Path to a crossdomain.xml file.'],
    ]
    
    longdesc = """\
This starts an AMF server."""


    def postOptions(self):
        """
        Set up conditional defaults and check for dependencies.

        If SSL is not available but an HTTPS server was configured, raise a
        L{UsageError} indicating that this is not possible.

        If no server port was supplied, select a default appropriate for the
        other options supplied.
        """
        pass
        #if self['https']:
        #    try:
        #        from twisted.internet.ssl import DefaultOpenSSLContextFactory
        #    except ImportError:
        #        raise usage.UsageError("SSL support not installed")



def makeService(options):
    top_service = service.MultiService()
    amf_service = AMFService()
    amf_service.options = options
    amf_service.setServiceParent(top_service)

    amf_port = int(options['port'])
    amf_services = {
        options['service']: echo,
        options['service'] + "RO": echo
    }

    amf_server = WebServer(amf_services, options['log-level'],
                           options['crossdomain'])

    if options.get('transport') == "https":
        web_service = internet.SSLServer(amf_port, amf_server,
                                         SSLServerContextFactory(),
                                         interface=options['host'])
    else:
        web_service = internet.TCPServer(amf_port, amf_server,
                                         interface=options['host'])

    web_service.setServiceParent(top_service)

    return top_service
