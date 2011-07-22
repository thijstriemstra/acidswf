// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import flash.events.Event;		import org.hamcrest.assertThat;	import org.hamcrest.core.isA;
		/**	 * Tests for Vector type.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class VectorTest extends BaseTest
	{		[Before]		public function setUp():void		{			setup();		}				[After]		public function tearDown():void		{			teardown();		}				[Test(async)]		public function create():void		{			var v:Vector.<String>;			v = new Vector.<String>();			setupCall( function(event:Event, passThroughData:*):void			{				assertThat( loader.result, isA( Vector ));			},			v );		}			}
}
