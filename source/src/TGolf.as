package
{
	import com.inno.golf.controllor.ServiceControllor;
	import com.inno.golf.events.ServiceEveConfig;
	import com.inno.golf.util.Debug;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class TGolf extends Sprite
	{
		public function TGolf()
		{
			Debug.password = "CDC309AF";
			var controllor:IEventDispatcher =  ServiceControllor.getInstance();
			controllor.dispatchEvent(new Event(ServiceEveConfig.STARTPLAY));
			controllor.dispatchEvent(new Event(ServiceEveConfig.LOADSESSION));
			controllor.dispatchEvent(new Event(ServiceEveConfig.PLAYGOLFRESULT));
		}
	}
}