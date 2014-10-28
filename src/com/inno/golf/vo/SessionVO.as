package com.inno.golf.vo
{
	public class SessionVO
	{
		public function SessionVO()
		{
		}
		
		private var _key:String;
		
		public var userVo:UserVO;
		public var gameInfoVO:GamerInfoVo;

		public function get key():String
		{
			var _numbH:uint = Math.round(Math.random()*1000);
			var _numT:uint = Math.round(Math.random()*10000);
			_key = _numbH + userVo.loginName + "918golf" + userVo.querydate + _numT
			return _key;
		}
	}
}