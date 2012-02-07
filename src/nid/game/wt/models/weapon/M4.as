package nid.game.wt.models.weapon 
{
	import flare.core.Pivot3D;
	import nid.game.engine.GameEngine;
	import nid.game.wt.game.Assets;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class M4 
	{
		private static var model:Pivot3D;
		
		public static function getModel():Pivot3D
		{
			if (model == null) 
			{
				model = GameEngine.scene.addChildFromFile(Assets.WEAPON_M4);
				return model;
			}
			else return model.clone();
		}
		public function M4() 
		{
			
		}
		
	}

}