// Copyright (c) The AcidSWF Project.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;
	
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	public class ByteArrayTest
	{
		{	
			for (g; g < 80; g++)
			    bmp1.setPixel( g, 40, red );
			}
			
			// TODO: Create ByteArray with PNG data
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