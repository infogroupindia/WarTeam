package nid.game.wt.view 
{
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.events.MouseEvent;
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
			var keyconfig:KeyConfig = new KeyConfig();
			keyconfig.x = 100;
			keyconfig.y = 20;
			gameport = Application.getInstance().game.viewport;
			gameport.addChild(keyconfig);
			
			keyconfig.fs_btn.addEventListener(MouseEvent.CLICK, togggleFullScreen);
		}
		
		private function togggleFullScreen(e:MouseEvent):void 
		{
			if(gameport.stage.displayState == StageDisplayState.NORMAL){
				gameport.stage.displayState = StageDisplayState.FULL_SCREEN;
				//gameport.stage.mouseLock = true;
			}else{
				//gameport.stage.mouseLock = false;
				gameport.stage.displayState = StageDisplayState.NORMAL;
			}
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