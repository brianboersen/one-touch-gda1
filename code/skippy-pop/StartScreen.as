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
		private var format3:TextFormat = new TextFormat();
		private var format2:TextFormat = new TextFormat();
		private var request1:URLRequest = new URLRequest("sound/retro-coin-.mp3");//add sound .mp3 alleen
		private var clickSound:Sound = new Sound(request1);
		private var aanuit:Boolean = true;
		private var timer:Timer = new Timer(500, 1);
		private var text1:TextField = new TextField();
		private var textSkippyPop:TextField = new TextField();
		private var text2:TextField = new TextField();
		private var text3:TextField = new TextField();
		private var text4:TextField = new TextField();
		private var text5:TextField = new TextField();
		private var unlock1:TextField = new TextField();
		private var unlock2:TextField = new TextField();
		private var unlock3:TextField = new TextField();
		private var unlock4:TextField = new TextField();
		private var back:BackGround = new BackGround();
		private var timer2:Timer = new Timer(300, 1);
		
		
		
		
		public function StartScreen() {
			//
			clickSound.play();
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, klaar);
			timer2.addEventListener(TimerEvent.TIMER_COMPLETE, tutorialtimer);
			timer.start();
			format.size = 60;
			format3.size = 80;
			format2.size = 30;
			text1.defaultTextFormat = format;
			textSkippyPop.defaultTextFormat = format3;
			text2.defaultTextFormat = format2;
			text3.defaultTextFormat = format2;
			text4.defaultTextFormat = format2;
			text5.defaultTextFormat = format2;
			unlock1.defaultTextFormat = format2;
			unlock2.defaultTextFormat = format2;
			unlock3.defaultTextFormat = format2;
			unlock4.defaultTextFormat = format2;
			text1.text = "press space to start";
			textSkippyPop.text = "skippy pop";
			text2.text = "shoot the skippyballs with space";
			text3.text = "!!!don't let them through!!!";
			text4.text = "you have one shot";
			text5.text = "you get an extra shot for every kill!";
			unlock1.text = "get a score of 100: 2x laserwith";
			unlock2.text = "get a score of 400: 3x laserwith";
			unlock3.text = "get a score of 700: 4x laserwith";
			unlock4.text = "get a score of 1000: 6x laserwith";
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		private function init(e:Event) {
			stage.addEventListener(KeyboardEvent.KEY_UP, startgame);
			
			addChild(back);
			
			
			
			addChild(textSkippyPop);
			textSkippyPop.textColor = 0xffff00;
			textSkippyPop.x = 340;
			textSkippyPop.y = 200;
			textSkippyPop.width = 500;
			
			text1.textColor = 0xff0000;
			text1.x = 290;
			text1.y = 100;
			text1.width = 600;
			
			
			text2.textColor = 0x000000;
			text2.x = 330;
			text2.y = 200;
			text2.width = 500;
			
			
			text3.textColor = 0xff0000;
			text3.x = 375;
			text3.y = 250;
			text3.width = 500;
			
			text4.textColor = 0x000000;
			text4.x = 410;
			text4.y = 300;
			text4.width = 500;
			
			text5.textColor = 0x000000;
			text5.x = 325;
			text5.y = 350;
			text5.width = 500;
			
			addChild(unlock1);
			addChild(unlock2);
			addChild(unlock3);
			addChild(unlock4);
			unlock1.textColor = 0x000000;
			if (GameScreen.highscore >= 100) {
				unlock1.textColor = 0x00ff00;
			}
			
			unlock1.x = 330;
			unlock1.y = 300;
			unlock1.width = 500;
			
			unlock2.textColor = 0x000000;
			if (GameScreen.highscore >= 200) {
				unlock2.textColor = 0x00ff00;
			}
			unlock2.x = 330;
			unlock2.y = 350;
			unlock2.width = 500;
			
			unlock3.textColor = 0x000000;
			if (GameScreen.highscore >= 400) {
				unlock3.textColor = 0x00ff00;
			}
			unlock3.x = 330;
			unlock3.y = 400;
			unlock3.width = 500;
			
			unlock4.textColor = 0x000000;
			if (GameScreen.highscore >= 600) {
				unlock4.textColor = 0x00ff00;
			}
			unlock4.x = 330;
			unlock4.y = 450;
			unlock4.width = 500;
			
			
		}
		function tutorialtimer(e:TimerEvent) {
			removeChild(textSkippyPop);
			removeChild(unlock1);
			removeChild(unlock2);
			removeChild(unlock3);
			removeChild(unlock4);
			addChild(text2);
			addChild(text3);
			addChild(text4);
			addChild(text5);
			Main.tutorial = false;
			
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
			if (e.keyCode == 32 && Main.tutorial == true) {
				
				timer2.start();
			}
			if (e.keyCode == 32  && Main.tutorial == false){
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE, klaar);
				timer2.removeEventListener(TimerEvent.TIMER_COMPLETE, tutorialtimer);
				stage.removeEventListener(KeyboardEvent.KEY_UP, startgame);
				this.dispatchEvent(new Event("start"));
			}
		}
	}
	
}
