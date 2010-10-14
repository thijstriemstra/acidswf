// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	public class DateTest
	{
                private var tests:Array = [];

                [Ignore]
                [Test]
		public function dateTest():void
		{
			var now: Date = new Date();
			tests.push(now);
			
			var tmp1: Array = new Array();
			tmp1.push(now);
			tmp1.push(now);
			tests.push(tmp1);
		}
		
	}
}
