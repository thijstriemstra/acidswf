// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;
	
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	import mx.graphics.codec.PNGEncoder;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.hasProperty;
	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for the ByteArray type.	 * 	 * @language 3.0	 * @playerversion 9.0	 * @since 1.0 	 */
	public class ByteArrayTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: NetConnectionLoader = new NetConnectionLoader(															Config.getAMFHostURL(),															Config.getAMFService(),															testData );       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( ByteArray ));		}				[Test]		public function size():void		{			assertThat(result[ 0 ], instanceOf( ByteArray ));						var ba:ByteArray = ByteArray( result[ 0 ]);			assertThat(ba.length, equalTo( 142 ));						ba.deflate();			assertThat(ba.length, equalTo( 147 ));		}				[Test]		public function list():void		{			assertThat(result[ 1 ], arrayWithSize( 2 ));		}				[Test]		public function types():void		{			var ba:ByteArray = ByteArray( result[ 2 ]);						assertThat(ba.readBoolean(), equalTo( true ));			assertThat(ba.readBoolean(), equalTo( false ));		}				private static function getData():Array
		{				var tests:Array = [];						// Create a red BitmapData object			var bmp1:BitmapData = new BitmapData( 80, 80, false, 0xCCCCCC );
			for (var g:uint=0; g < 80; g++)			{
			    bmp1.setPixel( g, 40, 0xFF0000 );
			}
			
			// Create ByteArray with PNG data			var encoder:PNGEncoder = new PNGEncoder();
			var temp1: ByteArray = encoder.encode( bmp1 );
			temp1.compress();
			tests.push(temp1);
			
			var tmp2: Array = new Array();
			tmp2.push(temp1);
			tmp2.push(temp1);
			tests.push(tmp2);						var tmp3:ByteArray = new ByteArray();			tmp3.writeBoolean(true);			tmp3.writeBoolean(false);			tests.push(tmp3);						return tests;
		}
		
	}
}
