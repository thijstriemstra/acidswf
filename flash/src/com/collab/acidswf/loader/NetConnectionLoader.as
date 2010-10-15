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
	
	public class NetConnectionLoader implements IExternalDependencyLoader
	{
		private var token			: ExternalDependencyToken;
		private var connection		: NetConnection;
		private var responder		: Responder;
		private var testData		: *;
		
		protected function securityError(event:SecurityErrorEvent):void
		{
			token.notifyFault( event.text );
		}
 
		protected function netStatusHandler(event:NetStatusEvent):void
		{
			var code:String = event.info.code;
			
			switch (code)
			{
                case "NetConnection.Connect.Success":
                    break;
                    
                case "NetStream.Play.StreamNotFound":
                    break;
                    
                default:
                    token.notifyFault( "netstatuError: " + code );
                    break;
            }
		}
		
		protected function resultHandler(result:*):void
		{
			token.notifyResult( result );
		}
		
		protected function faultHandler(error:Object):void
		{
			token.notifyFault( error.code );
		}
 
		public function retrieveDependency(testClass:Class):ExternalDependencyToken
		{
			load(testData);
			
			return token;
		}
		
		public function load(data:*):void
		{
			connection.call("echo", responder, data);
		}
 
		public function NetConnectionLoader( url:String, data:* )
		{
			testData = data;
			
			token = new ExternalDependencyToken();
 
 			responder = new Responder(resultHandler, faultHandler);
 			
			connection = new NetConnection();
			connection.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
            connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError);
            
            try
            {
				connection.connect(url);
            }
            catch (e:Error)
            {
            	
            }
		}

	}
}
