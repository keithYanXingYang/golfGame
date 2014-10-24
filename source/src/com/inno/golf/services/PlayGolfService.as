package src.com.inno.golf.services
{
	import flash.events.Event;
	
	import fl.motion.easing.Sine;
	
	import org.osflash.signals.DeluxeSignal;
	import org.osflash.signals.Signal;
	import org.osflash.signals.events.GenericEvent;
	import org.osflash.signals.natives.NativeSignal;
	
	import src.com.inno.golf.ServiceFactory;
	import src.com.inno.golf.controllor.ServiceControllor;
	import src.com.inno.golf.events.ServiceEveConfig;
	import src.com.inno.golf.events.ServiceEvent;
	import src.com.inno.golf.model.IPlayGolfModel;
	import src.com.inno.golf.vo.GameResultVo;
	
	public class PlayGolfService extends HttpService implements IPlayGolfModel
	{
		public function PlayGolfService()
		{
			super();
		}
		
		public function getGameResultVo():GameResultVo
		{
			return null;
		}
		
		override protected function init():void
		{
			super.init();
			url = ServiceFactory.getGamerModel().getServerUrl();
		}
		
		override public function send():void
		{
			super.send();
			
		}
		
		override public function resultHandler():void
		{
			var sinale :DeluxeSignal = ServiceControllor.getSingalControllor();
			var eve:GenericEvent = new GenericEvent(true);
			sinale.dispatch(eve,getResult());
		}
		
		public function langch():void
		{
			var sinale :DeluxeSignal = ServiceControllor.getSingalControllor();
			var eve:GenericEvent = new GenericEvent(true);
			sinale.dispatch(eve,getResult());
		}
		
	}
}