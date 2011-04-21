# -*- encoding: utf-8 -*-
#
# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

"""
@since: 1.0
"""

import sys

from twisted.scripts.twistd import run, ServerOptions


class ServiceOptions(ServerOptions):
    synopsis = "Usage: acidswf [options]"

    def opt_version(self):
        """Print version information and exit.
        """
        print 'acidswf'
        sys.exit()


