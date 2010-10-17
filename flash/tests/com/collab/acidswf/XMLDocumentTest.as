// Copyright (c) The AcidSWF Project.// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.NetConnectionLoader;		import flash.xml.XMLDocument;		import org.flexunit.runners.Parameterized;	import org.hamcrest.assertThat;	import org.hamcrest.object.instanceOf;		[RunWith("org.flexunit.runners.Parameterized")]	/**	 * Tests for the XMLDocument type.	 * 	 * @language 3.0	 * @playerversion 9.0	 * @since 1.0 	 */	public class XMLDocumentTest
	{		private var foo					: Parameterized; 		private static var testData		: Array = getData();		public static var gateway		: NetConnectionLoader = new NetConnectionLoader(															Config.getAMFHostURL(),															Config.getAMFService(),															testData );       	[DataPoints(loader="gateway")]		public static var result		: Array;				[Test]		public function create():void		{			assertThat(result[0], instanceOf( XMLDocument ));		}				[Test]		public function simple():void		{			// TODO			assertThat(result[1], instanceOf( XMLDocument ));		}				[Test]		public function array():void		{			// TODO			assertThat(result[2], instanceOf( Array ));		}		
		private static function getData():Array
		{				var tests:Array = [];						var tmp0: XMLDocument = new XMLDocument();			tests.push( tmp0 );			
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
			tests.push(tmp2);						return tests;
		}
		
	}
}
