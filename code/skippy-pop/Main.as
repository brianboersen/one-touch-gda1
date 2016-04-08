package {
	import flash.display.MovieClip;
	import flash.events.Event;
	

	public class Main extends MovieClip {
		public var gameScreen:GameScreen ;
		public var gameOver:GameOverScreen;
		public var startScreen:StartScreen;
		public static var tutorial:Boolean = true;//true
		public static var firsttime:Boolean = true;//false
		 
		public function Main() {
			
          this.addEventListener(Event.ADDED_TO_STAGE, init);
			
		
		}
		private function init(e:Event) {
			//enrty point dus begin
			//maak een nieuwe start aan
			maakstart(null);	
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		function maakgame(e:Event) {
			//delete alle screens
			this.deleteAll();
			//maak nieuwe gamescreen aan
			this.gameScreen = new GameScreen();
			//addchild het nieuwe gamescreen
			addChild(this.gameScreen);
			//voeg ook de eventlistner toe gameover
			gameScreen.addEventListener("gameover", maakgameover);
		}
		function maakstart(e:Event) {
			this.deleteAll();
			this.startScreen = new StartScreen();
			addChild(this.startScreen);
			startScreen.addEventListener("start", maakgame);
		}
		function maakgameover(e:Event) {
			this.deleteAll();
			this.gameOver = new GameOverScreen();
			addChild(this.gameOver);
			gameOver.addEventListener("terug", maakstart);
		}
		function deleteAll() {
			//check eerst of die bestaat door middel van te checken of het NIET null is
			
			if (this.gameOver!=null) 
			{
				//gameover is NIET null dus verwijderen.
				removeChild(this.gameOver);
				this.gameOver = null;
			}
			if (this.gameScreen!=null) 
			{
				removeChild(this.gameScreen);
				this.gameScreen = null;
			}
			if (this.startScreen!=null) 
			{
				removeChild(this.startScreen);
				this.startScreen = null;
			}
			
		}
	}

}