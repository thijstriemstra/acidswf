// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import flash.events.Event;		import org.hamcrest.assertThat;	import org.hamcrest.collection.arrayWithSize;	import org.hamcrest.object.equalTo;	import org.hamcrest.object.hasPropertyWithValue;	import org.hamcrest.object.instanceOf;
		/**	 * Tests for the Object type.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class ObjectTest extends BaseTest
	{		private static var tmp1:Object;				[Before]		public function setUp():void		{			setup();						tmp1 = {a: "foo", b: "bar"};		}				[After]		public function tearDown():void		{			teardown();						tmp1 = null;		}				[Test(async)]		public function create():void		{			var tmp0:Object = new Object();						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, instanceOf( Object ));			},			tmp0 );		}				[Test(async)]		public function simple():void		{			setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, hasPropertyWithValue( "a", equalTo( "foo" )));				assertThat( loader.result, hasPropertyWithValue( "b", equalTo( "bar" )));			},			tmp1 );		}				[Test(async)]		public function arrayOfObjects():void		{			var tmp2: Array = new Array();			tmp2.push(tmp1);			tmp2.push(tmp1);						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, arrayWithSize( 2 ));			},			tmp2 );		}		
	}
}
