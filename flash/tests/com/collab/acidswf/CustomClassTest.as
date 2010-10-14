// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.EchoClass;

	public class CustomClassTest
	{
                private var tests:Array = [];

                [Ignore]
                [Test]
		public function customClassTest():void
		{
			var tmp1: EchoClass = new EchoClass();
			tmp1.attr1 = "one";
			tmp1.attr2 = 1;
			tests.push(tmp1);
			
			var tmp2: Array = new Array();
			tmp2.push(tmp1);
			tmp2.push(tmp1);
			tests.push(tmp2);
		}
		
	}
}
