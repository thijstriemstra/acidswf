// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import flash.events.Event;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.date.dateEqual;
	import org.hamcrest.object.instanceOf;
		/**	 * Tests for Date type.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class DateTest extends BaseTest
	{		[Before]		public function setUp():void		{			setup();		}				[After]		public function tearDown():void		{			teardown();		}		
		[Test(async)]		public function create():void		{			var lastThursday:Date = new Date( 1982, 8, 30 );						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, instanceOf( Date ));				assertThat( loader.result, dateEqual( passThroughData ));			},			lastThursday );		}				[Test(async)]		public function list():void		{			var lastThursday:Date = new Date( 1982, 8, 30 );						var tmp:Array = new Array();			tmp.push(lastThursday);			tmp.push(lastThursday);						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, arrayWithSize( 2 ));			},			tmp );		}			}
}
