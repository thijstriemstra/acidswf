// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import com.collab.acidswf.loader.ConnectionLoader;		import org.flexunit.runners.Parameterized;	import org.hamcrest.assertThat;	import org.hamcrest.object.equalTo;	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for the Number type.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */	public class NumberTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: ConnectionLoader = new ConnectionLoader( testData );		       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], equalTo( 0 ));		}				[Test]		public function positive():void		{			assertThat(result[1], equalTo( 1 ));			assertThat(result[3], equalTo( 256 ));			assertThat(result[5], equalTo( 65536 ));			assertThat(result[10], equalTo( 0.0 ));			assertThat(result[11], equalTo( 1.5 ));		}				[Test]		public function negative():void		{			assertThat(result[2], equalTo( -1 ));			assertThat(result[4], equalTo( -256 ));			assertThat(result[6], equalTo( -65536 ));			assertThat(result[12], equalTo( -1.5 ));					}				[Test]		public function isNaN():void		{			assertThat(result[7], equalTo( Number.NaN ));		}				[Test]		public function max_value():void		{			assertThat(result[8], equalTo( Number.MAX_VALUE ));		}				[Test]		public function min_value():void		{			assertThat(result[9], equalTo( Number.MIN_VALUE ));		}				[Test]		public function uint_value():void		{			assertThat(result[13], instanceOf( uint ));			assertThat(result[13], equalTo( uint( 0x000000 )));		}		
		private static function getData():Array
		{			var tests:Array = [];			
			
			tests.push(0);
			tests.push(1);
			tests.push(-1);
			tests.push(256);
			tests.push(-256);
			tests.push(65536);
			tests.push(-65536);
			tests.push(Number.NaN);
			//tests.push(Number.NEGATIVE_INFINITY);
			//tests.push(Number.POSITIVE_INFINITY);
			tests.push(Number.MAX_VALUE);
			tests.push(Number.MIN_VALUE);
			tests.push(0.0);
			tests.push(1.5);
			tests.push(-1.5);
			tests.push(uint(0x000000));						return tests;
		}
		
	}
}
