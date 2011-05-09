// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import flash.display.BitmapData;
	import flash.events.Event;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.instanceOf;
		/**	 * Tests for unsupported types.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */	public class UnsupportedTest extends BaseTest
	{		private static var bmp1:BitmapData;		private static var blue:uint = 0x3232CD;				[Before]		public function setUp():void		{			setup();						bmp1 = new BitmapData( 80, 80, false, 0xCCCCCC );						// Draw a blue line in a BitmapData object			for (var h:uint = 0; h < 80; h++)			{				bmp1.setPixel( h, 40, blue );			}		}				[After]		public function tearDown():void		{			teardown();		}		
		[Test(async)]		public function create():void		{			setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, instanceOf( Object ));			},			bmp1 );		}				[Test(async)]		public function list():void		{			var tmp1: Array = new Array();			tmp1.push(bmp1);			tmp1.push(bmp1);						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, arrayWithSize( 2 ));			},			tmp1 );		}		
	}
}
