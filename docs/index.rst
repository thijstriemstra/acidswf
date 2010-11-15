Overview
========

AcidSWF provides a test suite for AMF_ and RTMP_ server and client implementations,
protocols used primarily by the Adobe `Flash Player`_.

It was developed using Python_ to test the PyAMF_ and RTMPy_ libraries, but 
the goal is to make it work for any AMF/RTMP implementation (Red5_, BlazeDS_, FMS_
etc) that is compliant with the Flash Player.

The package consists of an Ant_ build script that controls:

- AMF/RTMP server
- FlexUnit test suite
- Flash Player

The build script performs the following tasks:

- FlexUnit opens the test SWF with the Flash Player
- Flash Player test suite sends a payload to the AMF/RTMP server
- Server parses the payload and returns it back to the Flash Player
- Unit test verifies if the result is equal to the payload
- Flash Player notifies FlexUnit about the test results

When all tests completed, or any errors occur, the build script will:

- Shut down the server
- Close the Flash Player
- Generate an HTML report with the test results


Download
--------

AcidSWF uses Git_ for source control. Grab the source (or `browse online`_)::

    git clone http://github.com/thijstriemstra/acidswf


Dependencies
------------

To use AcidSWF you'll need the following software pre-installed on your system:

===========================  ========
Name                         Version
===========================  ========
Ant_                         1.7
`Flex SDK`_                  4.1
FlexUnit_                    4.1
`Flash Player`_ (Debugger)   9.0
`Hamcrest AS3`_              1.0.2
Java_                        1.5
===========================  ========

The default configuration for Python also requires:

===========================  ========
Name                         Version
===========================  ========
Python_                      2.5
Twisted_                     8.0
PyAMF_                       0.6
RTMPy_                       0.1
===========================  ========

To build the documentation you need the following Python libraries:

===========================  ========
Name                         Version
===========================  ========
Sphinx_                      1.0
Beam_ theme                  N/A
===========================  ========


Setup
-----

#. Grab the source::

    git clone http://github.com/thijstriemstra/acidswf

#. Set the `FLEX_HOME` environment variable and point it to the root of your Flex SDK. For Unix::

    export FLEX_HOME="/Applications/Adobe Flex Builder 3 Plug-in/sdks/4.1.0"


Running AcidSWF
---------------

- Run Ant from the root of your AcidSWF source directory::

    ant



.. _AMF:	http://en.wikipedia.org/wiki/AMF
.. _RTMP:       http://en.wikipedia.org/wiki/RTMP
.. _Flash Player:   http://www.adobe.com/products/flashplayer
.. _PyAMF:    http://pyamf.org
.. _RTMPy:    http://rtmpy.org
.. _Red5:     http://red5.org
.. _Ant:      http://ant.apache.org
.. _Sphinx:   http://sphinx.pocoo.org
.. _Beam:     http://github.com/collab-project/sphinx-themes/tree/master/source/themes/beam
.. _Flex SDK:    http://opensource.adobe.com/wiki/display/flexsdk/Flex+SDK
.. _Hamcrest AS3: http://github.com/drewbourne/hamcrest-as3
.. _Twisted:  http://twistedmatrix.com
.. _Java:     http://www.java.com
.. _BlazeDS:  http://opensource.adobe.com/wiki/display/blazeds/BlazeDS
.. _FMS:      http://www.adobe.com/products/flashmediaserver
.. _FlexUnit:    http://opensource.adobe.com/wiki/display/flexunit/FlexUnit
.. _Python:         http://python.org
.. _Git:      http://git-scm.com
.. _browse online:  http://github.com/thijstriemstra/acidswf
