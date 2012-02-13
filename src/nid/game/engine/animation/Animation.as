package nid.game.engine.animation 
{
	import flare.loaders.Flare3DLoader;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Animation 
	{
		public var data:Flare3DLoader;
		public var name:String;
		
		public function Animation(data:Flare3DLoader,name:String) 
		{
			this.name = name;
			this.data = data;
		}
		
	}

}