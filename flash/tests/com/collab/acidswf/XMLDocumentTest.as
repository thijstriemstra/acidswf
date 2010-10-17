// Copyright (c) The AcidSWF Project.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;
	{
		private static function getData():Array
		{	
			var tmp1: XMLDocument = new XMLDocument(<employees>
                    <employee ssn='123-123-1234'>
                        <name first='John' last='Doe'/>
                        <address>
                            <street>11 Main St.</street>
                            <city>San Francisco</city>
                            <state>CA</state>
                            <zip>98765</zip>
                        </address>
                    </employee>
                    <employee ssn='789-789-7890'>
                        <name first='Mary' last='Roe'/>
                        <address>
                            <street>99 Broad St.</street>
                            <city>Newton</city>
                            <state>MA</state>
                            <zip>01234</zip>
                        </address>
                    </employee>
                </employees>);
			tests.push(tmp1);
			
			var tmp2: Array = new Array();
			tmp2.push(tmp1);
			tmp2.push(tmp1);
			tests.push(tmp2);
		}
		
	}
}