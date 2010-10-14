// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import mx.utils.ObjectProxy;
	
	public class ObjectProxyTest
	{
                private var tests:Array = [];

                [Ignore]
                [Test]
		public function ObjectProxyTest():void
	        {
			var temp1: ObjectProxy = new ObjectProxy( { a: "foo", b: 5 } );
			tests.push(temp1);
			
			var temp2: Array = new Array();
			temp2.push(temp1);
			temp2.push(temp1);
			tests.push(temp2);
		}
		
	}
}
