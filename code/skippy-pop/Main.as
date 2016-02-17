package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.sensors.Accelerometer;

	public class Main extends MovieClip {

		public var sound: Sound = new Sound;
		var laser:Laser = new Laser;
		var spawnTimer:Timer = new Timer(Math.random()* 1000 + 500,1);
		var laserTimer:Timer = new Timer(500,1);
		var vuurTimer:Timer = new Timer(500,1);
		var spawnArray:Array = [];
		var klik:int = 1;
		
		public function Main() {
			
			this.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydown);
			spawnTimer.addEventListener(TimerEvent.TIMER_COMPLETE,spawn)
			laserTimer.addEventListener(TimerEvent.TIMER_COMPLETE,weg)
			vuurTimer.addEventListener(TimerEvent.TIMER_COMPLETE,vuur)
			spawnTimer.start();
			
		}
		function keydown(k:KeyboardEvent):void
		{
			
			if(k.keyCode == 32 && klik == 1){
				addChild(laser);
				laser.x = 100;
				laser.y = 495;
				klik = 0;
				laserTimer.start();
			}
		}
		
		function spawn(s:TimerEvent)
		{
			
			var skippyball: SkippyBall = new SkippyBall;
			addChild(skippyball);
			spawnArray.push(skippyball);
			skippyball.x = 1100;
			skippyball.y = 270;
			spawnTimer.reset();
			spawnTimer.delay = Math.random()* 1000 + 500;
			spawnTimer.start();
		}
		function weg(s:TimerEvent)
		{
			removeChild(laser);
			laserTimer.reset();
			vuurTimer.start();

		}
		function vuur(s:TimerEvent)
		{
			klik = 1;
			vuurTimer.reset();

		}
		function loop(e:Event):void 
		{
			for(var i:int = 0; i<spawnArray.length; i++)
			{
				if(spawnArray[i].x < 50){
					removeChild(spawnArray[i]);
					spawnArray.splice(i,1);
					
				}				
			}
			
		}
		
	}

}