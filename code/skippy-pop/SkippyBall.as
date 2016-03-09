package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class SkippyBall extends MovieClip {
		private var i: int = 1;
		private var jump: int = 5;
		private var up: Boolean = false;
		private var hoogte:Number = 80;
		
		
		
		public function SkippyBall() {
			this.addEventListener(Event.ENTER_FRAME, loop);

		}

		function loop(e: Event): void {
			// als this y =< als stageheight - 100 
			// dan up = false en jump = 20;
			// als up = false dan this.y is jump
			//doe het tegenovergestelde
			
			this.x -= 10;
			if (this.y <= 270) {
				hoogte = 50;
				jump = 2;
				up = false;
			}
			if (this.y >= 470) {
				jump = 20;
				up = true;
			}
			if (up == true) {
				this.y -= jump;
				if(hoogte <= 120){
					this.height = hoogte;
					hoogte += 10;
				}
				if(jump >= 5){
				jump -= 1;
				}
			}
			if (up == false) {
				this.y += jump;
				jump += 2;
			}
			


		}
	}

}