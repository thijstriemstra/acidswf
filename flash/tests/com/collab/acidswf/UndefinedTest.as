// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	public class UndefinedTest
	{
                private var tests:Array = [];

                [Ignore]
                [Test]
		public function undefinedTest():void
		{
			tests.push(undefined);
		}
		
	}
}
