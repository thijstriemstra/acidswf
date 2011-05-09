// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.data.EchoClass;
	
	import flash.events.Event;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.hasProperty;
	import org.hamcrest.object.instanceOf;
		/**	 * Tests for custom class (untyped so data is turned into simple Objects).	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class CustomClassTest extends BaseTest
	{		[Before]		public function setUp():void		{			setup();		}				[After]		public function tearDown():void		{			teardown();		}				[Test(async)]		public function create():void		{			var tmp:EchoClass = new EchoClass();						setupCall( function(event:Event, passThroughData:*):void			{				// NOTE: instance of Object because this class intentionally				// isn't remotely aliased				assertThat( loader.result, instanceOf( Object ));			},			tmp );		}				[Test(async)]		public function attributes():void		{			var tmp:EchoClass = new EchoClass();			tmp.attr1 = "one";			tmp.attr2 = 1;						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result, hasProperty( "attr1" ));				assertThat(loader.result, hasProperty( "attr2" ));			},			tmp );		}				[Test(async)]		public function list():void		{			var tmp1:EchoClass = new EchoClass();			tmp1.attr1 = "one";			tmp1.attr2 = 1;						var tmp2:Array = new Array();			tmp2.push(tmp1);			tmp2.push(tmp1);						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, arrayWithSize( 2 ));			},			tmp2 );		}		
	}
}
