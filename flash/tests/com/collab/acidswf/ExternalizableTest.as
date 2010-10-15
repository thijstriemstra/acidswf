// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.ExternalizableClass;
	
	public class ExternalizableTest
	{
        private var tests:Array = [];

        [Ignore]
        [Test]
		public function ExternalizableTest()
		{
			super();
			
			var ext: ExternalizableClass = new ExternalizableClass();
			tests.push(ext);
			
			var tmp_1: Array = new Array();
			tmp_1.push(ext);
			tmp_1.push(ext);
			tests.push(tmp_1);
		}
		
	}
}
