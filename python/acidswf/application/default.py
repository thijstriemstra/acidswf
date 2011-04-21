# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
Support for creating a service which supports both RTMP and AMF servers.

@since: 1.0
"""

from twisted.python import usage
from twisted.application import service

from acidswf.service import createRTMPService, createAMFService
from acidswf.application.amf import optParameters as amf_params
from acidswf.application.rtmp import optParameters as rtmp_params


class Options(usage.Options):
    """
    Define the options accepted by the I{acidswf all} plugin.
    """
    synopsis = "[all options]"

    optParameters = amf_params + rtmp_params
    
    longdesc = """\
This starts an AMF/RTMP server."""


def makeService(options):
    top_service = service.MultiService()
    
    createRTMPService(top_service, options)
    createAMFService(top_service, options)

    return top_service
