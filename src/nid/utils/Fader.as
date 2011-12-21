package nid.utils 
{
	import caurina.transitions.Tweener;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Fader extends Sprite
	{
		private var bg:Shape;
		private var bmp:Bitmap;
		private var bmp_data:BitmapData;
		private var src_ref:DisplayObject;
		
		public function Fader() 
		{
			bmp = new Bitmap();
			bg = new Shape();
			bg.graphics.beginFill(0x000000, 0.1);
			bg.graphics.drawRect(0, 0, 100, 100);
			bg.graphics.endFill();
			addChild(bg);
			addChild(bmp);
		}
		public function update(src:DisplayObject):void
		{
			Tweener.removeTweens(bmp);
			
			src_ref = src;
			
			if (bmp_data != null)
			{
				bmp_data.dispose();
				bmp_data = null;
			}
			
			var filter:BlurFilter = new BlurFilter(6, 6, BitmapFilterQuality.HIGH);
			
			try 
			{
				bmp_data = new BitmapData(src_ref.stage.stageWidth, src_ref.stage.stageHeight);
			}
			catch (e:Error)
			{
				bmp_data = null;
			}
			
			if (bmp_data != null)
			{
				bmp.bitmapData = bmp_data;
				bmp.alpha = 0;
				bmp_data.draw(src);
				bmp_data.applyFilter(bmp_data, bmp_data.rect, new Point(0, 0), filter);
				Tweener.addTween(bmp, { alpha:1, time:0.5, transition:"easeOutExpo" } );
				align();
			}
		}
		public function align():void
		{
			bg.width = src_ref.stage.stageWidth;
			bg.height = src_ref.stage.stageHeight;
		}
		public function fadein():void
		{
			Tweener.addTween(bmp, { alpha:0, time:0.5, transition:"easeOutExpo", onComplete:remove } );
		}
		
		private function remove():void 
		{
			if(this.parent != null && this.parent.contains(this))
			this.parent.removeChild(this);
		}
	}

}