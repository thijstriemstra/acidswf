// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.data.RemoteClass;
	
	import flash.events.Event;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.hasPropertyWithValue;
	import org.hamcrest.object.instanceOf;
		/**	 * Remote class tests.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */	public class RemoteClassTest extends BaseTest
	{		[Before]		public function setUp():void		{			setup();		}				[After]		public function tearDown():void		{			teardown();		}				[Test(async)]		public function create():void		{			var new_remote:RemoteClass = new RemoteClass();						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, instanceOf( RemoteClass ));			},			new_remote );		}				[Test(async)]		public function simple():void		{			var remote: RemoteClass = new RemoteClass();			remote.attribute1 = "one";			remote.attribute2 = 2;						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, hasPropertyWithValue( "attribute1", equalTo( "one" )));				assertThat( loader.result, hasPropertyWithValue( "attribute2", equalTo( 2 )));			},			remote );		}				[Test(async)]		public function list():void		{			var tmp1: Array = new Array();			var remote1: RemoteClass = new RemoteClass();			remote1.attribute1 = "one";			remote1.attribute2 = 1;			tmp1.push(remote1);						var remote2: RemoteClass = new RemoteClass();			remote2.attribute1 = "two";			remote2.attribute2 = 2;			tmp1.push(remote2);						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, arrayWithSize( 2 ));				assertThat( loader.result[0], hasPropertyWithValue( "attribute1", equalTo( "one" )));				assertThat( loader.result[1], hasPropertyWithValue( "attribute1", equalTo( "two" )));			},			tmp1 );		}		
	}
}
