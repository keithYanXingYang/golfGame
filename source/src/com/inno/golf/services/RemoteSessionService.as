package src.com.inno.golf.services
{
	import src.com.inno.golf.conCig.ServicesUrlConfig;
	import src.com.inno.golf.vo.SessionVO;
	import src.com.inno.golf.model.ISesstionModel;
	
	public class RemoteSessionService extends JSService implements ISesstionModel
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
			functionName = ServicesUrlConfig.sesstionInfoUrl;
		}
		
		
		public function getUserInfo():SessionVO
		{
			var _sessionVo:SessionVO = new SessionVO();
			
			return _sessionVo;
		}
	}
}