package nid.game.engine.data 
{
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class GameData extends Object 
	{
		public var id:int;
		public var playerName:String;
		
		public var model:String;
		public var weapon:String;
		
		public function GameData(hostID:int) 
		{
			id = hostID;
		}
		
	}

}