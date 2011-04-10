#!/usr/bin/env python
#
# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

import sys

import acidswf
from acidswf.util import parse_args, run_server

options = parse_args(sys.argv[1:])
services = {
    options[0].service: acidswf.echo,
    'Red5Echo': echo
}

try:
    run_server('AcidSWF', options[0], services)
except KeyboardInterrupt:
    pass
