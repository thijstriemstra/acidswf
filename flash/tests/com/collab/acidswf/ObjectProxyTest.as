// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import flash.events.Event;		import mx.utils.ObjectProxy;		import org.hamcrest.assertThat;	import org.hamcrest.collection.arrayWithSize;	import org.hamcrest.object.hasProperty;	import org.hamcrest.object.instanceOf;
		/**	 * Tests for ObjectProxy type, part of the Flex SDK.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @productversion Flex 2.0	 * @since 1.0 	 */
	public class ObjectProxyTest extends BaseTest
	{		[Before]		public function setUp():void		{			setup();		}				[After]		public function tearDown():void		{			teardown();		}				[Test(async)]		public function create():void		{			var temp:ObjectProxy = new ObjectProxy();						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result, instanceOf( ObjectProxy ));			},			temp );		}				[Test(async)]		public function attributes():void		{			var temp:ObjectProxy = new ObjectProxy( { a: "foo", b: 5 } );						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result, hasProperty( "a" ));				assertThat(loader.result, hasProperty( "b" ));			},			temp );		}				[Test(async)]		public function list():void		{			var temp1:ObjectProxy = new ObjectProxy( { foo: "over", bar: 9000 } );			var temp2:Array = new Array();			temp2.push(temp1);			temp2.push(temp1);						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result, arrayWithSize( 2 ));				assertThat(loader.result[0], instanceOf( ObjectProxy ));			},			temp2 );		}		
	}
}
