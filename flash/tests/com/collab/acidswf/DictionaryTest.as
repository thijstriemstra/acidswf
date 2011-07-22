// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import flash.events.Event;	import flash.utils.Dictionary;		import org.hamcrest.assertThat;	import org.hamcrest.core.isA;
		/**	 * Tests for Dictionary type.	 * 	 * @language 3.0	 * @playerversion Flash 10.0	 * @since 1.0 	 */
	public class DictionaryTest extends BaseTest
	{		[Before]		public function setUp():void		{			setup();		}				[After]		public function tearDown():void		{			teardown();		}				[Test(async)]		public function create():void		{			var dict:Dictionary = new Dictionary();			setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, isA( Dictionary ));			},			dict );		}			}
}
