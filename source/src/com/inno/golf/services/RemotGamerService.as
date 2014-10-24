package src.com.inno.golf.services
{
	import src.com.inno.golf.conCig.ServicesUrlConfig;
	import src.com.inno.golf.model.IGamerModel;

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
			functionName = ServicesUrlConfig.golfUrl;
		}
	}
}