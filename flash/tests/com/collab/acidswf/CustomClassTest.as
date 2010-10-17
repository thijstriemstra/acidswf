// Copyright (c) The AcidSWF Project.
package com.collab.acidswf
{
	import com.collab.acidswf.data.EchoClass;
	import com.collab.acidswf.loader.NetConnectionLoader;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	public class CustomClassTest
	{
		private static function getData():Array
		{
			var tmp1: EchoClass = new EchoClass();
			tmp1.attr1 = "one";
			tmp1.attr2 = 1;
			tests.push(tmp1);
			
			var tmp2: Array = new Array();
			tmp2.push(tmp1);
			tmp2.push(tmp1);
			tests.push(tmp2);
		}
		
	}
}