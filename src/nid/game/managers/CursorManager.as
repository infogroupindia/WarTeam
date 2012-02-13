package nid.game.managers 
{
	import flash.ui.Mouse;
	import nid.game.managers.cursor.CrossHairCursor;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class CursorManager 
	{
		public static const CROSS_HAIR:String = "cross_hair";
		
		public function CursorManager() 
		{
			Mouse.registerCursor(CROSS_HAIR, new CrossHairCursor().data);
		}
		public function setCursor(name:String):void
		{
			Mouse.cursor = name;
		}
	}

}