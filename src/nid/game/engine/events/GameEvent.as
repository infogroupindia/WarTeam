package nid.game.engine.events 
{
	import flash.events.Event;
	import nid.game.engine.data.GameData;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class GameEvent extends Event 
	{
		static public const JOIN:String 	= "join";
		static public const LEAVE:String 	= "leave";
		static public const KILL:String 	= "kill";
		
		public var data:GameData;
		
		public function GameEvent(type:String, data:GameData = null, bubbles:Boolean = false, cancelable:Boolean = false) 
		{ 
			this.data = data;
			super(type, bubbles, cancelable);
		}
	}
	
}