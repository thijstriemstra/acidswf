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
		public static const HOST			: String = "@host@";
		public static const URL				: String = "@url@";
		public static const SERVICE			: String = "@service@";
		public static const PORT			: int    = @port@;
        public static const OBJECT_ENCODING	: uint   = @objectEncoding@;
		
		/**
		 * Version, 'AcidSWF 1.0' for example.
		 * 
		 * @return 
		 */		
		public static function getVersion():String
		{
			return NAME + " " + VERSION;
		}
		
		/**
		 * Host, 'rtmp://localhost' for example.
		 * 
		 * @return 
		 */		
		public static function getHost():String
		{
			return HOST;
		}
		
		/**
		 * The port, 8000 or 1935 for example.
		 * 
		 * @return 
		 */		
		public static function getPort():int
		{
			return PORT;
		}
		
		/**
		 * Full URL, 'rtmp://localhost:1935/acidswf' for example.
		 * 
		 * @return 
		 */		
		public static function getURL():String
		{
			return URL;
		}
		
		/**
		 * Service name.
		 * 
		 * @return 
		 */		
		public static function getService():String
		{
			return SERVICE;
		}
		
	}
}