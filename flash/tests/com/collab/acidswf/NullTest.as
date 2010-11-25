// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import com.collab.acidswf.loader.NetConnectionLoader;		import org.flexunit.runners.Parameterized;	import org.hamcrest.assertThat;	import org.hamcrest.collection.arrayWithSize;	import org.hamcrest.object.nullValue;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for null type.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class NullTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: NetConnectionLoader = new NetConnectionLoader(															Config.getAMFHostURL(),															Config.getAMFService(),															testData );       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], nullValue());		}				[Test]		public function list():void		{			assertThat(result[1], arrayWithSize( 2 ));		}		
		private static function getData():Array
		{			var tests:Array = [];			
			tests.push(null);						var list:Array = [null, null];			tests.push(list);						return tests;
		}
		
	}
}
