# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
Support for creating services for running AMF/RTMP servers.
"""

from twisted.python import log
from twisted.application import service

from rtmpy import __version__
from pyamf import version


class RTMPService(service.Service):
    """
    RTMP service.
    """

    def startService(self):
        service.Service.startService(self)

        log.msg('')
        log.msg('AcidSWF RTMP Server')
        log.msg(80 * '=')
        log.msg('')
        log.msg('       Server:       %s://%s:%s' % (self.options['protocol'],
                                                  self.options['host'],
                                                  self.options['port']))
        log.msg('       Application:  %s' % self.options['app'])
        log.msg('       RTMPy:        %s' % '.'.join([str(x) for x in __version__]))
        log.msg('')
        log.msg('Server completed startup.')


class AMFService(service.Service):
    """
    AMF service.
    """

    def startService(self):
        service.Service.startService(self)

        try:
            from OpenSSL.version import __version__ as pyopenssl
        except ImportError:
            pyopenssl = "Not Installed!"

        log.msg('')
        log.msg('AcidSWF AMF Server')
        log.msg(80 * '=')
        log.msg('')
        log.msg('       Gateway:      %s://%s:%s' % (self.options['transport'],
                                                     self.options['host'],
                                                     self.options['port']))
        log.msg('       Service:      %s' % self.options['service'])
        log.msg('       PyAMF:        %s' % str(version))
        if self.options['transport'] == "https":
            log.msg('       PyOpenSSL:    %s' % pyopenssl)
        log.msg('')
        log.msg('Service completed startup.')
