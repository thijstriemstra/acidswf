// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.data.ExternalizableClass;
	
	import flash.events.Event;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.instanceOf;
		/**	 * Tests for classes implementing IExternalizable.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class ExternalizableTest extends BaseTest
	{		[Before]		public function setUp():void		{			setup();		}				[After]		public function tearDown():void		{			teardown();		}				[Test(async)]		public function create():void		{			var ext:ExternalizableClass = new ExternalizableClass();						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result, instanceOf( ExternalizableClass ));			},			ext );		}				[Test(async)]		public function list():void		{			var ext:ExternalizableClass = new ExternalizableClass();			var tmp_1:Array = new Array();			tmp_1.push(ext);			tmp_1.push(ext);						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result, arrayWithSize( 2 ));			},			tmp_1 );		}		
	}
}
