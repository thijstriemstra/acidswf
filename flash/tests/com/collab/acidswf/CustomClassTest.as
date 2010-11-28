// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.data.EchoClass;
	import com.collab.acidswf.loader.ConnectionLoader;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.hasProperty;
	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for custom classes.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class CustomClassTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: ConnectionLoader = new ConnectionLoader( testData );		       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			// NOTE: instance of object because this class intentionally			// isn't remotely aliased			assertThat(result[0], instanceOf( Object ));		}				[Test]		public function attributes():void		{			assertThat(result[ 1 ], hasProperty( "attr1" ));			assertThat(result[ 1 ], hasProperty( "attr2" ));		}				[Test]		public function list():void		{			assertThat(result[ 2 ], arrayWithSize( 2 ));		}		
		private static function getData():Array
		{			var tests:Array = [];						var tmp0: EchoClass = new EchoClass();			tests.push( tmp0 );			
			var tmp1: EchoClass = new EchoClass();
			tmp1.attr1 = "one";
			tmp1.attr2 = 1;
			tests.push(tmp1);
			
			var tmp2: Array = new Array();
			tmp2.push(tmp1);
			tmp2.push(tmp1);
			tests.push(tmp2);						return tests;
		}
		
	}
}
