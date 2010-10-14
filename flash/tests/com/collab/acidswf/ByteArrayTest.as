// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	public class ByteArrayTest
	{
private var tests:Array = [];
                [Ignore]
                [Test]
		public function byteArrayTest():void
		{			
			var bmp1:BitmapData = new BitmapData( 80, 80, false, 0xCCCCCC );
			
			// Draw a red line in a BitmapData object
			for (var g:uint = 0; g < 80; g++) {
			    var red:uint = 0xFF0000;
			    bmp1.setPixel( g, 40, red );
			}
			
			// Create ByteArray with PNG data
			var temp1: ByteArray = new ByteArray(); //PNGEnc.encode( bmp1 );
			temp1.compress();
			tests.push(temp1);
			
			var tmp2: Array = new Array();
			tmp2.push(temp1);
			tmp2.push(temp1);
			tests.push(tmp2);
		}
		
	}
}
