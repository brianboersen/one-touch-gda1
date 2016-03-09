package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.sensors.Accelerometer;

	public class GameScreen extends MovieClip {
		
		public var score:int = 0;
		private var format:TextFormat = new TextFormat;
		private var scoretext:TextField = new TextField;
		public var sound: Sound = new Sound;
		private var laser: Laser = new Laser;
		private var gameOver:GameOverScreen = new GameOverScreen;
		private var spawnTimer: Timer = new Timer(Math.random() * 1000 + 500, 1);
		private var laserTimer: Timer = new Timer(200, 1);
		private var vuurTimer: Timer = new Timer(800, 1);
		private var spawnArray: Array = [];
		private var klik:Boolean = true;
		private var shots:int = 1;
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
			format.size = 30;
			scoretext.defaultTextFormat = format;
			scoretext.text = "score:";
			scoretext.x = 450;
			scoretext.width = 200;
			addChild(scoretext);
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		function keydown(k: KeyboardEvent): void {

			if (k.keyCode == 32 && klik == true && shots >= 1) {
				addChild(laser);
				laser.x = 200;
				laser.y = 495;
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
			trace("werkt1");
			for (var i:int = 0; i < spawnArray.length; i++) {
					removeChild(spawnArray[i]);
					spawnArray.splice(i, 1);
				}
				//this.removeEventListener(Event.ADDED_TO_STAGE, init);
				stage.removeEventListener(KeyboardEvent.KEY_UP, keydown);
			spawnTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, spawn)
			laserTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, weg)
			vuurTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, vuur)
				this.removeEventListener(Event.ENTER_FRAME, loop);
				this.dispatchEvent(new Event("gameover"));
				
		}
		function loop(e: Event): void {
			scoretext.text = "score: "+ score ;
			for (var i: int = 0; i < spawnArray.length; i++) {
				if (spawnArray[i].x < 50) {
					
					removeChild(spawnArray[i]);
					spawnArray.splice(i, 1);
					//cleanup = true;
					cleanupnu();
					
					
				}
				if (this.contains(laser)) {
					if (laser.hitTestObject(spawnArray[i])) {
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