// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.ConnectionLoader;		import mx.utils.ObjectProxy;		import org.flexunit.runners.Parameterized;	import org.hamcrest.assertThat;	import org.hamcrest.collection.arrayWithSize;	import org.hamcrest.object.hasProperty;	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for ObjectProxy type, part of the Flex SDK.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class ObjectProxyTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: ConnectionLoader = new ConnectionLoader( testData );		       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( ObjectProxy ));		}				[Test]		public function attributes():void		{			assertThat(result[1], hasProperty( "a" ));			assertThat(result[1], hasProperty( "b" ));		}				[Test]		public function list():void		{			assertThat(result[2], arrayWithSize( 2 ));		}		
		private static function getData():Array
		{			var tests:Array = [];						var temp0: ObjectProxy = new ObjectProxy();			tests.push(temp0);			
			var temp1: ObjectProxy = new ObjectProxy( { a: "foo", b: 5 } );
			tests.push(temp1);
			
			var temp2: Array = new Array();
			temp2.push(temp1);
			temp2.push(temp1);
			tests.push(temp2);						return tests;
		}
		
	}
}
