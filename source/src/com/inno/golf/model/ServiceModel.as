package com.inno.golf.model
{
	import com.inno.golf.vo.GameResultVo;
	import com.inno.golf.vo.SessionVO;
	import com.inno.golf.vo.UserVO;
	
	public class ServiceModel implements IGamerModel, IGamerModelSetter, IPlayGolfModel, IPlayGolfModelSetter, ISesstionModel, ISesstionModelSetter
	{
		public function ServiceModel()
		{
		}
		
		private var serverUrl:String;
		public function setServerUrl(value:String):void
		{
			serverUrl = value;
		}
		
		public function getServerUrl():String
		{
			return serverUrl;
		}
		
		private var gamerVo:GameResultVo;
		public function getGameResultVo():GameResultVo
		{
			return gamerVo;
		}
		
		
		public function setGameResultVo(value:GameResultVo):void
		{
			gamerVo = value;
		}
		
		private var userInfo:SessionVO;
		public function getUserInfo():SessionVO
		{
			return userInfo;
		}
		
		public function setUserInfo(value:SessionVO):void
		{
			userInfo = value;
		}
		
		
		static private var instance:ServiceModel;
		static public function getInstance():ServiceModel
		{
			if(instance == null)
			{
				instance = new ServiceModel();
			}
			return instance;
		}
		
	}
}