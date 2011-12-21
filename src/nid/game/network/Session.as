package nid.game.network 
{
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Session extends EventDispatcher 
	{
		public var id:String;
		public var playerID:String;
		public var playerName:String;
		
		public function Session() 
		{
			
		}
		public function login(user:String, pwd:String):void
		{
			
		}
		public function logout():void
		{
			
		}
		public function get exist():Boolean { return true; }
	}

}