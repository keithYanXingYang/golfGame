package com.inno.golf.vo
{
	public class RemoteResult
	{
		public function RemoteResult()
		{
		}
		
		/**
		 *错误代码 
		 */		
		public var errormsg:String;
		
		/**
		 *1表示成功，0代表失败 
		 */		
		public var code:uint;

	}
}