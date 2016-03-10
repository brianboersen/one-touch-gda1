package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Wolk1 extends MovieClip {
		private var plaatsy:int = Math.random() * 100 + 20; 
		private var wind:int = Math.random() * 3 + 4; 
		
		public function Wolk1() {
			this.x = Math.random() * 1000 +1000;
			this.y = Math.random() * 100 + 20;
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		function loop(e:Event) {
			this.x -= wind;
			if (this.x <= 0) {
				this.x = Math.random()*300+1300;
				this.y = plaatsy;
			}
		}
	}
	
}
