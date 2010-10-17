// Copyright (c) The AcidSWF Project.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;
	
	import flash.display.BitmapData;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.instanceOf;
	{
		private var foo					: Parameterized;
		private static function getData():Array
		{
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
			tests.push(tmp1);
		}
		
	}
}