package com.inno.golf.services
{
	import com.inno.golf.conCig.ServicesUrlConfig;
	import com.inno.golf.model.IGamerModel;

	public class RemotGamerService extends JSService implements IGamerModel
	{
		public function RemotGamerService()
		{
			super();
		}
		
		public function getServerUrl():String
		{
			return null;
		}
		
		override protected function init():void
		{
			functionName = ServicesUrlConfig.GOLFURL;
		}
	}
}