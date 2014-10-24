package src.com.inno.golf.controllor
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import org.osflash.signals.DeluxeSignal;
	import org.osflash.signals.events.GenericEvent;
	
	public class ServiceControllor extends EventDispatcher
	{
		public function ServiceControllor(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		
		static private var instance:EventDispatcher;
		static public function getInstance():EventDispatcher
		{
			if(instance == null)
			{
				instance = new EventDispatcher();
			}
			return instance;
		}
		
		static public function getSingalControllor():DeluxeSignal
		{
			var signal :DeluxeSignal = new DeluxeSignal();
			return signal;
		}
	}
}