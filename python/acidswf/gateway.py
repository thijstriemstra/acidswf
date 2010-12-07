# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
Echo example gateway for Django.

@since: 0.1.0
"""

from pyamf.remoting.gateway.django import DjangoGateway

import acidswf

amfGateway = DjangoGateway({
    'echo': acidswf.echo,
    'Red5Echo': acidswf,
}, expose_request=False)
