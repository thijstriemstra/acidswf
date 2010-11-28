// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.data.ExternalizableClass;
	import com.collab.acidswf.loader.ConnectionLoader;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for classes implementing IExternalizable.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class ExternalizableTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: ConnectionLoader = new ConnectionLoader( testData );		       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( ExternalizableClass ));		}				[Test]		public function list():void		{			assertThat(result[1], arrayWithSize( 2 ));		}		
		private static function getData():Array
		{
			var tests:Array = [];
			
			var ext: ExternalizableClass = new ExternalizableClass();
			tests.push(ext);
			
			var tmp_1: Array = new Array();
			tmp_1.push(ext);
			tmp_1.push(ext);
			tests.push(tmp_1);						return tests;
		}
		
	}
}
