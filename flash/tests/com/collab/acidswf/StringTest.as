// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	public class StringTest
	{
                private var tests:Array = [];

                [Ignore]
                [Test]
		public function stringTest():void
		{
			tests.push("");
			tests.push("Hello world!");
			
			var strings: Array = new Array();
			strings.push("test1");
			strings.push("test2");
			strings.push("test3");
			strings.push("test4");
			tests.push(strings);
			
			// long Strings
			var i: Number;
			var longString: String = "";
			
			// 10,000 chars
			for (i=0; i<1000; i++)
				longString = longString + "0123456789";
			tests.push(longString);
			
			// 100,000 chars
			var reallyLongString: String = "";
			for (i=0; i<10000; i++)
				reallyLongString = reallyLongString + "0123456789";
			tests.push(reallyLongString);
			
			// 1,000,000 chars
			var giganticString: String = "";
			for (i=0; i<100000; i++)
				giganticString = giganticString + "0123456789";
			tests.push(giganticString);
		}
		
	}
}
