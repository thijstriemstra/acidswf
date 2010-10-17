// Copyright (c) The AcidSWF Project.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;
	public class ObjectProxyTest
	{
		private static function getData():Array
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