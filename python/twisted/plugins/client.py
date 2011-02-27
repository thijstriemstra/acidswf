# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

import sys

from acidswf.util import parse_args, new_client

options = parse_args(sys.argv[1:])
service = options[0].service

client = new_client('AcidSWF', options[0], service)

print client('Hello World')
