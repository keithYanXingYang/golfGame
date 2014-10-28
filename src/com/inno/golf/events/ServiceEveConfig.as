package com.inno.golf.events
{
	public class ServiceEveConfig
	{
		public function ServiceEveConfig()
		{
		}
		
		
		
		/**
		 *向后台请求抽奖，点击抽奖后使用 
		 */		
		static public const PLAYGOLFRESULT:String = "playgolf";
		static public const LOADURLSUCESS:String = "loadUrlSucess";
		static public const USERSESSION:String = "userSession";
		
		/**
		 * 开始加载初始数据，返回后台地址等信息 
		 */		
		static public const STARTPLAY:String = "startPlayGolf";
		
		
		/**
		 *开始加载用户初始数据，返回用户信息 
		 */		
		static public const LOADSESSION:String = "loadSession";
		
		
		/**
		 *成功获取用户数据信息 
		 */		
		static public const SESSIONDATACOMPLETE:String = "sessiondatacomplete";
		
		
		/**
		 *抽奖从后台获取数据成功
		 */		
		static public const GAMEDATAFROMSERVERSUCESS:String = "gamedatafromserversucess";
		
		/**
		 *抽奖从后台获取数据失败
		 *  
		 */		
		static public const GAMEDATAFROMSERVERFAIL:String = "gamedatafromserverfail";
		
		/**
		 * 抽奖数据绑定完成
		 */		
		static public const GAMERESULTNDATACOMPLETE:String = "sessionDataComplete";
		
		/**
		 *抽奖数据绑定失败
		 */		
		static public const GAMERESULTNDATAFAIL:String = "sessionDataFail";
		
	}
}