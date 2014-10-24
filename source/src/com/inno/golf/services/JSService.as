package src.com.inno.golf.services
{
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
		
		public function getResult():Object
		{
			var _result:String = ExternalInterface.call(functionName);
			return _result;
		}
		
	}
}