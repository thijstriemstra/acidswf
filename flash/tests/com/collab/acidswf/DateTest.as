// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * @language 3.0	 * @playerversion 9.0	 * @since 1.0 	 */
	public class DateTest
	{
		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: NetConnectionLoader = new NetConnectionLoader(															Config.getAMFHostURL(),															Config.getAMFService(),															testData );       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( Date ));		}				private static function getData():Array
		{			var tests:Array = [];			
			var now: Date = new Date();
			tests.push(now);
			
			var tmp1: Array = new Array();
			tmp1.push(now);
			tmp1.push(now);
			tests.push(tmp1);
						return tests;		}
		
	}
}
