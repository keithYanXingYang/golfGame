package com.inno.golf.controllor
{
	import com.inno.golf.cmd.ICmmd;
	import com.inno.golf.cmd.PlayGolfCmd;
	import com.inno.golf.cmd.RemoteGamerCmd;
	import com.inno.golf.cmd.SessionCmd;
	import com.inno.golf.events.ServiceEveConfig;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ServiceControllor extends EventDispatcher
	{
		public function ServiceControllor(target:IEventDispatcher=null)
		{
			super(target);
			init();
		}
		
		private function init():void
		{
			this.addEventListener(ServiceEveConfig.STARTPLAY,laungchHandler);
			this.addEventListener(ServiceEveConfig.LOADSESSION,laungchHandler);
			this.addEventListener(ServiceEveConfig.PLAYGOLFRESULT,laungchHandler);
		}
		
		private function laungchHandler(e:Event):void
		{
			var cmd:ICmmd;
			cmd = new RemoteGamerCmd();
			switch (e.type)
			{
				case ServiceEveConfig.STARTPLAY:
					cmd = new RemoteGamerCmd();
					break;
				case ServiceEveConfig.LOADSESSION:
					cmd = new SessionCmd();
					break;
				case ServiceEveConfig.PLAYGOLFRESULT:
					cmd = new PlayGolfCmd();
					break;
			}
			cmd.execute();
		}
		
		static private var instance:EventDispatcher;
		static public function getInstance():EventDispatcher
		{
			if(instance == null)
			{
				instance = new ServiceControllor();
			}
			return instance;
		}
		
	}
}