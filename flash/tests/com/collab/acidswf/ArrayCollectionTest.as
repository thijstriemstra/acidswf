// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import mx.collections.ArrayCollection;
        import org.flexunit.Assert;

      public class ArrayCollectionTest
      {      	
	      private var tests:Array = [];
	      
	      [Ignore]
	      [Test]
	      public function testSampleIgnore() : void {
	         
	      }
		private function arrayCollectionTest():void
			{
	                        
				var tmp1: ArrayCollection = new ArrayCollection();
				tmp1.addItem("one");
				tmp1.addItem(123);
				tmp1.addItem(null);
				tests.push(tmp1);
				
				var tmp_2: Array = new Array();
				tmp_2.push(tmp1);
				tmp_2.push(tmp1);
				tests.push(tmp_2);
			}
		
	}
}
