package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Wolk1 extends MovieClip {
		 
		public static var wind:int = 2; 
		
		public function Wolk1() {
			this.x = Math.random() * 1000 +1000;
			this.y =420;
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		function loop(e:Event) {
			this.x -= wind;
			if (this.x <= -50) {
				this.x = Math.random()*300+1300;
				this.y =420;
			}
		}
	}
	
}
