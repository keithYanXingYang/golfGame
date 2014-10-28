package com.inno.golf.cmd
{
	import com.inno.golf.controllor.ServiceControllor;
	import com.inno.golf.events.ServiceEveConfig;
	import com.inno.golf.map.ServiceModelMap;
	import com.inno.golf.model.ISesstionModelSetter;
	import com.inno.golf.services.IService;
	import com.inno.golf.services.RemoteSessionService;
	import com.inno.golf.vo.GamerInfoVo;
	import com.inno.golf.vo.SessionVO;
	import com.inno.golf.vo.UserVO;
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class SessionCmd implements ICmmd
	{
		public function SessionCmd()
		{
		}
		
		public function execute():void
		{
			var model:ISesstionModelSetter;
			var service:IService;
			model = ServiceModelMap.getSessionModelSetter();
			service = new RemoteSessionService();
			
			var data:* = service.getResult();
			var _xml:XML = new XML(data);
			var sesstionVo:SessionVO = new SessionVO();
			var userVo:UserVO = new UserVO();
			var gameInfoVo:GamerInfoVo = new GamerInfoVo();
			
			userVo.loginName = _xml.loginname;
			userVo.querydate = _xml.querydate;
			gameInfoVo.leftTimes = _xml.leftTimes;
			gameInfoVo.totalTimes = _xml.totalTimes;
			
			sesstionVo.userVo = userVo;
			sesstionVo.gameInfoVO = gameInfoVo;
			model.setUserInfo(sesstionVo);
			
			var _dispatcher:IEventDispatcher = ServiceControllor.getInstance();
			_dispatcher.dispatchEvent(new Event(ServiceEveConfig.SESSIONDATACOMPLETE));
		}
	}
}