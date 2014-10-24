package src.com.inno.golf.model
{
	import src.com.inno.golf.vo.GameResultVo;
	import src.com.inno.golf.vo.SessionVO;
	
	public class ServiceModel implements ISesstionModel, IGamerModel, IPlayGolfModel
	{
		public function ServiceModel()
		{
		}
		
		public function getUserInfo():SessionVO
		{
			return null;
		}
		
		public function getServerUrl():String
		{
			return null;
		}
		
		public function getGameResultVo():GameResultVo
		{
			return null;
		}
		
		static private var instance:ServiceModel;
		
		static public function getInstance():ServiceModel
		{
			if(instance ==null)
			{
				instance = new ServiceModel();
			}
			return instance;
		}
	}
}