// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.instanceOf;
	import org.hamcrest.object.nullValue;
	import org.hamcrest.text.containsString;
		/**	 * Tests for the ArrayCollection type, part of the Flex SDK.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @productversion Flex 2	 * @since 1.0 	 */
	public class ArrayCollectionTest extends BaseTest
    {		[Before]		public function setUp():void		{			setup();		}				[After]		public function tearDown():void		{			teardown();		}				[Test(async)]		public function create():void		{			var tmp:ArrayCollection = new ArrayCollection();						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, instanceOf( ArrayCollection ));			},			tmp );		}				[Test(async)]		public function mixed():void		{			var tmp:ArrayCollection = new ArrayCollection();			tmp.addItem("one");			tmp.addItem(123);			tmp.addItem(null);						setupCall( function(event:Event, passThroughData:*):void			{				assertThat(loader.result.getItemAt(0), containsString( "one" ));				assertThat(loader.result.getItemAt(1), equalTo( 123 ));				assertThat(loader.result.getItemAt(2), nullValue());			},			tmp );		}				[Test(async)]		public function collectionOfArrays():void		{			var tmp:ArrayCollection = new ArrayCollection();			tmp.addItem("four");			tmp.addItem(78900);						var tmp_2:Array = new Array();			tmp_2.push( tmp );			tmp_2.push( tmp );						setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, arrayWithSize( 2 ));				assertThat( loader.result[0], instanceOf( ArrayCollection ));				assertThat( loader.result[1], instanceOf( ArrayCollection ));			},			tmp_2 );		}		
	}
}
