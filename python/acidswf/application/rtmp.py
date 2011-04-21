# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
Support for creating a service which runs a RTMP server.
"""

from twisted.python import usage
from twisted.application import service

from acidswf.service import createRTMPService


optParameters = [
    ['rtmp-port', None, 1935, 'The port number for the RTMP server to listen on.'],
    ['rtmp-protocol', None, 'rtmp', 'Version of the RTMP protocol that the server should use.'],
    ['rtmp-host', None, 'localhost', 'The interface for the RTMP server to listen on.'],
    ['rtmp-app', None, 'acidswf', 'The RTMP application name.'],
]


class Options(usage.Options):
    """
    Define the options accepted by the I{acidswf rtmp} plugin.
    """
    synopsis = "[rtmp options]"

    optParameters = optParameters

    longdesc = """\
This starts an RTMP server."""


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
    
    createRTMPService(top_service, options)

    return top_service
