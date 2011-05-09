// Copyright (c) The AcidSWF Project.
// See LICENSE.txt for details.
package com.collab.acidswf.loader
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	/**
	 * Custom FlexUnit dependency loader for AcidSWF.
	 * 
	 * @language 3.0
	 * @playerversion Flash 9.0
	 * @since 1.0 
	 */	
	public class NetConnectionLoader extends EventDispatcher
	{
		// ====================================================================
		//     PRIVATE VARS
		// ====================================================================
		
		private var _service				: String;
		private var _hostURL				: String;
		private var _connection				: NetConnection;
		private var _responder				: Responder;
		private var _encoding				: uint;
		private var _testData				: *;
		private var _result					: *;
		
		// ====================================================================
		//     ACCESSOR
		// ====================================================================
		
		public function get result():*
		{
			return _result;
		}
	
		/**
		 * Creates a new NetConnectionLoader object.
		 *  
		 * @param url
		 * @param service
		 * @param encoding
		 */		
		public function NetConnectionLoader( url:String, service:String,
											 encoding:uint )
		{
			_hostURL = url;
			_service = service;
			_encoding = encoding;
			
			connect();
		}
		
		/**
		 * Setup and create connection to the server.
		 */		
		protected function connect():void
		{
			//calls = [];
			
 			_responder = new Responder( resultHandler, faultHandler );
			
			_connection = new NetConnection();
			_connection.objectEncoding = _encoding;
			_connection.addEventListener( NetStatusEvent.NET_STATUS, netStatusHandler );
            _connection.addEventListener( SecurityErrorEvent.SECURITY_ERROR, securityError );
            
            try
            {
				_connection.connect( _hostURL );
            }
            catch ( e:Error )
            {
            	// XXX: report something meaningful
            }
		}
		
		// ====================================================================
		//     PUBLIC METHODS
		// ====================================================================
		
		/**
		 * Make a call to the remote server.
		 * 
		 * @param data List of payloads. Each individual payload will be passed
		 *             as a parameter to the service.
		 */		
		public function load( data:* ):void
		{
			_testData = data;
			
			_connection.call( _service, _responder, data );
		}
		
		// ====================================================================
		//     EVENT HANDLERS
		// ====================================================================
		
		/**
		 * Handles security events.
		 * 
		 * @param event
		 */		
		protected function securityError( event:SecurityErrorEvent ):void
		{
			storeResult( event.text, "error" );
		}
 
		/**
		 * Handles NetStatus events.
		 * 
		 * @param event
		 */ 
		protected function netStatusHandler( event:NetStatusEvent ):void
		{
			var code:String = event.info.code;
			
			switch ( code )
			{
                case "NetConnection.Connect.Success":
                    break;
                    
                default:
					var msg:String = "Error connecting: " + code + " (URL: " + _hostURL + ")";
					storeResult( msg, "error" );
                    break;
            }
		}
		
		// ====================================================================
		//     RESULT HANDLERS
		// ====================================================================
		
		/**
		 * @param msg
		 * @param type
		 */		
		protected function storeResult( msg:*, type:String="status" ):void
		{
			var evt:Event = new Event( "response" );
			
			_result = msg;
			
			dispatchEvent( evt );
		}
		
		/**
		 * Invoked when a successful result is returned from the server.
		 * 
		 * @param result
		 */		
		protected function resultHandler( result:* ):void
		{
			storeResult( result );
		}
		
		/**
		 * Invoked when an error occured on the server.
		 * 
		 * @param error
		 */		
		protected function faultHandler( error:Object ):void
		{
			storeResult( error.code, "error" );
		}
 
	}
}
