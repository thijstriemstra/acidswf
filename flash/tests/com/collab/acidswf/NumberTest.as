// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	public class NumberTest
	{
                private var tests:Array = [];

                [Ignore]
                [Test]
		public function numberTest():void
		{
			
			tests.push(0);
			tests.push(1);
			tests.push(-1);
			tests.push(256);
			tests.push(-256);
			tests.push(65536);
			tests.push(-65536);
			tests.push(Number.NaN);
			//tests.push(Number.NEGATIVE_INFINITY);
			//tests.push(Number.POSITIVE_INFINITY);
			tests.push(Number.MAX_VALUE);
			tests.push(Number.MIN_VALUE);
			tests.push(0.0);
			tests.push(1.5);
			tests.push(-1.5);
			tests.push(uint(0x000000));
		}
		
	}
}
