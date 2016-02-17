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
		var spawnArray:Array = [];
		//var klik:int = 1;
		
		public function Main() {
			
			this.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydown);
			//stage.addEventListener(KeyboardEvent.KEY_UP, keyUP);
			spawnTimer.addEventListener(TimerEvent.TIMER_COMPLETE,spawn)
			spawnTimer.start();
			
		}
		function keydown(k:KeyboardEvent):void
		{
			
			if(k.keyCode == 32){
				addChild(laser);
				laser.x = 100;
				laser.y = 495;
			}
		}
		/*
		function keyUP(k:KeyboardEvent):void
		{
			if(k.keyCode == 32){
				removeChild(laser);
			}
		}
		*/
		function spawn(s:TimerEvent){
			//removeChild(skippyball);
			var skippyball: SkippyBall = new SkippyBall;
			addChild(skippyball);
			spawnArray.push(skippyball);
			skippyball.x = 1100;
			skippyball.y = 270;
				spawnTimer.reset();
				spawnTimer.delay = Math.random()* 1000 + 500;
				spawnTimer.start();
		}
		function loop(e:Event):void {
			
		}
		
	}

}