# -*- encoding: utf-8 -*-
#
# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
@since: 1.0
"""

from rtmpy.server import Application, Client


def echo(data):
    """
    Return data back to the client.

    @type data: C{mixed}
    @param data: Decoded AS->Python data.
    """
    return data


class RTMPClient(Client):
    """
    RTMP client that exposes remote methods.
    """

    def echo(self, data):
        """
        Return data back to the client.

        @type data: C{mixed}
        @param data: Decoded AS->Python data.
        """
        return data


class RTMPApplication(Application):
    """
    RTMP server application.
    """

    client = RTMPClient


    def onConnect(self, client):
        print "\nAccepted connection for '%s' from client: %s" % (self.name, client.id)
        print "Flash Player: %s" % client.agent
        print "URI: %s\n" % client.uri

        return True


    def onDisconnect(self, client):
        print "Client '%s' has been disconnected from the application" % client.id