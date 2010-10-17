// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.object.equalTo;	import org.hamcrest.object.instanceOf;
	import org.hamcrest.assertThat;		import mx.collections.ArrayCollection;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * @language 3.0	 * @playerversion 9.0	 * @since 1.0 	 */
	public class ArrayCollectionTest
    {    	private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: NetConnectionLoader = new NetConnectionLoader(															Config.getAMFHostURL(),															Config.getAMFService(),															testData );       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function newArrayCollection():void		{			assertThat(result[0], instanceOf( ArrayCollection ));		}				[Test]		public function mixedArrayCollection():void		{			var tmp2: ArrayCollection = new ArrayCollection();			tmp2.addItem("one");			tmp2.addItem(123);			tmp2.addItem(null);						assertThat(result[1], equalTo( tmp2 ));		}				private static function getData():Array
		{			var tests:Array = [];						var tmp1: ArrayCollection = new ArrayCollection();			tests.push(tmp1);			
			var tmp2: ArrayCollection = new ArrayCollection();
			tmp2.addItem("one");
			tmp2.addItem(123);
			tmp2.addItem(null);
			tests.push(tmp2);
			
			var tmp_2: Array = new Array();
			tmp_2.push(tmp2);
			tmp_2.push(tmp2);
			tests.push(tmp_2);						return tests;
		}		
	}
}
