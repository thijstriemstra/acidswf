// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;
	
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * @language 3.0	 * @playerversion 9.0	 * @since 1.0 	 */
	public class ByteArrayTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: NetConnectionLoader = new NetConnectionLoader(															Config.getAMFHostURL(),															Config.getAMFService(),															testData );       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( ByteArray ));		}				private static function getData():Array
		{				var tests:Array = [];						// Draw a red line in a BitmapData object			var g:uint = 0;			var red:uint = 0xFF0000;			var bmp1:BitmapData = new BitmapData( 80, 80, false, 0xCCCCCC );
			for (g; g < 80; g++)			{
			    bmp1.setPixel( g, 40, red );
			}
			
			// TODO: Create ByteArray with PNG data
			var temp1: ByteArray = new ByteArray(); //PNGEnc.encode( bmp1 );
			temp1.compress();
			tests.push(temp1);
			
			var tmp2: Array = new Array();
			tmp2.push(temp1);
			tmp2.push(temp1);
			tests.push(tmp2);						return tests;
		}
		
	}
}
