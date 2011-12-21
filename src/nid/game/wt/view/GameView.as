package nid.game.wt.view 
{
	import flash.display.Sprite;
	import nid.game.wt.Application;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class GameView extends Sprite 
	{
		private var gameport;
		
		public function GameView() 
		{
			gameport = Application.getInstance().game.viewport;
		}
		
		public function get title():String { return ViewList.GAME_VIEW; }
		public function open():void 
		{
			addChild(gameport);
			Application.getInstance().game.resume();
		}
		public function close():void 
		{
			if (contains(gameport)) removeChild(gameport);
			Application.getInstance().game.pause();
		}
		
		public function align():void
		{
			
		}
	}

}