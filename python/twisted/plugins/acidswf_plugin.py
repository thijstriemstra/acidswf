# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
AcidSWF services.

@since: 1.0
"""

from twisted.application.service import ServiceMaker


AcidSWFDefault = ServiceMaker(
    "AcidSWF",
    "acidswf.application.default",
    ("Tests AMF/RTMP implementations."),
    "all")


AcidSWFAMF = ServiceMaker(
    "AcidSWF AMF",
    "acidswf.application.amf",
    ("Tests AMF implementations."),
    "amf")


AcidSWFRTMP = ServiceMaker(
    "AcidSWF RTMP",
    "acidswf.application.rtmp",
    ("Tests RTMP implementations."),
    "rtmp")