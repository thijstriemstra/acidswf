// Copyright (c) The AcidSWF Project.
package com.collab.acidswf
{
	public class ObjectTest
	{
		private static function getData():Array
		{
			var tmp1: Object = {a: "foo", b: "bar"};
			tests.push(tmp1);
			
			var tmp2: Array = new Array();
			tmp2.push(tmp1);
			tmp2.push(tmp1);
			tests.push(tmp2);
		}
		
	}
}