package  com.inno.golf.map
{
	import com.inno.golf.model.IGamerModel;
	import com.inno.golf.model.IGamerModelSetter;
	import com.inno.golf.model.IPlayGolfModel;
	import com.inno.golf.model.IPlayGolfModelSetter;
	import com.inno.golf.model.ISesstionModel;
	import com.inno.golf.model.ISesstionModelSetter;
	import com.inno.golf.model.ServiceModel;

	public class ServiceModelMap
	{
		public function ServiceModelMap()
		{
		}
		
		public static function getSessionModel():ISesstionModel
		{
			return ServiceModel.getInstance();
		}
		
		public static function getSessionModelSetter():ISesstionModelSetter
		{
			return ServiceModel.getInstance();
		}
		
		public static function getPlayGolfModel():IPlayGolfModel
		{
			return ServiceModel.getInstance();
		}
		
		public static function getPlayGolfModelSetter():IPlayGolfModelSetter
		{
			return ServiceModel.getInstance();
		}
		
		public static function getGamerModel():IGamerModel
		{
			return ServiceModel.getInstance();
		}
		
		public static function getGamerModelSetter():IGamerModelSetter
		{
			return ServiceModel.getInstance();
		}
		
}
}