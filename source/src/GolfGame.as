package
{
	import flash.display.Sprite;
	import videoPlayer.VideoPlayer;
	import videoPlayer.VideoPlayerS;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Stage;
	
	public class GolfGame extends Sprite
	{
		private var vp:VideoPlayer;
		private var vps:VideoPlayerS;
		private var controlMc:ControlMc;
		private var liliangType:String;
		private var jiqiuType:String;
		private var times100Mc:Times100Mc;
		private var timesMc:TimesMc;
		
		public function GolfGame()
		{
			
			//vps=new VideoPlayerS();
			//addChild(vps)
			vp=new VideoPlayer();
			addChild(vp)
			controlMc=new ControlMc();
			controlMc.x=700;
			controlMc.y=275;
			addChild(controlMc)
			controlMc.visible=false;
			times100Mc=new Times100Mc();
			times100Mc.x=0.5*stage.stageWidth;
			times100Mc.y=0.5*stage.stageHeight;
			addChild(times100Mc)
			times100Mc.en.addEventListener(MouseEvent.CLICK,nextBtnClick)
			times100Mc.visible=false;
			
			timesMc=new TimesMc();
			timesMc.x=0.5*stage.stageWidth;
			timesMc.y=0.5*stage.stageHeight;
			addChild(timesMc)
			timesMc.en.addEventListener(MouseEvent.CLICK,nextBtnClick)
			timesMc.bugan.addEventListener(MouseEvent.CLICK,buganBtnClick)
			timesMc.visible=false;
			init();
		}
		private function init()
		{
			controlMc.visible=true;
			controlMc.jindu.gotoAndPlay(1);
			vp.playVideo("Videos/2.mp4");
			vp.connectStream()
			controlMc.jindu.addEventListener("xiao",xiaoHandler)
			controlMc.jindu.addEventListener("zhong",zhongHandler)
			controlMc.jindu.addEventListener("da",daHandler)
		}
		private function xiaoHandler(e:Event)
		{
			controlMc.qiu.addEventListener(MouseEvent.CLICK,click1Handler)
			liliangType="xiao"
		}
		private function zhongHandler(e:Event)
		{
			controlMc.qiu.addEventListener(MouseEvent.CLICK,click2Handler)
			liliangType="zhong"
		}
		private function daHandler(e:Event)
		{
			controlMc.qiu.addEventListener(MouseEvent.CLICK,click3Handler)
			liliangType="da"
		}
		private function click1Handler(me:MouseEvent)
		{
			
			controlMc.visible=false;
			vp.playVideo("Videos/dalijiqiu.flv");
			vp.addEventListener("over",overHandler)
		}
		private function click2Handler(me:MouseEvent)
		{
			
			controlMc.visible=false;
			vp.playVideo("Videos/zhonglijiqiu.flv");
			vp.addEventListener("over",overHandler)
		}
		private function click3Handler(me:MouseEvent)
		{
			
			controlMc.visible=false;
			vp.playVideo("Videos/xiaolijiqiu.flv");
			vp.addEventListener("over",overHandler)
		}
		private function overHandler(e:Event)
		{
			vp.removeEventListener("over",overHandler)
			switch(liliangType)
			{
				case "xiao":
					vp.playVideo("Videos/dajindaolu.flv");
					jiqiuType="daolu"
					vp.addEventListener("over",overHandler1)
					break;
				case "zhong":
					switch(Math.floor(Math.random()*2))
					{
						case 0:
							vp.playVideo("Videos/dajinguolingwai.flv");
							jiqiuType="guolingwai"
							vp.addEventListener("over",overHandler1)
							break;
						case 1:
							vp.playVideo("Videos/jinshakeng.flv");
							jiqiuType="shakeng"
							vp.addEventListener("over",overHandler1)
							break;	
					}
					break;
				case "da":
					switch(Math.floor(Math.random()*2))
					{
						case 0:
							vp.playVideo("Videos/jinqiu.flv");
							jiqiuType="jinqiu"
							vp.addEventListener("over",overHandler1)
							break;
						case 1:
							vp.playVideo("Videos/jinguoling.flv");
							jiqiuType="guoling"
							vp.addEventListener("over",overHandler1)
							break;
					}
					break;
			}
		}
		private function overHandler1(e:Event)
		{
			vp.removeEventListener("over",overHandler1)
			switch(jiqiuType)
			{
				case "daolu":
					timesMc.times.text="0.8倍"
					timesMc.visible=true;
					break;
				case "guolingwai":
					timesMc.times.text="10倍"
					timesMc.visible=true;
					break;
				case "shakeng":
					timesMc.times.text="2倍"
					timesMc.visible=true;
					break;
				case "jinqiu":
					times100Mc.visible=true;
					times100Mc.times.text="100倍"
					break;
				case "guoling":
					timesMc.times.text="20倍"
					timesMc.visible=true;
					break;
			}
			
			vp.pause();
		}
		private function nextBtnClick(me:MouseEvent)
		{
			times100Mc.visible=false;
			timesMc.visible=false;
			init();
		}
		private function buganBtnClick(me:MouseEvent)
		{
			switch(jiqiuType)
			{
				case "daolu":
					vp.playVideo("Videos/daolushangjiqiu.flv");
					break;
				case "guolingwai":
					vp.playVideo("Videos/guolingwaijiqiu.flv");
					break;
				case "shakeng":
					vp.playVideo("Videos/shakengneijiqiu.flv");
					break;
				case "guoling":
					vp.playVideo("Videos/guolingneijiqiu.flv");
					break;
			}
			timesMc.visible=false;
			vp.addEventListener("over",overHandler2)
		}
		private function overHandler2(e:Event)
		{
			vp.removeEventListener("over",overHandler2)
			vp.playVideo("Videos/jinqiu.flv");
			vp.addEventListener("over",overHandler3)
		}
		private function overHandler3(e:Event)
		{
			vp.removeEventListener("over",overHandler3)
			times100Mc.times.text="结束"
			times100Mc.visible=true;
		}
	}
}