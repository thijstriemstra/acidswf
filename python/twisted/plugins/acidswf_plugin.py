# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
AcidSWF services.

@since: 1.0
"""

from twisted.application.service import ServiceMaker


AcidSWFAMF = ServiceMaker(
    "AcidSWF AMF",
    "acidswf.application.amf",
    ("Plugin to test AMF implementations."),
    "amf")


AcidSWFRTMP = ServiceMaker(
    "AcidSWF RTMP",
    "acidswf.application.rtmp",
    ("Plugin to test RTMP implementations."),
    "rtmp")