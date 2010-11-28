// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import com.collab.acidswf.loader.ConnectionLoader;		import org.flexunit.runners.Parameterized;	import org.hamcrest.assertThat;	import org.hamcrest.object.equalTo;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for the undefined type.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */	public class UndefinedTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: ConnectionLoader = new ConnectionLoader( testData );		       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], equalTo( undefined ));		}		
		private static function getData():Array
		{			var tests:Array = [];			
			tests.push(undefined);						return tests;
		}
		
	}
}
