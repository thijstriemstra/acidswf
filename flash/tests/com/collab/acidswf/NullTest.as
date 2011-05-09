// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import flash.events.Event;		import org.hamcrest.assertThat;	import org.hamcrest.collection.arrayWithSize;	import org.hamcrest.object.nullValue;
		/**	 * Tests for null type.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class NullTest extends BaseTest
	{		[Before]		public function setUp():void		{			setup();		}				[After]		public function tearDown():void		{			teardown();		}				[Test(async)]		public function create():void		{			setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, nullValue());			},			null );		}				[Test(async)]		public function list():void		{			var list:Array = [ null, null ];						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, arrayWithSize( 2 ));			},			list );		}		
	}
}
