package com.inno.golf.services
{
	import com.inno.golf.controllor.ServiceControllor;
	import com.inno.golf.events.ServiceEveConfig;
	import com.inno.golf.model.IGamerModel;
	import com.inno.golf.model.IPlayGolfModel;
	import com.inno.golf.model.ISesstionModel;
	import com.inno.golf.model.ServiceModel;
	import com.inno.golf.util.Debug;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	public class MockUpSerivce extends HttpService 
	{
		public function MockUpSerivce()
		{
		}
		
		
		private var gamerModel:IGamerModel;
		private var sessModel:ISesstionModel;
		
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
			
			var _dispatcher:IEventDispatcher = ServiceControllor.getInstance();
			_dispatcher.dispatchEvent(new Event(ServiceEveConfig.GAMEDATAFROMSERVERSUCESS));
		}
		
		override public function getResult():*
		{
			var _xml:XML = <element>
							<loginname>tes2</loginname>
							<querydate>1987:0807</querydate>
							<code>0</code>
							<errormsg>失败原因</errormsg>
							<totalTimes>5</totalTimes>
							<leftTimes>4</leftTimes>
							<hitResults>100</hitResults>
							</element>;
			var _debugMessage:String = "playResult" + _xml;
			Debug.log(_debugMessage,807060);
			return _xml;
		}
	}
}