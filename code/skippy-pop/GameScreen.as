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
	import flash.media.*;
	import flash.net.URLRequest;

	public class GameScreen extends MovieClip {
		public var chanal:SoundChannel = new SoundChannel();
		
		private var request1:URLRequest = new URLRequest("sound/jump.mp3");//add sound .mp3 alleen
		private var jumpSound:Sound = new Sound(request1);
		private var request2:URLRequest = new URLRequest("sound/phasingbeam.mp3");
		private var laserSound:Sound = new Sound(request2);
		private var request3:URLRequest = new URLRequest("sound/pop-distorted.mp3");
		private var popSound:Sound = new Sound(request3);
		private var request4:URLRequest = new URLRequest("sound/gameover.mp3");
		private var overSound:Sound = new Sound(request4);
		private var request5:URLRequest = new URLRequest("sound/trumpets-r.mp3");
		private var pointsSound:Sound = new Sound(request5)
		private var request6:URLRequest = new URLRequest("sound/adult-woman.mp3");
		private var lachSound:Sound = new Sound(request6);
		private var request7:URLRequest = new URLRequest("sound/Zelda - Song of Storms (Deon Custom Remix).mp3");
		private var song:Sound = new Sound(request7);
		
		
		private var skippytime:Number = 500;
		private var startsound:Boolean = true;
		public static var score:int = 0;
		public static var highscore:int = 0;
		public static var snelheid:int = 10;
		private var format:TextFormat = new TextFormat;
		private var format2:TextFormat = new TextFormat;
		private var scoretext:TextField = new TextField;
		private var shoottext:TextField = new TextField;
		private var wachttext:TextField = new TextField;
		private var laser: Laser = new Laser;
		private var gaster:Gaster = new Gaster;
		private var gameOver:GameOverScreen = new GameOverScreen;
		private var spawnTimer: Timer = new Timer(Math.random() * 1000 + 500, 1);
		private var laserTimer: Timer = new Timer(200, 1);
		private var starttimer: Timer = new Timer(12600, 1); 
		private var vuurtimertijd:int = 50;
		private var vuurTimer: Timer = new Timer(vuurtimertijd, 1);
		private var soundTimer: Timer = new Timer(5000, 1);
		private var Timertext: Timer = new Timer(1000, 1);
		private var spawnArray: Array = [];
		private var klik:Boolean = true;
		private var shots:int = 1;
		private var shotwithright = 330;
		private var shotwithleft = 280;
		private var firsttimeshoot:Boolean = true;
		private var back:BackGround = new BackGround;
		public function GameScreen() {
			this.addEventListener(Event.ADDED_TO_STAGE, init);

		}
		private function init(e:Event):void {
			this.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_UP, keydown);
			spawnTimer.addEventListener(TimerEvent.TIMER_COMPLETE, spawn)
			starttimer.addEventListener(TimerEvent.TIMER_COMPLETE, startgamenu)
			Timertext.addEventListener(TimerEvent.TIMER_COMPLETE, maaktextkleiner);
			laserTimer.addEventListener(TimerEvent.TIMER_COMPLETE, weg)
			vuurTimer.addEventListener(TimerEvent.TIMER_COMPLETE, vuur)
			soundTimer.addEventListener(TimerEvent.TIMER_COMPLETE, playsound)
			
			//back
			addChild(back);
			
			
			
			if (Main.firsttime == false) {
				spawnTimer.start();
			}
			if(Main.firsttime == true){
			starttimer.start();
			
			addChild(wachttext);
			Main.firsttime = false;
			}
			
			
			
			//soun chanal
			chanal = song.play();
			
			
			addChild(gaster);
			
			
			//text
			format.size = 30;
			format2.size = 30;
			
			scoretext.defaultTextFormat = format2;
			scoretext.text = "score:";
			scoretext.x = 480;
			scoretext.y = 10;
			scoretext.width = 400;
			addChild(scoretext);
			
			wachttext.defaultTextFormat = format2;
			wachttext.text = "!wait!";
			wachttext.x = 450;
			wachttext.y = 200;
			wachttext.width = 100;
			
			shoottext.defaultTextFormat = format;
			shoottext.text = "shots left: ";
			shoottext.x = 10;
			shoottext.y = 450;
			shoottext.width = 400;
			shoottext.textColor = 0xff0000;
			scoretext.textColor = 0xff0000;
			addChild(shoottext);
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		function playsound(E:TimerEvent) {
		
			startsound = true;
		}
		function startgamenu(e:TimerEvent) {
			removeChild(wachttext);
			spawnTimer.start();
			
		}
		
		function keydown(k: KeyboardEvent): void {

			if (k.keyCode == 32 && klik == true && shots >= 1 && firsttimeshoot == false) {
				addChild(laser);
				laser.x =300;
				laser.y = 510;
				if (highscore < 100) {//laser.width = 100;
					laser.width = 100;
					
				}
				if (highscore >= 100 && highscore < 400) {
					laser.width = 200;
					shotwithright = 380;
					shotwithleft = 230;
				}
				if (highscore >= 400 && highscore < 700) {
					laser.width = 300;
					shotwithright = 410;
					shotwithleft = 180;
				}
				if (highscore >= 700 && highscore < 1000) {
					laser.width = 400;
					shotwithright = 465;
					shotwithleft = 140;
				}
				if (highscore >= 1000) {
					laser.width = 600;
					shotwithright = 530;
					shotwithleft = 60;
				}
				laserSound.play();
				klik = false;
				shots -= 1;
				laserTimer.start();
			}
		}
		
		function maaktextkleiner(e:TimerEvent) {
			format2.size = 30;
			scoretext.defaultTextFormat = format2;
			Timertext.reset();
		}

		function spawn(s: TimerEvent) {
			if (firsttimeshoot != false) {
				firsttimeshoot = false;
			}
			var skippyball: SkippyBall = new SkippyBall;
			addChild(skippyball);
			spawnArray.push(skippyball);
			skippyball.x = 1100;
			skippyball.y = 270;
			spawnTimer.reset();
			spawnTimer.delay = Math.random() * 1000 + skippytime;
			spawnTimer.start();
		}
		function weg(s: TimerEvent) {
			removeChild(laser);
			laserTimer.reset();
			//vuurTimer = new Timer(vuurtimertijd, 1);
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
			shoottext.text = "shots left " + shots ;
			
			
			if (score == 100 || score == 200 || score == 300 || score == 400 || score == 500 || score == 600 || score == 700 || score == 800 || score == 900  ) {
				if(startsound == true){
					snelheid += 2;
					
					if (skippytime > 100) {
						skippytime -= 200;
					}
					if (skippytime == 100) {
						skippytime -= 100;
					}
					
					format2.size = 50;
					scoretext.defaultTextFormat = format2;
					Timertext.start();
					pointsSound.play();
					soundTimer.start();
					startsound = false;
				}
			}
			for (var i: int = 0; i < spawnArray.length; i++) {
				if (spawnArray[i].y > 460) {
					jumpSound.play();
				}
				
				if (spawnArray[i].x < 50) {
					if (score <= 30) {
							lachSound.play();
						}
					else{
						overSound.play();
						}
						if (score > highscore) {
							highscore = score;
						}
					
					chanal.stop();
					skippytime = 500;
					snelheid = 10;
					removeChild(spawnArray[i]);
					spawnArray.splice(i, 1);
					cleanupnu();
					
					
				}
				
				if (this.contains(laser)) {
					if (spawnArray[i].x >=shotwithleft && spawnArray[i].x <= shotwithright ) {// 
						
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