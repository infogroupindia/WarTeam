package nid 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import nid.game.wt.Application;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class WarTeamGame extends Sprite 
	{
		
		public function WarTeamGame() 
		{
			if(parent != null)
			boot(this);
		}
		
		public function boot(root:DisplayObject):void
		{
			Application.getInstance().boot(root);
		}
		
	}

}