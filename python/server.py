#!/usr/bin/env python
#
# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
Echo test server.
"""

import sys

import echo
from util import parse_args, run_server

options = parse_args(sys.argv[1:])
services = {
    options[0].service: echo.echo,
    'Red5Echo': echo
}

try:
    run_server('Echo Test', options[0], services)
except KeyboardInterrupt:
    pass
