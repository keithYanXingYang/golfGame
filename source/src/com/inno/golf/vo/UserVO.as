package src.com.inno.golf.vo
{
	import org.osflash.signals.DeluxeSignal;
	import org.osflash.signals.events.GenericEvent;
	import org.osflash.signals.natives.base.SignalURLLoader;

	public class UserVO
	{
		public function UserVO()
		{
		}
		
		/**
		 * 登陆用户名
		 */		
		public var loginName:String;
		
		
		/**
		 *当前日期 
		 */		
		public var querydate:String;
		
		private var signale:DeluxeSignal;
		private var eve:GenericEvent;
		var eve2:nati
		
	}
}