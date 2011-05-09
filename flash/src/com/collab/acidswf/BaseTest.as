// Copyright (c) The AcidSWF Project.
// See LICENSE.txt for details.
package com.collab.acidswf
{
	import com.collab.acidswf.loader.ConnectionLoader;
	
	import org.flexunit.asserts.fail;
	import org.flexunit.async.Async;

	/**
	 * @language 3.0
	 * @playerversion Flash 9.0
	 * @since 1.0
	 */	
	public class BaseTest
	{
		/**
		 * 
		 */		
		public static var loader		: ConnectionLoader;
		
		/**
		 * 
		 */		
		protected function setup():void
		{
			loader = new ConnectionLoader();
		}
		
		/**
		 * 
		 */		
		protected function teardown():void
		{
			loader = null;
		}
		
		/**
		 * @param passThroughData
		 */		
		protected function handleTimeout( passThroughData:* ):void
		{
			fail( "Timeout reached" );		
		}
		
		/**
		 * @param handler
		 * @param data
		 * @param timeout
		 */		
		protected function setupCall( handler:Function, data:*,
									  timeout:Number=500 ):void
		{
			loader.addEventListener( "response", 
				Async.asyncHandler( this, handler, timeout, data, handleTimeout ),
				false, 0, true );
			
			loader.load( data );
		}
		
	}
}