package src.com.inno.golf.services
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;

	public class HttpService implements IService
	{
		public function HttpService()
		{
			init();
		}
		
		
		protected var url:String ;
		
		protected var request:URLRequest;
		protected var loader:URLLoader
		
		protected function init():void
		{
			url = "";
			request = new URLRequest();
			loader = new URLLoader();
			
			loader.addEventListener(Event.COMPLETE,onResultHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR,onFaultHandler);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onFaultHandler);
		}
		
		
		
		public function send():void
		{
			request.url = url;

			loader.load(request);
		}
		
		public function resultHandler():void
		{
			
		}
		
		protected function onResultHandler(e:Event):void
		{
			resultHandler();
		}
		
		protected function onFaultHandler(e:Event):void
		{
			faultHandler();
		}
		
		public function faultHandler():void
		{
		}
		
		
		public function getResult():Object
		{
			return loader.data;
		}
	}
}