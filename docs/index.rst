Overview
========

AcidSWF provides a test suite for AMF_ and RTMP_ server and client implementations,
protocols used primarily by the Adobe `Flash Player`_.

AcidSWF was developed using Python_ to test the PyAMF_ and RTMPy_ libraries, but 
the goal is to make it work for any AMF/RTMP implementation (Red5_, BlazeDS_, FMS_
etc) that is compliant with the Flash Player.

AcidSWF consists of an Ant_ build script that controls:

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

To use AcidSWF you'll need the following software:

- Ant_ >= 1.7
- `Flex SDK`_ > 4.1
- FlexUnit_ >= 4.1
- `Flash Player`_ (Debugger) >= 9.0
- `Hamcrest AS3`_ >= 1.0.2
- Java_ >= 1.6

The default configuration for Python_ also requires:

- Python_ >= 2.5
- Twisted_ >= 8.0
- PyAMF_ >= 0.6
- RTMPy_ >= 0.1


Configuration
-------------


Running AcidSWF
---------------


.. _AMF:
.. _RTMP:
.. _Flash Player:
.. _PyAMF:    http://pyamf.org
.. _RTMPy:    http://rtmpy.org
.. _Red5:     http://red5.org
.. _Ant:      http://ant.apache.org
.. _Flex SDK:
.. _Hamcrest AS3:
.. _Twisted:  http://twistedmatrix.com
.. _Java:     
.. _BlazeDS:  
.. _FMS:      
.. _FlexUnit:
.. _Python:         http://python.org
.. _Git:      http://git-scm.com
.. _browse online:  http://github.com/thijstriemstra/acidswf
