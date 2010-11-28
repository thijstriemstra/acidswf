// Copyright (c) The AcidSWF Project.
// See LICENSE.txt for details.
package com.collab.acidswf.loader
{
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	import org.flexunit.runner.external.ExternalDependencyToken;
	import org.flexunit.runner.external.IExternalDependencyLoader;
	
	/**
	 * Custom FlexUnit dependency loader for AcidSWF.
	 * 
	 * @language 3.0
	 * @playerversion Flash 9.0
	 * @since 1.0 
	 */	
	public class NetConnectionLoader implements IExternalDependencyLoader
	{
		// ====================================================================
		//     PRIVATE VARS
		// ====================================================================
		
		private var service				: String;
		private var hostURL				: String;
		private var connection			: NetConnection;
		private var responder			: Responder;
		private var token				: ExternalDependencyToken;
		private var encoding			: uint;
		private var testData			: Array;
		private var calls				: Array;
		
		/**
		 * Creates a new NetConnectionLoader.
		 *  
		 * @param url
		 * @param service
		 * @param data
		 * @param encoding
		 */		
		public function NetConnectionLoader( url:String, service:String,
											 data:Array, encoding:uint )
		{
			this.hostURL = url;
			this.service = service;
			this.testData = data;
			this.encoding = encoding;
			
			connect();
		}
		
		/**
		 * Setup and create connection to the server.
		 */		
		protected function connect():void
		{
			calls = [];
			
			token = new ExternalDependencyToken();
 			responder = new Responder(resultHandler, faultHandler);
			
			connection = new NetConnection();
			connection.objectEncoding = encoding;
			connection.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
            connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError);
            
            try
            {
				connection.connect( hostURL );
            }
            catch (e:Error)
            {
            	// XXX: report something meaningful
            }
		}
		
		// ====================================================================
		//     PUBLIC METHODS
		// ====================================================================
		
		/**
		 * Retrieves a test class and starts loading the service.
		 * 
		 * @param testClass
		 * @return 
		 */		
		public function retrieveDependency( testClass:Class ):ExternalDependencyToken
		{
			load( testData );
			
			return token;
		}
		
		/**
		 * Make a call to the remote server.
		 * 
		 * @param data List of payloads. Each individual payload will be passed
		 *             as a parameter to the service.
		 */		
		public function load( data:* ):void
		{
			var totalCalls:int = data.length;
			var index:int = 0;
			
			for ( index; index < totalCalls; index++ )
			{
				connection.call(service, responder, data[ index ]);
			}
		}
		
		// ====================================================================
		//     EVENT HANDLERS
		// ====================================================================
		
		/**
		 * Handles security events.
		 * 
		 * @param event
		 */		
		protected function securityError(event:SecurityErrorEvent):void
		{
			token.notifyFault( event.text );
		}
 
		/**
		 * Handles NetStatus events.
		 * 
		 * @param event
		 */ 
		protected function netStatusHandler(event:NetStatusEvent):void
		{
			var code:String = event.info.code;
			
			switch (code)
			{
                case "NetConnection.Connect.Success":
                    break;
                    
                default:
                    token.notifyFault( "\nError connecting: " + code + " (URL: " + hostURL + ")");
                    break;
            }
		}
		
		// ====================================================================
		//     RESULT HANDLERS
		// ====================================================================
		
		/**
		 * Invoked when a successful result is returned from the server.
		 * 
		 * @param result
		 */		
		protected function resultHandler(result:*):void
		{
			calls.push( result );
			
			if (calls.length >= testData.length )
			{
				token.notifyResult( calls );
			}
		}
		
		/**
		 * Invoked when an error occured on the server.
		 * 
		 * @param error
		 */		
		protected function faultHandler(error:Object):void
		{
			token.notifyFault( error.code );
		}
 
	}
}
