package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.media.*;
	import flash.utils.Timer;
	
	
	public class StartScreen extends MovieClip{
		private var format:TextFormat = new TextFormat();
		private var format2:TextFormat = new TextFormat();
		private var request1:URLRequest = new URLRequest("sound/retro-coin-.mp3");//add sound .mp3 alleen
		private var clickSound:Sound = new Sound(request1);
		private var aanuit:Boolean = true;
		private var timer:Timer = new Timer(500, 1);
		private var text1:TextField = new TextField();
		private var text2:TextField = new TextField();
		private var text3:TextField = new TextField();
		private var text4:TextField = new TextField();
		private var text5:TextField = new TextField();
		private var back:BackGround = new BackGround();
		
		
		public function StartScreen() {
			//
			clickSound.play();
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, klaar);
			timer.start();
			format.size = 60;
			format2.size = 30;
			text1.defaultTextFormat = format;
			text2.defaultTextFormat = format2;
			text3.defaultTextFormat = format2;
			text4.defaultTextFormat = format2;
			text5.defaultTextFormat = format2;
			text1.text = "press space to start";
			text2.text = "shoot the skippyballs with space";
			text3.text = "!!!don't let them trough!!!";
			text4.text = "you have two shots";
			text5.text = "you get an extra shot for every pop!";
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		private function init(e:Event) {
			stage.addEventListener(KeyboardEvent.KEY_UP, startgame);
			
			addChild(back);
			
			
			text1.textColor = 0xffff00;
			text1.x = 290;
			text1.y = 100;
			text1.width = 500;
			
			addChild(text2);
			text2.textColor = 0x00ff00;
			text2.x = 330;
			text2.y = 200;
			text2.width = 500;
			
			addChild(text3);
			text3.textColor = 0xff0000;
			text3.x = 375;
			text3.y = 250;
			text3.width = 500;
			
			addChild(text4);
			text4.textColor = 0x00ff00;
			text4.x = 410;
			text4.y = 300;
			text4.width = 500;
			
			addChild(text5);
			text5.textColor = 0x00ff00;
			text5.x = 325;
			text5.y = 350;
			text5.width = 500;
			
			
		}
		function klaar(e:TimerEvent):void {
			if (aanuit == true) {
				addChild(text1);
				clickSound.play();
				aanuit = false;
				
			}
			else {
				removeChild(text1);
				aanuit = true;
			}
			timer.start();
			
		}
		private function startgame(e:KeyboardEvent):void {
			if (e.keyCode == 32) {
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE, klaar);
				stage.removeEventListener(KeyboardEvent.KEY_UP, startgame);
				this.dispatchEvent(new Event("start"));
			}
		}
	}
	
}
