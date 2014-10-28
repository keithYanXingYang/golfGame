package com.inno.golf.services
{
	import com.inno.golf.util.Debug;
	
	import flash.external.ExternalInterface;

	public class JSService implements IService
	{
		
		protected var functionName:String ;
		
		public function JSService()
		{
			init();
		}
		
		protected function init():void
		{
			functionName = "";
		}
		
		public function send():void
		{
		}
		
		public function resultHandler():void
		{
			
		}
		
		public function faultHandler():void
		{
		}
		
		public function getResult():*
		{
			var _result:* = ExternalInterface.call(functionName);
			var _debugMessage:String = functionName + _result;
			Debug.log(_debugMessage,0x8080ff);
			return _result;
			
		}
		
	}
}