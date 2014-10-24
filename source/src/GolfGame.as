package
{
	import flash.display.Sprite;
	
	import org.osflash.signals.DeluxeSignal;
	import org.osflash.signals.events.GenericEvent;
	
	import src.com.inno.golf.controllor.ServiceControllor;
	import src.com.inno.golf.services.PlayGolfService;
	
	public class GolfGame extends Sprite
	{
		public function GolfGame()
		{
			var signale:DeluxeSignal = ServiceControllor.getSingalControllor();
			
			signale.add(singnalHandler);
			
			var se:PlayGolfService = new PlayGolfService();
			se.langch();
		}
		
		
		private function singnalHandler(eve:GenericEvent,dat:Object):void
		{
			trace("dat",dat);
		}
	}
}