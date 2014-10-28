package videoPlayer
{
	import flash.events.NetStatusEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.display.Sprite;
	import flash.events.Event;

	public class VideoPlayer extends Sprite{
		
		private var myNc:NetConnection;
		private var client:Object;
		private var videoStream:NetStream;
		private var video:Video;
		private var videoURL:String;

		public function VideoPlayer() {
			// constructor code
			init();
		}
		private function init()
		{
			myNc = new NetConnection();
			myNc.connect(null);
			client = new Object();
			videoStream =new NetStream(myNc);
			video = new Video();
			video.width = 615;
			video.height = 435;
			this.addChild(video)
			video.attachNetStream(videoStream);
		}
		public function playVideo(e:String)
		{
			videoStream.play(e);
			videoStream.client=client;
			videoStream.addEventListener(NetStatusEvent.NET_STATUS,netStatusHandler);
		}
		private function netStatusHandler(event:NetStatusEvent):void
		{ 
			switch (event.info.code) 
			{
				case "NetConnection.Connect.Success" :
				break;  
				case "NetStream.Play.StreamNotFound" :   
				trace("Unable to locate video: " + videoURL);   
				break;  
				case "NetStream.Buffer.Full" :   
				break;  
				case  "NetStream.Play.Stop" :
					dispatchEvent(new Event("over"))
				break; 
			}
		}
		public function connectStream():void
		{
			videoStream.pause();
			videoStream.seek(0);
			videoStream.resume();
		}
		public function pause()
		{
			videoStream.pause();
		}

	}
	
}
