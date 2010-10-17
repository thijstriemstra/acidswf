// Copyright (c) The AcidSWF Project.
// See LICENSE.txt for details.
package com.collab.acidswf.loader
{
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	import flash.net.ObjectEncoding;
	import flash.net.Responder;
	
	import org.flexunit.runner.external.ExternalDependencyToken;
	import org.flexunit.runner.external.IExternalDependencyLoader;
	
	/**
	 * @language 3.0
	 * @playerversion 9.0
	 * @since 1.0 
	 */	
	public class NetConnectionLoader implements IExternalDependencyLoader
	{
		private var service				: String;
		private var hostURL				: String;
		private var connection			: NetConnection;
		private var responder			: Responder;
		private var token				: ExternalDependencyToken;
		private var testData			: Array;
		private var calls				: Array;
		
		/**
		 * Creates a new NetConnectionLoader.
		 *  
		 * @param url
		 * @param service
		 * @param data
		 */		
		public function NetConnectionLoader( url:String, service:String,
											 data:Array )
		{
			this.hostURL = url;
			this.service = service;
			this.testData = data;
			
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
			connection.objectEncoding = ObjectEncoding.AMF3;
			
			connection.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
            connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError);
            
            try
            {
				connection.connect( hostURL );
            }
            catch (e:Error)
            {
            	// XXX: do something meaningful
            }
		}
		
		/**
		 * @param testClass
		 * @return 
		 */		
		public function retrieveDependency( testClass:Class ):ExternalDependencyToken
		{
			load( testData );
			
			return token;
		}
		
		/**
		 * @param data
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
		
		/**
		 * @param event
		 */		
		protected function securityError(event:SecurityErrorEvent):void
		{
			token.notifyFault( event.text );
		}
 
		/**
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
		
		/**
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
		 * @param error
		 */		
		protected function faultHandler(error:Object):void
		{
			token.notifyFault( error.code );
		}
 
	}
}
