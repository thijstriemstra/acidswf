// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;
	
	import mx.collections.ArrayCollection;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.instanceOf;
	import org.hamcrest.object.nullValue;
	import org.hamcrest.text.containsString;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for the ArrayCollection type, part of the Flex SDK.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */
	public class ArrayCollectionTest
    {    	private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: NetConnectionLoader = new NetConnectionLoader(															Config.getAMFHostURL(),															Config.getAMFService(),															testData );       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( ArrayCollection ));		}				[Test]		public function mixed():void		{			var tmp: ArrayCollection = ArrayCollection( result[1] );						assertThat(tmp.getItemAt(0), containsString( "one" ));			assertThat(tmp.getItemAt(1), equalTo( 123 ));			assertThat(tmp.getItemAt(2), nullValue());		}				[Test]		public function collectionOfArrays():void		{			var tmp: Array = result[2];						assertThat(tmp, arrayWithSize( 2 ));			assertThat(tmp[0], instanceOf( ArrayCollection ));			assertThat(tmp[1], instanceOf( ArrayCollection ));		}				private static function getData():Array
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
