# Copyright (c) The AcidSWF Project.
# See LICENSE.txt for details.

from setuptools import setup, find_packages

setup(
    name = "AcidSWF",
    version = "1.0",
    packages = find_packages(),
    install_requires = ['Twisted>=10.0'],
    author = "AcidSWF Project",
    author_email = "info@collab.nl",
    description = "Tools to test open source implementations of " \
                  "Flash Player protocols and formats like AMF and RTMP",
    license = "GPLv3",
    keywords = "amf rtmp pyamf rtmpy",
    url = "http://github.com/thijstriemstra/acidswf",
)
