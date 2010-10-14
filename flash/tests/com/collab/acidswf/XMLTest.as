// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	public class XMLTest
	{
                private var tests:Array = [];

                [Ignore]
                [Test]
		public function xmlTest():void
		{			
			XML.ignoreComments = false;
			XML.ignoreProcessingInstructions = false;
			XML.prettyIndent = 0;
			XML.prettyPrinting = false;
			
			var customSettings:Object = XML.settings();
			
			var tmpXML:XML =
                <employees>
                    <employee ssn="123-123-1234">
                        <name first="John" last="Doe"/>
                        <address>
                            <street>11 Main St.</street>
                            <city>San Francisco</city>
                            <state>CA</state>
                            <zip>98765</zip>
                        </address>
                    </employee>
                    <employee ssn="789-789-7890">
                        <name first="Mary" last="Roe"/>
                        <address>
                            <street>99 Broad St.</street>
                            <city>Newton</city>
                            <state>MA</state>
                            <zip>01234</zip>
                        </address>
                    </employee>
                </employees>;
            tests.push(tmpXML);
            
            var tmp1: Array = new Array();
			tmp1.push(tmpXML);
			tmp1.push(tmpXML);
			tests.push(tmp1);
		}
		
	}
}
