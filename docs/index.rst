Overview
========

AcidSWF provides a test suite for AMF and RTMP implementations, protocols used
primarily by the Adobe Flash Player.

It was developed using Python_ to test the PyAMF_ and RTMPy_ libraries, but the goal
is to make it work for any implementation (Red5_, BlazeDS_, FMS_ etc) that is
compliant with the Adobe Flash Player.


Download
--------

We use Git_ for source control. Grab the source (`browse online`_)::

    git clone http://github.com/thijstriemstra/acidswf


Getting Started
---------------

AMF Server
----------
 
1. Open a console/command prompt and start the `echo test server`_::

    cd acidswf/python
    python server.py

2. It should print a startup text::

    Started Echo Test - WSGI server on http://localhost:8000


Flash Client
------------

1. Open the compiled SWF (in a browser) and change the HTTP field from http://localhost:5080/echo/gateway to http://localhost:8000
2. Press the ``HTTP AMF0``, ``HTTP AMF3`` or ``mx:RemoteObject`` button to start one or more of the selected tests. 
3. Check the test results in the output log of the SWF::

    Connecting through HTTP using AMF0 encoding...
    Testing null: OK (in 0.118 sec). Result: (null)
    Testing undefined: OK (in 0.025 sec). Result: (null)
    Testing true: OK (in 0.049 sec). Result: (true)
    Testing false: OK (in 0.05 sec). Result: (false)
    Testing : OK (in 0.05 sec). Result: (String with 0 chars)
    Testing Hello world!: OK (in 0.052 sec). Result: (Hello world!)
    Testing test1,test2,test3,test4: OK (in 0.051 sec). Result: (test1,test2,test3,test4)
    Testing String with 40000 chars: OK (in 0.048 sec). Result: (String with 40000 chars)
    Testing String with 70000 chars: OK (in 0.063 sec). Result: (String with 70000 chars)
    Testing String with 1000000 chars: OK (in 0.2 sec). Result: (String with 1000000 chars)
    Testing 0: OK (in 0.031 sec). Result: (0)
    Testing 1: OK (in 0.042 sec). Result: (1)
    Testing -1: OK (in 0.042 sec). Result: (-1)
    Testing 256: OK (in 0.053 sec). Result: (256)
    Testing -256: OK (in 0.045 sec). Result: (-256)
    Testing 65536: OK (in 0.052 sec). Result: (65536)
    Testing -65536: OK (in 0.05 sec). Result: (-65536)
    etc....


Options
-------

Server Type
-----------

PyAMF supports the WSGI_, Twisted_ and Django_ web frameworks out of the box.

The default action is to use the WSGI framework as a base to serve the gateway. There is a commandline switch ``--type`` which you can use to change the server type.
The values ``wsgi``, ``twisted``, ``django``, and ``wasd`` are supported in this application::

    python server.py --type=twisted


It should print a startup text::

    Started Echo Test - Twisted server on http://localhost:8000


Port
----
You can change the port that the gateway is served on. The default is ``8000``::

    python server.py --port=4444


It should print a startup text::

    Started Echo Test - WSGI server on http://localhost:4444

Host
----

You can change the host address that the gateway is listening on with the ``--host`` switch. The default is ``localhost``::

    python server.py --host=192.168.1.100


It should print a startup text::

    Started Echo Test - WSGI server on http://192.168.1.100:8000


.. _PyAMF:    http://pyamf.org
.. _RTMPy:    http://rtmpy.org
.. _Red5:     http://red5.org
.. _BlazeDS:  
.. _FMS:      
.. _Python:         http://python.org
.. _Git:      http://git-scm.com
.. _browse online:  http://github.com/thijstriemstra/acidswf
.. _echo test server: http://github.com/thijstriemstra/acidswf/blob/master/python/server.py
.. _WSGI:	    http://wsgi.org
.. _Twisted:        http://twistedmatrix.com
.. _Django:         http://www.djangoproject.com
