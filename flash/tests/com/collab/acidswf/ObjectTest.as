// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	public class ObjectTest
	{
                private var tests:Array = [];

                [Ignore]
                [Test]
		public function objectTest():void
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
