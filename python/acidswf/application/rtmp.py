# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
Support for creating a service which runs a RTMP server.
"""

import logging

from twisted.python import usage
from twisted.application import internet, service

from acidswf.server import RTMPServer
from acidswf.service import RTMPService
from acidswf.application import RTMPApplication


class Options(usage.Options):
    """
    Define the options accepted by the I{acidswf rtmp} plugin.
    """
    synopsis = "[rtmp options]"

    optParameters = [
        ['log-level', None, logging.INFO, 'Log level.'],
        ['port', None, 1935, 'The port number for the RTMP server to listen on.'],
        ['protocol', None, 'rtmp', 'Version of the RTMP protocol that the server should use.'],
        ['host', None, 'localhost', 'The interface for the RTMP server to listen on.'],
        ['app', None, 'acidswf', 'The RTMP application name.'],
    ]
    
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
    rtmp_service = RTMPService()
    rtmp_service.options = options
    rtmp_service.setServiceParent(top_service)

    app = RTMPApplication()
    rtmp_apps = {
        options['app']: app
    }

    rtmp_server = RTMPServer( rtmp_apps )
    rtmp_service = internet.TCPServer(int(options['port']), rtmp_server,
                                     interface=options['host'])
    rtmp_service.setServiceParent(top_service)

    return top_service
