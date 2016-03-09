﻿package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.sensors.Accelerometer;
	import flash.media.*;
	import flash.net.URLRequest;

	public class GameScreen extends MovieClip {
		
		private var request1:URLRequest = new URLRequest("sound/jump.mp3");//add sound .mp3 alleen
		private var jumpSound:Sound = new Sound(request1);
		private var request2:URLRequest = new URLRequest("sound/phasingbeam.mp3");//add sound .mp3 alleen
		private var laserSound:Sound = new Sound(request2);
		private var request3:URLRequest = new URLRequest("sound/pop-distorted.mp3");//pop2.mp3
		private var popSound:Sound = new Sound(request3);
		private var request4:URLRequest = new URLRequest("sound/gameover.mp3");
		private var overSound:Sound = new Sound(request4);
		
		public static var score:int = 0;
		private var format:TextFormat = new TextFormat;
		private var scoretext:TextField = new TextField;
		private var shoottext:TextField = new TextField;
		private var laser: Laser = new Laser;
		private var wolk:Wolk1 = new Wolk1;
		private var gaster:Gaster = new Gaster;
		private var gameOver:GameOverScreen = new GameOverScreen;
		private var spawnTimer: Timer = new Timer(Math.random() * 1000 + 500, 1);
		private var laserTimer: Timer = new Timer(200, 1);
		private var vuurTimer: Timer = new Timer(200, 1);
		private var spawnArray: Array = [];
		private var klik:Boolean = true;
		private var shots:int = 2;
		private var back:BackGround = new BackGround;
		public function GameScreen() {
			this.addEventListener(Event.ADDED_TO_STAGE, init);

		}
		private function init(e:Event):void {
			this.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_UP, keydown);
			spawnTimer.addEventListener(TimerEvent.TIMER_COMPLETE, spawn)
			laserTimer.addEventListener(TimerEvent.TIMER_COMPLETE, weg)
			vuurTimer.addEventListener(TimerEvent.TIMER_COMPLETE, vuur)
			spawnTimer.start();
			addChild(back);
			
			
			addChild(wolk);
			wolk = new Wolk1;
			addChild(wolk);
			wolk = new Wolk1;
			addChild(wolk);
			wolk = new Wolk1;
			addChild(wolk);
			addChild(gaster);
			format.size = 30;
			scoretext.defaultTextFormat = format;
			scoretext.text = "score:";
			scoretext.x = 450;
			scoretext.width = 200;
			addChild(scoretext);
			
			shoottext.defaultTextFormat = format;
			shoottext.text = "shots left: ";
			shoottext.x = 10;
			shoottext.y = 450;
			shoottext.width = 400;
			shoottext.textColor = 0xff0000;
			scoretext.textColor = 0xffff00;
			addChild(shoottext);
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		function keydown(k: KeyboardEvent): void {

			if (k.keyCode == 32 && klik == true && shots >= 1) {
				addChild(laser);
				laser.x =300;
				laser.y = 510;
				laserSound.play();
				klik = false;
				shots -= 1;
				laserTimer.start();
			}
		}

		function spawn(s: TimerEvent) {

			var skippyball: SkippyBall = new SkippyBall;
			addChild(skippyball);
			spawnArray.push(skippyball);
			skippyball.x = 1100;
			skippyball.y = 270;
			spawnTimer.reset();
			spawnTimer.delay = Math.random() * 1000 + 500;
			spawnTimer.start();
		}
		function weg(s: TimerEvent) {
			removeChild(laser);
			laserTimer.reset();
			vuurTimer.start();

		}
		function vuur(s: TimerEvent) {
			klik = true;
			vuurTimer.reset();

		}
		function cleanupnu() {
			for (var i:int = 0; i < spawnArray.length; i++) {
					removeChild(spawnArray[i]);
					spawnArray.splice(i, 1);
				}
				stage.removeEventListener(KeyboardEvent.KEY_UP, keydown);
			spawnTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, spawn)
			laserTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, weg)
			vuurTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, vuur)
				this.removeEventListener(Event.ENTER_FRAME, loop);
				this.dispatchEvent(new Event("gameover"));
				
		}
		function loop(e: Event): void {
			scoretext.text = "score: "+ score ;
			shoottext.text = "shots left "+ shots ;
			for (var i: int = 0; i < spawnArray.length; i++) {
				if (spawnArray[i].y > 460) {
					jumpSound.play();
				}
				
				if (spawnArray[i].x < 50) {
					overSound.play();
					removeChild(spawnArray[i]);
					spawnArray.splice(i, 1);
					//cleanup = true;
					cleanupnu();
					
					
				}
				if (wolk.x <= 0) {
					removeChild(gaster);
					addChild(gaster);
				}
				if (this.contains(laser)) {
					if (spawnArray[i].x >= 280 && spawnArray[i].x <= 330 ) {
						popSound.play();
						removeChild(spawnArray[i]);
						spawnArray.splice(i, 1);
						shots += 1;
						score += 5;
						
					}
				}

			}
			

		}

	}

}