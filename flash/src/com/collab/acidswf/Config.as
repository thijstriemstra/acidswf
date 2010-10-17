// Copyright (c) The AcidSWF Project.
// See LICENSE.txt for details.
package com.collab.acidswf
{
	/**
	 * @language 3.0
	 * @playerversion 9.0
	 * @since 1.0 
	 */	
	public class Config
	{
		public static const NAME		: String = "AcidSWF";
		public static const VERSION		: String = "1.0";
		public static const AMF_HOST	: String = "http://localhost";
		public static const AMF_SERVICE	: String = "echo";
		public static const AMF_PORT	: int = 8000;
		
		/**
		 * @return 
		 */		
		public static function getVersion():String
		{
			return NAME + " " + VERSION;
		}
		
		/**
		 * @return 
		 */		
		public static function getAMFHostURL():String
		{
			return AMF_HOST + ":" + AMF_PORT.toString();
		}
		
		/**
		 * @return 
		 */		
		public static function getAMFService():String
		{
			return AMF_SERVICE;
		}

	}
}