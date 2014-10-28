package com.inno.golf.services
{
	import com.inno.golf.controllor.ServiceControllor;
	import com.inno.golf.events.ServiceEveConfig;
	import com.inno.golf.events.ServiceEvent;
	import com.inno.golf.model.IGamerModel;
	import com.inno.golf.model.IPlayGolfModel;
	import com.inno.golf.model.ISesstionModel;
	import com.inno.golf.model.ServiceModel;
	import com.inno.golf.vo.GameResultVo;
	import com.inno.golf.vo.SessionVO;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoaderDataFormat;
	
	
	public class PlayGolfService extends HttpService 
	{
		
		private var gamerModel:IGamerModel;
		private var sessModel:ISesstionModel;
		public function PlayGolfService()
		{
			super();
		}
		
		override protected function init():void
		{
			super.init();
			gamerModel = ServiceModel.getInstance();
			sessModel = ServiceModel.getInstance();
			url = gamerModel.getServerUrl();
		}
		
		override protected function  setRequestData():void 
		{
			var _key:String = sessModel.getUserInfo().key;
			var _loginName:String = sessModel.getUserInfo().userVo.loginName;
			var _xml:XML = <element>
							<loginname></loginname>
							<key></key>
							</element>;
			_xml.loginname =  _loginName;
			_xml.key = _key;
			request.data = _xml;
		}
		
		override public function resultHandler():void
		{
			var _dispatcher:IEventDispatcher = ServiceControllor.getInstance();
			_dispatcher.dispatchEvent(new Event(ServiceEveConfig.GAMEDATAFROMSERVERSUCESS));
		}
		
		override public function  faultHandler():void
		{
			var _dispatcher:IEventDispatcher = ServiceControllor.getInstance();
			_dispatcher.dispatchEvent(new Event(ServiceEveConfig.GAMEDATAFROMSERVERFAIL));
		}
		
	}
}