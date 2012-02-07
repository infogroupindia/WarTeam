package nid.game.wt.models 
{
	import flare.core.Pivot3D;
	import nid.game.wt.models.human.GreenSoldier;
	import nid.game.wt.models.human.RedSoldier;
	import nid.game.wt.models.weapon.M4;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class ModelLibrary 
	{
		public static function getModel(name:String):Pivot3D
		{
			switch(name)
			{
				case "green_soldier":
				{
					return GreenSoldier.getModel();
				}
				break
				
				case "red_soldier":
				{
					return RedSoldier.getModel();
				}
				break
				
				case "m4":
				{
					return M4.getModel();
				}
				break
			}
			
			return null;
		}
		public function ModelLibrary() 
		{
			
		}
		
	}

}