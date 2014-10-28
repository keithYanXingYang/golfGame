package com.inno.golf.events
{
	import flash.events.Event;
	
	public class ServiceEvent extends Event
	{
		public function ServiceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}