// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import com.collab.acidswf.loader.NetConnectionLoader;		import org.flexunit.runners.Parameterized;	import org.hamcrest.assertThat;	import org.hamcrest.object.equalTo;	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for the Object type.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class ObjectTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: NetConnectionLoader = new NetConnectionLoader(															Config.getRTMPHostURL(),															Config.getRTMPApplication(),															testData );       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( Object ));		}				[Test]		[Ignore]		public function simple():void		{			assertThat(result[1], equalTo( {a: "foo", b: "bar"} ));		}				[Test]		[Ignore]		public function arrayOfObjects():void		{			var tmp1: Object = {a: "foo", b: "bar"};			var tmp2: Array = new Array();			tmp2.push(tmp1);			tmp2.push(tmp1);						assertThat(result[2], equalTo( tmp2 ));		}		
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
