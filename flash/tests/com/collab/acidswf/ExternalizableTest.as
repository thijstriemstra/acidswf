// Copyright (c) The AcidSWF Project.
package com.collab.acidswf
{
	import com.collab.acidswf.data.ExternalizableClass;
	import com.collab.acidswf.loader.NetConnectionLoader;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.instanceOf;
	public class ExternalizableTest
	{
		private static function getData():Array
		{
			var tests:Array = [];
			
			var ext: ExternalizableClass = new ExternalizableClass();
			tests.push(ext);
			
			var tmp_1: Array = new Array();
			tmp_1.push(ext);
			tmp_1.push(ext);
			tests.push(tmp_1);
		}
		
	}
}