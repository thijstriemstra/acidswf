// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.data.RemoteClass;
	import com.collab.acidswf.loader.ConnectionLoader;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Remote class tests.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */	public class RemoteClassTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: ConnectionLoader = new ConnectionLoader( testData );		       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( RemoteClass ));		}				[Test]		[Ignore]		public function simple():void		{			var remote: RemoteClass = new RemoteClass();			remote.attribute1 = "one";			remote.attribute2 = 2;						assertThat(result[1], equalTo( remote ));		}				[Test]		[Ignore]		public function array():void		{			var tmp1: Array = new Array();			var remote1: RemoteClass = new RemoteClass();			remote1.attribute1 = "one";			remote1.attribute2 = 1;						var remote2: RemoteClass = new RemoteClass();			remote2.attribute1 = "two";			remote2.attribute2 = 2;			tmp1.push(remote2);						assertThat(result[2], equalTo( tmp1 ));		}						[Test]		[Ignore]		public function complex():void		{			var remote3: RemoteClass = new RemoteClass();			remote3.attribute1 = "three";			remote3.attribute2 = 1234567890;						var remote4: RemoteClass = new RemoteClass();			remote4.attribute1 = "four";			remote4.attribute2 = 1185292800000;						assertThat(result[3], equalTo( remote3 ));			assertThat(result[4], equalTo( remote4 ));		}		
        private static function getData():Array
		{			var tests:Array = [];						var new_remote: RemoteClass = new RemoteClass();			tests.push(new_remote);			
			var remote: RemoteClass = new RemoteClass();
			remote.attribute1 = "one";
			remote.attribute2 = 2;
			tests.push(remote);
			
			var tmp1: Array = new Array();
			var remote1: RemoteClass = new RemoteClass();
			remote1.attribute1 = "one";
			remote1.attribute2 = 1;
			tmp1.push(remote1);
			
			var remote2: RemoteClass = new RemoteClass();
			remote2.attribute1 = "two";
			remote2.attribute2 = 2;
			tmp1.push(remote2);
			tests.push(tmp1);
			
			var remote3: RemoteClass = new RemoteClass();
			remote3.attribute1 = "three";
			remote3.attribute2 = 1234567890;
			tests.push(remote3);
			
			var remote4: RemoteClass = new RemoteClass();
			remote4.attribute1 = "four";
			remote4.attribute2 = 1185292800000;
			tests.push(remote4);						return tests;
		}
		
	}
}
