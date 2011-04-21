Overview
========

AcidSWF provides a test suite for AMF_ and RTMP_ server and client implementations,
protocols used primarily by the Adobe `Flash Player`_.

It was developed using Python_ to test the PyAMF_ and RTMPy_ libraries, but 
the goal is to make it work for any AMF/RTMP implementation (Red5_, BlazeDS_, FMS_
etc.) that is compliant with the Flash Player.

The package consists of an Ant_ build script that controls:

- AMF/RTMP server
- FlexUnit test suite
- Adobe Flash Player

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
Twisted_                     11.0
PyAMF_                       0.6
RTMPy_                       0.2
===========================  ========

To build the documentation you need the following software:

===========================  ========
Name                         Version
===========================  ========
Sphinx_                      1.0
Beam_ theme                  N/A
===========================  ========


Installation
------------

#. AcidSWF uses Git_ for source control. Grab the source (`browse online`_)::

    git clone http://github.com/thijstriemstra/acidswf

#. Make sure the following environment variables are set:
  
  =========================  ====================================
  Name                       Description
  =========================  ====================================
  :envvar:`FLEX_HOME`        Path to `Flex SDK`_ folder
  :envvar:`ANT_HOME`         Installation folder for Ant_
  :envvar:`JAVA_HOME`        Installation folder for Java_
  =========================  ====================================
  
  For example, on a Unix machine you would set the :envvar:`FLEX_HOME` variable by
  entering the following on the command-line::
  
    export FLEX_HOME="/Applications/Adobe Flex Builder 3 Plug-in/sdks/4.1.0"

  On Windows::

    set FLEX_HOME="C:\Program Files\Adobe\Adobe Flex Builder 3 Plug-in\sdks\4.1.0"
 
3. Create a new folder in :file:`/path/to/acidswf/flash/lib` and then copy the
   following files in that folder:

  - `Hamcrest AS3`_ 
   - :file:`hamcrest.swc`
  - FlexUnit_
   - :file:`flexunit-cilistener.swc`
   - :file:`flexunit-core-as3.swc`
   - :file:`flexunit-uilistener.swc`
   - :file:`flexUnitTasks.jar`

4. Create a new file in :file:`build.properties` by making a copy of the
   template at :file:`/path/to/acidswf/build.properties.template`::

     cd acidswf
     cp build.properties.template build.properties

   In this file you adjust the host/port settings for the RTMP and AMF servers.


Running AcidSWF
---------------

Run Ant from the root of your AcidSWF source directory::

    ant

This will print the script's progress on stdout. For each test suite an HTML
report will be created in the :file:`flash/bin/report/html` folder.


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
.. _FlexUnit:    http://flexunit.org
.. _Python:         http://python.org
.. _Git:      http://git-scm.com
.. _browse online:  http://github.com/thijstriemstra/acidswf
