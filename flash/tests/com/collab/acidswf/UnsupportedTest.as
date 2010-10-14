// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import flash.display.BitmapData;

	public class UnsupportedTest
	{
                private var tests:Array = [];

                [Ignore]
                [Test]
		public function unsupportedTest():void
		{
			var bmp1:BitmapData = new BitmapData( 80, 80, false, 0xCCCCCC );
			
			// Draw a blue line in a BitmapData object
			for (var h:uint = 0; h < 80; h++)
			{
			    var blue:uint = 0x3232CD;
			    bmp1.setPixel( h, 40, blue );
			}
			tests.push(bmp1);
			
			var tmp1: Array = new Array();
			tmp1.push(bmp1);
			tmp1.push(bmp1);
			tests.push(tmp1);
		}
		
	}
}
