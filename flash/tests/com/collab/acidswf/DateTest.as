// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.date.dateEqual;
	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for Date type.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class DateTest
	{
		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: NetConnectionLoader = new NetConnectionLoader(															Config.getAMFHostURL(),															Config.getAMFService(),															testData );       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( Date ));			assertThat(result[0], dateEqual(new Date(1982, 8, 30)));		}				[Test]		public function list():void		{			assertThat(result[1], arrayWithSize( 2 ));		}				private static function getData():Array
		{			var tests:Array = [];			
			var now: Date = new Date(1982, 8, 30);
			tests.push(now);
			
			var tmp1: Array = new Array();
			tmp1.push(now);
			tmp1.push(now);
			tests.push(tmp1);
						return tests;		}
		
	}
}
