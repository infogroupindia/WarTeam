package nid.game.wt.view 
{
	import flash.display.Sprite;
	import nid.game.engine.Viewport;
	import nid.game.wt.Application;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class GameView extends Sprite 
	{
		private var gameport:Viewport;
		
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
			Application.getInstance().game.pause();
			if (contains(gameport)) removeChild(gameport);
		}
		public function align():void
		{
			Application.getInstance().game.resize();
		}
	}

}