package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class GameOverScreen extends MovieClip {
		private var format:TextFormat = new TextFormat();
		private var formatbig:TextFormat = new TextFormat();
		private var text1:TextField = new TextField;
		private var text2:TextField = new TextField;
		private var textscore:TextField = new TextField;
		public function GameOverScreen() {
			this.addEventListener(Event.ADDED_TO_STAGE, init)
			
			
			
		}
		private function init(e:Event) {
			stage.addEventListener(KeyboardEvent.KEY_UP, terug);
			format.size = 30;
			formatbig.size = 60;
			text1.defaultTextFormat = formatbig;
			text2.defaultTextFormat = format;
			textscore.defaultTextFormat = format;
			text1.text = "game over";
			text2.text = "press space to go back to start";
			textscore.text = "your score is: ";
			
			addChild(text1);
			text1.x = 360;
			text1.y = 70;
			text1.width = 300
			
			addChild(textscore);
			textscore.x = 380;
			textscore.y = 150;
			textscore.width = 500
			
			addChild(text2);
			text2.x = 310;
			text2.y = 440;
			text2.width = 500
		
		}
		private function terug(k:KeyboardEvent):void {
			if (k.keyCode == 32) {
				stage.removeEventListener(KeyboardEvent.KEY_UP, terug);
				this.dispatchEvent(new Event("terug"));
			}
		}

	}
	
}