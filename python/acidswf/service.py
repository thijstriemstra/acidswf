# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
Support for creating services for running AMF/RTMP servers.

@since: 1.0
"""

from twisted.python import log
from twisted.application import internet, service

from rtmpy import __version__
from pyamf import version

from acidswf.application import echo, RTMPApplication
from acidswf.server import WebServer, RTMPServer


class RTMPService(service.Service):
    """
    RTMP service.
    """

    def startService(self):
        service.Service.startService(self)
        self.printInfo()


    def printInfo(self):
        log.msg('')
        log.msg('AcidSWF RTMP Service')
        log.msg(80 * '=')
        log.msg('')
        log.msg('       Server:       %s://%s:%s' % (self.options['rtmp-protocol'],
                                                  self.options['rtmp-host'],
                                                  self.options['rtmp-port']))
        log.msg('       Application:  %s' % self.options['rtmp-app'])
        log.msg('       RTMPy:        %s' % '.'.join([str(x) for x in __version__]))
        log.msg('')
        log.msg('RTMP service completed startup.')


class AMFService(service.Service):
    """
    AMF service.
    """

    def startService(self):
        service.Service.startService(self)
        self.printInfo()


    def printInfo(self):
        try:
            from OpenSSL.version import __version__ as pyopenssl
        except ImportError:
            pyopenssl = "Not Installed!"

        log.msg('')
        log.msg('AcidSWF AMF Service')
        log.msg(80 * '=')
        log.msg('')
        log.msg('       Gateway:      %s://%s:%s' % (self.options['amf-transport'],
                                                     self.options['amf-host'],
                                                     self.options['amf-port']))
        log.msg('       Service:      %s' % self.options['service'])
        log.msg('       PyAMF:        %s' % str(version))
        if self.options['amf-transport'] == "https":
            log.msg('       PyOpenSSL:    %s' % pyopenssl)
        log.msg('')
        log.msg('AMF service completed startup.')


def createAMFService(parent, options):
    amf_service = AMFService()
    amf_service.options = options
    amf_service.setServiceParent(parent)

    amf_port = int(options['amf-port'])
    amf_services = {
        options['service']: echo,
        options['service'] + "RO": echo
    }

    amf_server = WebServer(amf_services, options['log-level'],
                           options['crossdomain'])

    if options.get('amf-transport') == "https":
        web_service = internet.SSLServer(amf_port, amf_server,
                                         SSLServerContextFactory(),
                                         interface=options['amf-host'])
    else:
        web_service = internet.TCPServer(amf_port, amf_server,
                                         interface=options['amf-host'])

    web_service.setServiceParent(parent)
    

def createRTMPService(parent, options):
    rtmp_service = RTMPService()
    rtmp_service.options = options
    rtmp_service.setServiceParent(parent)

    app = RTMPApplication()
    rtmp_apps = {
        options['rtmp-app']: app
    }

    rtmp_server = RTMPServer( rtmp_apps )
    rtmp_service = internet.TCPServer(int(options['rtmp-port']), rtmp_server,
                                     interface=options['rtmp-host'])
    rtmp_service.setServiceParent(parent)
