// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.graphics.codec.PNGEncoder;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.instanceOf;
		/**	 * Tests for the ByteArray type.	 * 	 * @language 3.0	 * @playerversion 9.0	 * @since 1.0 	 */
	public class ByteArrayTest extends BaseTest
	{		[Before]		public function setUp():void		{			setup();		}				[After]		public function tearDown():void		{			teardown();		}				[Test(async)]		public function create():void		{			var encoder:PNGEncoder = new PNGEncoder();			var temp:ByteArray = encoder.encode( bmd() );			temp.compress();						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result, instanceOf( ByteArray ));			},			temp );		}				[Test(async)]		public function size():void		{			var encoder:PNGEncoder = new PNGEncoder();			var temp:ByteArray = encoder.encode( bmd() );			temp.compress();						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result, instanceOf( ByteArray ));								var ba:ByteArray = ByteArray( loader.result );				assertThat(ba.length, equalTo( 142 ));								ba.deflate();				assertThat(ba.length, equalTo( 147 ));			},			temp );		}				[Test(async)]		public function list():void		{			var encoder:PNGEncoder = new PNGEncoder();			var temp:ByteArray = encoder.encode( bmd() );			temp.compress();						var tmp2:Array = new Array();			tmp2.push(temp);			tmp2.push(temp);						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result, arrayWithSize( 2 ));			},			tmp2 );		}				[Test(async)]		public function types():void		{			var tmp3:ByteArray = new ByteArray();			tmp3.writeBoolean(true);			tmp3.writeBoolean(false);						setupCall( function(event:Event, passThroughData:*):void			{				var ba:ByteArray = ByteArray( loader.result );								assertThat(ba.readBoolean(), equalTo( true ));				assertThat(ba.readBoolean(), equalTo( false ));			},			tmp3 );		}				private static function bmd():BitmapData
		{				// draw a red square			var bmp:BitmapData = new BitmapData( 80, 80, false, 0xCCCCCC );
			for (var g:uint=0; g < 80; g++)			{
			    bmp.setPixel( g, 40, 0xFF0000 );
			}						return bmp;
		}
		
	}
}
