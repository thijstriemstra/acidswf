// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;
	
	import flash.display.BitmapData;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for unsupported types.	 * 	 * @language 3.0	 * @playerversion 9.0	 * @since 1.0 	 */	public class UnsupportedTest
	{
		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: NetConnectionLoader = new NetConnectionLoader(															Config.getAMFHostURL(),															Config.getAMFService(),															testData );       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( Object ));		}		
		private static function getData():Array
		{			var tests:Array = [];			
			var bmp1:BitmapData = new BitmapData( 80, 80, false, 0xCCCCCC );
			var blue:uint = 0x3232CD;			
			// Draw a blue line in a BitmapData object
			for (var h:uint = 0; h < 80; h++)
			{
			    bmp1.setPixel( h, 40, blue );
			}
			tests.push(bmp1);
			
			var tmp1: Array = new Array();
			tmp1.push(bmp1);
			tmp1.push(bmp1);
			tests.push(tmp1);						return tests;
		}
		
	}
}
