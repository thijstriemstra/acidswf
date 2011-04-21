# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
Support for creating a service which runs a web server.

@since: 1.0
"""

import logging

from twisted.python import usage
from twisted.application import service

from acidswf.service import createAMFService


optParameters = [
    ['log-level', None, logging.INFO, 'Log level.'],
    ['amf-transport', None, 'http', 'Run the AMF server on HTTP or HTTPS transport.'],
    ['amf-host', None, 'localhost', 'The interface for the AMF gateway to listen on.'],
    ['service', None, 'acidswf', 'The remote service name.'],
    ['amf-port', None, 8000, 'The port number for the AMF gateway to listen on.'],
    ['crossdomain', None, 'crossdomain.xml', 'Path to a crossdomain.xml file.'],
]


class Options(usage.Options):
    """
    Define the options accepted by the I{acidswf amf} plugin.
    """
    synopsis = "[amf options]"

    optParameters = optParameters
    
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
    
    createAMFService(top_service, options)

    return top_service
