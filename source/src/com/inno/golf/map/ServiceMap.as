package com.inno.golf.map
{
	import com.inno.golf.cmd.PlayGolfCmd;
	import com.inno.golf.services.IService;
	import com.inno.golf.services.MockUpSerivce;
	import com.inno.golf.services.PlayGolfService;

	public class ServiceMap
	{
		public function ServiceMap()
		{
		}
		
		public static function getPlayGolfService():IService
		{
			var _service:IService = new PlayGolfService();
			//var _service:IService = new MockUpSerivce();
			return _service;
		}
	}
}