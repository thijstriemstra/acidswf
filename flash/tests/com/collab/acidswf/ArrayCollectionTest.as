// Copyright (c) The AcidSWF Project.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;
	
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.assertThat;
	public class ArrayCollectionTest
    {
		{
			var tmp2: ArrayCollection = new ArrayCollection();
			tmp2.addItem("one");
			tmp2.addItem(123);
			tmp2.addItem(null);
			tests.push(tmp2);
			
			var tmp_2: Array = new Array();
			tmp_2.push(tmp2);
			tmp_2.push(tmp2);
			tests.push(tmp_2);
		}
	}
}