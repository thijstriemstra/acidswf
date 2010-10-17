// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;		import org.flexunit.runners.Parameterized;	import org.hamcrest.assertThat;	import org.hamcrest.object.equalTo;	import org.hamcrest.object.instanceOf;		import mx.utils.ObjectProxy;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * @language 3.0	 * @playerversion 9.0	 * @since 1.0 	 */
	public class ObjectProxyTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: NetConnectionLoader = new NetConnectionLoader(															Config.getAMFHostURL(),															Config.getAMFService(),															testData );       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( ObjectProxy ));		}		
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
