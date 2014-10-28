package com.inno.golf.cmd
{
	import com.inno.golf.controllor.ServiceControllor;
	import com.inno.golf.events.ServiceEveConfig;
	import com.inno.golf.map.ServiceMap;
	import com.inno.golf.map.ServiceModelMap;
	import com.inno.golf.model.IPlayGolfModelSetter;
	import com.inno.golf.services.IService;
	import com.inno.golf.services.MockUpSerivce;
	import com.inno.golf.services.PlayGolfService;
	import com.inno.golf.vo.GameResultVo;
	import com.inno.golf.vo.GamerInfoVo;
	import com.inno.golf.vo.RemoteResult;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class PlayGolfCmd implements ICmmd
	{
		private var model:IPlayGolfModelSetter;
		private var service:IService;
		private var listener:IEventDispatcher;
		
		public function PlayGolfCmd()
		{
			init();
		}
		
		private function init():void
		{
			model = ServiceModelMap.getPlayGolfModelSetter();
			
			service = ServiceMap.getPlayGolfService();
			listener = ServiceControllor.getInstance();
			
			listener.addEventListener(ServiceEveConfig.GAMEDATAFROMSERVERSUCESS,onResult);
			listener.addEventListener(ServiceEveConfig.GAMEDATAFROMSERVERFAIL,onFault);
		}
		
		public function execute():void
		{
			service.send();
		}
		
		private function onResult(e:Event):void
		{
			var data:* = service.getResult();
			var gameResultVO:GameResultVo = new GameResultVo();
			var gamerInfoVo:GamerInfoVo = new GamerInfoVo();
			var remoteResult:RemoteResult = new RemoteResult();
			var _xml:XML = new XML(data);
			
			gamerInfoVo.totalTimes = _xml.totalTimes;
			gamerInfoVo.leftTimes = _xml.leftTimes;
			remoteResult.code = _xml.code;
			remoteResult.errormsg = _xml.errormsg;
			gameResultVO.hitResult = _xml.hitResults;
			
			gameResultVO.gamerInfoVO = gamerInfoVo;
			gameResultVO.remoteResult = remoteResult;
			model.setGameResultVo(gameResultVO);
			
			if( _xml.code ==1)
			{
				listener.dispatchEvent(new Event(ServiceEveConfig.GAMERESULTNDATAFAIL));
			}else if(_xml.code ==0){
				
				listener.dispatchEvent(new Event(ServiceEveConfig.GAMERESULTNDATACOMPLETE));
			}
				close();		
		}
		
		private function onFault(e:Event):void
		{
			listener.dispatchEvent(new Event(ServiceEveConfig.GAMERESULTNDATAFAIL));
			close();
		}
		
		private function close():void
		{
			listener.removeEventListener(ServiceEveConfig.GAMEDATAFROMSERVERSUCESS,onResult);
			listener.removeEventListener(ServiceEveConfig.GAMEDATAFROMSERVERFAIL,onFault);
		}
			
	}
}