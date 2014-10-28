package com.inno.golf.services
{
	import com.inno.golf.cmd.ICmmd;
	import com.inno.golf.conCig.ServicesUrlConfig;
	import com.inno.golf.vo.SessionVO;
	
	public class RemoteSessionService extends JSService
	{
		public function RemoteSessionService()
		{
			super();
		}
		
		public function getUserInfo():SessionVO
		{
			return null;
		}
		
		override protected function init():void
		{
			functionName = ServicesUrlConfig.SESSTIONINFOURL;
		}
		
	}
}