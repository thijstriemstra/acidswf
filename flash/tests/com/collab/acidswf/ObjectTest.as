// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import com.collab.acidswf.loader.ConnectionLoader;		import org.flexunit.runners.Parameterized;	import org.hamcrest.assertThat;	import org.hamcrest.collection.arrayWithSize;	import org.hamcrest.object.hasProperty;	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for the Object type.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class ObjectTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: ConnectionLoader = new ConnectionLoader( testData );		       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( Object ));		}				[Test]		public function simple():void		{			assertThat(result[1], hasProperty( "a" ));			assertThat(result[1], hasProperty( "b" ));		}				[Test]		public function arrayOfObjects():void		{			assertThat(result[2], arrayWithSize( 2 ));		}		
		private static function getData():Array
		{			var tests:Array = [];						var tmp0:Object = new Object();			tests.push( tmp0 );			
			var tmp1: Object = {a: "foo", b: "bar"};
			tests.push(tmp1);
			
			var tmp2: Array = new Array();
			tmp2.push(tmp1);
			tmp2.push(tmp1);
			tests.push(tmp2);						return tests;
		}
		
	}
}
