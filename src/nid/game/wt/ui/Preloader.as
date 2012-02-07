package nid.game.wt.ui 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Preloader extends Sprite 
	{
		private var txt:TextField;
		
		public function Preloader() 
		{
			var bg:Shape = new Shape();
			bg.graphics.beginFill(0x065AAF);
			bg.graphics.drawRect(0, 0, 250, 50);
			bg.graphics.endFill();
			addChild(bg);
			txt = new TextField();
			txt.width = 100;
			txt.height = 22;
			txt.defaultTextFormat = new TextFormat("Tahoma", 12, 0xffffff, true,null,null,null,null,"center");
			txt.text = "Loading...";
			addChild(txt);
			txt.x = (bg.width - txt.width) / 2;
			txt.y = (bg.height - txt.height) / 2;
		}
		public function progress(value:int):void
		{
			txt.text = "Loading... "+value.toString();
			
		}
	}

}