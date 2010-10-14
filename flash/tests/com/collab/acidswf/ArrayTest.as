// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	public class ArrayTest
	{
                private var tests:Array = [];
                [Ignore]
                [Test]
		public function arrayTest():void
		{			
			tests.push(new Array());
			
			var tmp1: Array = new Array();
			tmp1.push(1);
			tests.push(tmp1);
			tests.push([1, 2]);
			tests.push([1, 2, 3]);
			tests.push([1, 2, [1, 2]]);
			
			var tmp2: Array = new Array();
			tmp2.push(1);
			tmp2[100] = 100;
			tests.push(tmp2);
			
			var tmp3: Array = new Array();
			tmp3.push(1);
			tmp3["one"] = 1;
			tests.push(tmp3);
		}
		
	}
}
