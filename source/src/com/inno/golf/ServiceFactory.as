package src.com.inno.golf
{
	import flash.events.EventDispatcher;
	
	import org.osflash.signals.Signal;
	
	import src.com.inno.golf.controllor.ServiceControllor;
	import src.com.inno.golf.model.IGamerModel;
	import src.com.inno.golf.model.IPlayGolfModel;
	import src.com.inno.golf.model.ISesstionModel;
	import src.com.inno.golf.model.ServiceModel;

	public class ServiceFactory
	{
		public function ServiceFactory()
		{
		}
		
		
		
		public static function getGamerModel():IGamerModel
		{
			return ServiceModel.getInstance();
		}
		
		public static function getSessionModel():ISesstionModel
		{
			return ServiceModel.getInstance();
		}
		
		public static function getPlayGolfModel():IPlayGolfModel
		{
			return ServiceModel.getInstance();
		}
		
		public static function getContronllor():EventDispatcher
		{
			return ServiceControllor.getInstance();
		}
		
		
	
		public static function getSingalControllor():Signal
		{
		
			return new Signal();
		}
	}
}