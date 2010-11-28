// Copyright (c) The AcidSWF Project.
// See LICENSE.txt for details.
package com.collab.acidswf
{
	/**
	 * Configuration data.
	 * 
	 * @language 3.0
	 * @playerversion Flash 9.0
	 * @since 1.0 
	 */	
	public class Config
	{
		public static const NAME			: String = "@projectName@";
		public static const VERSION			: String = "@projectVersion@";
		public static const AMF_HOST		: String = "@amfHost@";
		public static const AMF_SERVICE		: String = "@amfService@";
		public static const AMF_PORT		: int = @amfPort@;
        public static const RTMP_HOST		: String = "@rtmpHost@";
        public static const RTMP_PORT		: int = @rtmpPort@;
        public static const RTMP_APP		: String = "@rtmpApp@";
        public static const RTMP_PROTOCOL 	: String = "@rtmpProtocol@";
		
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
		
		/**
		 * @return 
		 */		
		public static function getRTMPHostURL():String
		{
			return RTMP_PROTOCOL + "://" + RTMP_HOST.toString() +
			       ":" + RTMP_PORT.toString() + "/" + RTMP_APP;
		}
		
		/**
		 * @return 
		 */		
		public static function getRTMPApplication():String
		{
			return RTMP_APP;
		}

	}
}