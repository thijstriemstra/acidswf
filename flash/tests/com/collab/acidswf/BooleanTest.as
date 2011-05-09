// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import flash.events.Event;		import org.hamcrest.assertThat;	import org.hamcrest.collection.arrayWithSize;	import org.hamcrest.core.isA;	import org.hamcrest.object.equalTo;
		/**	 * Tests for the Boolean type.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class BooleanTest extends BaseTest
	{		[Before]		public function setUp():void		{			setup();		}				[After]		public function tearDown():void		{			teardown();		}				[Test(async)]		public function array():void		{			var tmp:Array = [false, true];						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result, arrayWithSize( 2 ));				assertThat(loader.result[0], equalTo( false ));				assertThat(loader.result[1], equalTo( true ));			},			tmp );		}				[Test(async)]		public function booleanTrue():void		{			var tmp:Boolean = true;						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result, isA( Boolean ));				assertThat(loader.result, equalTo( true ));			},			tmp );		}				[Test(async)]		public function booleanFalse():void		{			var tmp:Boolean = false;						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result, isA( Boolean ));				assertThat(loader.result, equalTo( false ));			},			tmp );		}		
	}
}
