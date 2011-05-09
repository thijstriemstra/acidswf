// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import flash.events.Event;		import org.hamcrest.assertThat;	import org.hamcrest.collection.array;	import org.hamcrest.collection.arrayWithSize;	import org.hamcrest.collection.emptyArray;	import org.hamcrest.collection.hasItem;	import org.hamcrest.object.equalTo;	import org.hamcrest.object.instanceOf;
		/**	 * Test for the Array type.	 * 
	 * @language 3.0	 * @playerversion 9.0	 * @since 1.0 
	 */	
	public class ArrayTest extends BaseTest
	{		[Before]		public function setUp():void		{			setup();		}				[After]		public function tearDown():void		{			teardown();		}				[Test(async)]		public function newArray():void		{			var tmp:Array = new Array();						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, instanceOf( Array ));				assertThat( loader.result, emptyArray());			},			tmp );		}				[Test(async)]		public function singleElement():void		{			var tmp:Array = new Array();			tmp.push(1);						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, arrayWithSize( 1 ));				assertThat( loader.result, hasItem( equalTo( 1 )));			},			tmp );		}				[Test(async)]		public function multipleElements():void		{			var tmp:Array = [1, 2, 3];						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, arrayWithSize( 3 ));				assertThat( loader.result, array( 1, 2, 3 ));			},			tmp );		}				[Test(async)]		public function nestedElements():void		{			var tmp:Array = [1, 2, [1, 2]];						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, arrayWithSize( 3 ));				assertThat( loader.result, equalTo( [1, 2, [1, 2]] ));			},			tmp );		}				[Test(async)]		public function emptyElements():void		{						var tmp:Array = new Array();			tmp.push(1);			tmp[100] = 100;			setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, equalTo( passThroughData ));			},			tmp );		}				[Test(async)]		public function namedElement():void		{			var tmp:Array = new Array();			tmp.push(1);			tmp["lastThursday"] = new Date( 1920, 1, 1 );						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, arrayWithSize( 2 ));				assertThat( loader.result, equalTo( passThroughData ));			},			tmp );		}			}
}
