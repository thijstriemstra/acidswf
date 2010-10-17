// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import com.collab.acidswf.loader.NetConnectionLoader;		import org.flexunit.runner.external.IExternalDependencyLoader;	import org.flexunit.runners.Parameterized;	import org.hamcrest.object.equalTo;	import org.hamcrest.assertThat;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * @language 3.0	 * @playerversion 9.0	 * @since 1.0 	 */
	public class BooleanTest
	{		private var foo					: Parameterized;		 		private static var testData		: Array = getData(); 				public static var gateway		: IExternalDependencyLoader = new NetConnectionLoader(															Config.getAMFHostURL(),															Config.getAMFService(),															testData );		       	[DataPoints(loader="gateway")]		public static var result:Array;				[Test]		public function booleanTrue():void		{			assertThat(result[0], equalTo( true ));		}				[Test]		public function booleanFalse():void		{			assertThat(result[1], equalTo( false ));		}		
		private static function getData():Array
		{
			var tests:Array = [];				
			tests.push(true);
			tests.push(false);
						return tests;		}
		
	}
}
