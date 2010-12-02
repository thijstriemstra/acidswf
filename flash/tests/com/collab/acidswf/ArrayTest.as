// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import com.collab.acidswf.loader.ConnectionLoader;		import org.flexunit.runners.Parameterized;	import org.hamcrest.assertThat;	import org.hamcrest.collection.array;	import org.hamcrest.collection.arrayWithSize;	import org.hamcrest.collection.emptyArray;	import org.hamcrest.collection.hasItem;	import org.hamcrest.object.equalTo;	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Test for the Array type.	 * 
	 * @language 3.0	 * @playerversion 9.0	 * @since 1.0 
	 */	
	public class ArrayTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: ConnectionLoader = new ConnectionLoader( testData );		       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function newArray():void		{			assertThat(result[0], instanceOf( Array ));			assertThat(result[0], emptyArray());		}				[Test]		public function singleElement():void		{			assertThat(result[1], arrayWithSize( 1 ));			assertThat(result[1], hasItem( equalTo( 1 )));		}				[Test]		public function multipleElements():void		{			assertThat(result[2], arrayWithSize( 2 ));			assertThat(result[3], arrayWithSize( 3 ));						assertThat(result[2], array( 1, 2 ));			assertThat(result[3], array( 1, 2, 3 ));		}				[Test]		public function nestedElements():void		{			assertThat(result[4], arrayWithSize( 3 ));			assertThat(result[4], equalTo( [1, 2, [1, 2]] ));		}				[Test]		public function emptyElements():void		{			var tmp: Array = new Array();			tmp.push(1);			tmp[100] = 100;			assertThat(result[5], equalTo( tmp ));		}				[Test]		[Ignore]		public function namedElement():void		{			assertThat(result[6], arrayWithSize( 2 ));		}		
		private static function getData():Array		{					var tests:Array = [];				tests.push(new Array());						var tmp1: Array = new Array();			tmp1.push(1);			tests.push(tmp1);			tests.push([1, 2]);			tests.push([1, 2, 3]);			tests.push([1, 2, [1, 2]]);						var tmp2: Array = new Array();			tmp2.push(1);			tmp2[100] = 100;			tests.push(tmp2);						var tmp3: Array = new Array();			tmp3.push(1);			tmp3["today"] = new Date();			tests.push(tmp3);						return tests;		}			}
}
