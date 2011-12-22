package nid.game.engine 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Player extends MovieClip 
	{
		public var angle:Number;
		public var id:int;
		public var data:Object;
		
		public function Player(data:Object) 
		{
			this.data = data
		}
		
		public function distroy():void 
		{
			
		}
		
	}

}