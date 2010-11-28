// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{	import com.collab.acidswf.loader.ConnectionLoader;		import org.flexunit.runners.Parameterized;	import org.hamcrest.assertThat;	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for the XML type.	 * 	 * @language 3.0	 * @playerversion Flash 9.0	 * @since 1.0 	 */	public class XMLTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: ConnectionLoader = new ConnectionLoader( testData );		       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( XML ));		}		
		private static function getData():Array
		{				var tests:Array = [];				
			XML.ignoreComments = false;
			XML.ignoreProcessingInstructions = false;
			XML.prettyIndent = 0;
			XML.prettyPrinting = false;
			
			var customSettings:Object = XML.settings();
						var empty:XML = new XML();			tests.push( empty );			
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
			tests.push(tmp1);						return tests;
		}
		
	}
}
