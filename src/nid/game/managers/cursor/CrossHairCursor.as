package nid.game.managers.cursor 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.ui.MouseCursorData;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class CrossHairCursor 
	{
		[Embed(source = "cross_hair.png")]
		private var bmp:Class;
		public var data:MouseCursorData;
		
		public function CrossHairCursor() 
		{
			data = new MouseCursorData();
			var bmpData:Vector.<BitmapData> = new Vector.<BitmapData>(1, true);
			bmpData[0] = Bitmap(new bmp()).bitmapData;
			data.data = bmpData;
		}
		
	}

}