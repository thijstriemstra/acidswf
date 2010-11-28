// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import com.collab.acidswf.loader.ConnectionLoader;		import org.flexunit.runners.Parameterized;	import org.hamcrest.assertThat;	import org.hamcrest.object.equalTo;	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * String tests.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class StringTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: ConnectionLoader = new ConnectionLoader( testData );		       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( String ));		}				[Test]		public function simple():void		{			assertThat(result[1], equalTo( "" ));			assertThat(result[2], equalTo( "Hello world!" ));		}				[Test]		public function arrayOfStrings():void		{			assertThat(result[3], equalTo( ["test1", "test2", "test3", "test4"] ));		}				[Test]		public function longString():void		{			// XXX: move to static attr			var i: Number;			var longString: String = "";						// 10,000 chars			for (i=0; i<1000; i++)				longString = longString + "0123456789";						assertThat(result[4], equalTo( longString ));		}				[Test]		public function reallyLongString():void		{			// XXX: move to static attr			var i: Number;						// 100,000 chars			var reallyLongString: String = "";			for (i=0; i<10000; i++)				reallyLongString = reallyLongString + "0123456789";						assertThat(result[5], equalTo( reallyLongString ));		}				[Test]		public function giganticString():void		{			// XXX: move to static attr			var i: Number;						// 1,000,000 chars			var giganticString: String = "";			for (i=0; i<100000; i++)				giganticString = giganticString + "0123456789";						assertThat(result[6], equalTo( giganticString ));		}		
		private static function getData():Array
		{			var tests:Array = [];			tests.push(new String());			
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
			tests.push(giganticString);						return tests;
		}
		
	}
}
