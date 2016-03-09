package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	//import flash.text.TextFormat;
	
	
	public class StartScreen extends MovieClip{
		private var format:TextFormat = new TextFormat();
		
		
		
		private var text1:TextField = new TextField;
		//private var format:TextFormat = new TextFormat;
		
		public function StartScreen() {
			format.size = 30;
			text1.defaultTextFormat = format;
			text1.text = "press space to start";
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event) {
			trace(stage);
			stage.addEventListener(KeyboardEvent.KEY_UP, startgame);
			//text1.autoSize = 30;
			//text1.defaultTextFormat = new textFormat("arial, 1000");
			addChild(text1);
			text1.x = 400;
			text1.y = 200;
			text1.width = 300;
			
			
		}
		private function startgame(e:KeyboardEvent):void {
			if (e.keyCode == 32) {
				stage.removeEventListener(KeyboardEvent.KEY_UP, startgame);
				this.dispatchEvent(new Event("start"));
			}
		}
	}
	
}
