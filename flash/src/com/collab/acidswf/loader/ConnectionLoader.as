// Copyright (c) The AcidSWF Project.
// See LICENSE.txt for details.
package com.collab.acidswf.loader
{
	import com.collab.acidswf.Config;
	
	/**
	 * Custom FlexUnit dependency loader for AcidSWF.
	 * 
	 * @language 3.0
	 * @playerversion Flash 9.0
	 * @since 1.0 
	 */
	public class ConnectionLoader extends NetConnectionLoader
	{
		/**
		 * Constructor.
		 *  
		 * @param data
		 */		
		public function ConnectionLoader(data:Array)
		{
			super(Config.getAMFHostURL(), Config.getAMFService(), data, Config.OBJECT_ENCODING);
		}
		
	}
}