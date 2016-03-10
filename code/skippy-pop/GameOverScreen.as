package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	public class GameOverScreen extends MovieClip {
		private var format:TextFormat = new TextFormat();
		private var formatbig:TextFormat = new TextFormat();
		private var text1:TextField = new TextField;
		private var text2:TextField = new TextField;
		private var textscore:TextField = new TextField;
		private var texthighscore:TextField = new TextField;
		private var zwart:Zwart = new Zwart;
		private var timer:Timer = new Timer(4000, 1);
		private var naarstart:Timer = new Timer(10000, 1);
		private var spatie:Boolean = false;
		public function GameOverScreen() {
			this.addEventListener(Event.ADDED_TO_STAGE, init)
			
			
			
		}
		private function init(e:Event) {
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, klaar);
			naarstart.addEventListener(TimerEvent.TIMER_COMPLETE, go);
			stage.addEventListener(KeyboardEvent.KEY_UP, terug);
			format.size = 30;
			formatbig.size = 60;
			text1.defaultTextFormat = formatbig;
			text2.defaultTextFormat = format;
			textscore.defaultTextFormat = format;
			texthighscore.defaultTextFormat = format;
			text1.text = "game over";
			text2.text = "press space to go back to start";
			textscore.text = "your score is: " + GameScreen.score;
			texthighscore.text = "your highscore is: " + GameScreen.highscore;
			
			timer.start();
			addChild(zwart);
			
			addChild(text1);
			text1.x = 370;
			text1.y = 70;
			text1.width = 300
			text1.textColor = 0xff0000;
			
			addChild(textscore);
			textscore.x = 400;
			textscore.y = 200;
			textscore.width = 500
			textscore.textColor = 0xffffff;
			
			addChild(texthighscore);
			texthighscore.x = 380;
			texthighscore.y = 250;
			texthighscore.width = 500
			texthighscore.textColor = 0xffffff;
			
			addChild(text2);
			text2.x = 330;
			text2.y = 440;
			text2.width = 500
			text2.textColor = 0xffffff;
		
		}
		private function klaar(e:TimerEvent) {
			spatie = true;
			naarstart.start();
			
		}
		private function go(e:TimerEvent) {
			GameScreen.score = 0;
			stage.removeEventListener(KeyboardEvent.KEY_UP, terug);
			naarstart.removeEventListener(TimerEvent.TIMER_COMPLETE, go);
			this.dispatchEvent(new Event("terug"));
		}
		private function terug(k:KeyboardEvent):void {
			if (k.keyCode == 32 && spatie == true) {
				GameScreen.score = 0;
				naarstart.stop();
				naarstart.removeEventListener(TimerEvent.TIMER_COMPLETE, go);
				stage.removeEventListener(KeyboardEvent.KEY_UP, terug);
				this.dispatchEvent(new Event("terug"));
			}
		}

	}
	
}