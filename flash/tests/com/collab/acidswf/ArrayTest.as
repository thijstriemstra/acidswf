// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import com.collab.acidswf.loader.NetConnectionLoader;		import org.flexunit.runner.external.IExternalDependencyLoader;	import org.flexunit.runners.Parameterized;	import org.hamcrest.assertThat;	import org.hamcrest.object.equalTo;		[RunWith("org.flexunit.runners.Parameterized")]	/**
	 * @language 3.0	 * @playerversion 9.0	 * @since 1.0 
	 */	
	public class ArrayTest
	{		private var foo					: Parameterized;		 		private static var testData		: Array = getData(); 				public static var gateway		: IExternalDependencyLoader = new NetConnectionLoader(															Config.getAMFHostURL(),															Config.getAMFService(),															testData );		       	[DataPoints(loader="gateway")]		public static var result:Array;				[Test]		public function newArray():void		{			assertThat(result[0], equalTo( new Array() ));		}				[Test]		public function singleElement():void		{			assertThat(result[1], equalTo( [1] ));		}		
		private static function getData():Array		{					var tests:Array = [];				tests.push(new Array());						var tmp1: Array = new Array();			tmp1.push(1);			tests.push(tmp1);			tests.push([1, 2]);			tests.push([1, 2, 3]);			tests.push([1, 2, [1, 2]]);						var tmp2: Array = new Array();			tmp2.push(1);			tmp2[100] = 100;			tests.push(tmp2);						var tmp3: Array = new Array();			tmp3.push(1);			tmp3["today"] = new Date();			tests.push(tmp3);						return tests;		}			}
}
