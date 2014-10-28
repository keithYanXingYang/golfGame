package com.inno.golf.cmd
{
	import flash.external.ExternalInterface;
	
	import com.inno.golf.map.ServiceModelMap;
	import com.inno.golf.model.IGamerModelSetter;
	import com.inno.golf.model.ISesstionModel;
	import com.inno.golf.services.IService;
	import com.inno.golf.services.RemotGamerService;

	public class RemoteGamerCmd implements ICmmd
	{
		
		
		public function RemoteGamerCmd()
		{
		}
		
		public function execute():void
		{
			
			var model:IGamerModelSetter;
			var gamerService:IService; 
			var url:String;
			
			model = ServiceModelMap.getGamerModelSetter()
			gamerService = new RemotGamerService();
			
			url = gamerService.getResult().toString();
			model.setServerUrl(url);
			
			
		}
	}
}