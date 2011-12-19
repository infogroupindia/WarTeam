package  
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.filters.DisplacementMapFilter;
	import flash.geom.Point;
	import flash.geom.ColorTransform;
	import flash.display.BitmapDataChannel;
	import flash.filters.DisplacementMapFilterMode;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Matrix;
	import flash.filters.BlurFilter;
	import flash.display.BlendMode;
	import flash.display.Shape;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Fire extends Sprite 
	{
		public var posX:Number;
		public var posY:Number;
		public var displayWidth:Number;
		public var displayHeight:Number;
		public var clouds:ScrollingPerlinNoise;
		public var clouds2:ScrollingPerlinNoise;
		public var dmfClouds:ScrollingPerlinNoise;
		public var displayBitmapData:BitmapData;
		public var displayBitmap:Bitmap;
		public var dmfSource:BitmapData;
		public var shapeGrad:Shape;
		public var dmf:DisplacementMapFilter;
		public var cmf:ColorMatrixFilter;
		public var origin:Point;
		public var preBlur:BlurFilter;
		public var postBlur:BlurFilter;

		public function Fire() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		public function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			posX = 400;
			posY = -17;
			displayWidth = 350;
			displayHeight = 350;
			
			displayBitmapData = new BitmapData(displayWidth,displayHeight,true,0x00000000);
			displayBitmap = new Bitmap(displayBitmapData);
			displayBitmap.x = posX;
			displayBitmap.y = posY;
			this.addChild(displayBitmap);
			
			origin = new Point(0,0); //to be used in filters.

			clouds = new ScrollingPerlinNoise(displayWidth,displayHeight, 1, -5, true, 0x000000, 5, 30,150,true);
			clouds2 = new ScrollingPerlinNoise(displayWidth,displayHeight, -1, -6, true, 0x000000, 5, 40,100,true);
			//we want these "clouds" to have more contrast:
			var contrast:ColorMatrixFilter = new ColorMatrixFilter([4,0,0,0,-400,
																	4,0,0,0,-400,
																	4,0,0,0,-400,
																	0,0,0,1,0]);
			
			clouds.cloudsBitmapData.applyFilter(clouds.cloudsBitmapData,clouds.cloudsBitmapData.rect,origin,contrast);
			clouds2.cloudsBitmapData.applyFilter(clouds2.cloudsBitmapData,clouds2.cloudsBitmapData.rect,origin,contrast);
			
			//The dmfClouds will be used as the source for the displacement map filter.
			dmfClouds = new ScrollingPerlinNoise(displayWidth,displayHeight, 3, -14, true,0x800000, 5, 120,200,false);
			
			dmfSource = new BitmapData(displayWidth,displayHeight,false,0x000000);
			
			//shapeGrad will be used to round out the top of the perlin noise cloud display before distorting it.
			shapeGrad = new Shape();
			var mat:Matrix = new Matrix();
			var gw:Number = displayWidth;
			var gh:Number = 2*displayHeight;
			mat.createGradientBox(gw,gh,0,0.5*(displayWidth - gw),0);
			shapeGrad.graphics.beginGradientFill("radial",[0xFFFFFF,0],[0,1],[0,255],mat);
			shapeGrad.graphics.drawRect(0,0,displayWidth,displayHeight);
			shapeGrad.graphics.endFill();					
			dmfSource.draw(shapeGrad);
			
			var frame:Shape = new Shape();
			//frame.graphics.lineStyle(1,0x222222);
			frame.graphics.drawRect(0,0,displayWidth,displayHeight);
			frame.x = posX;
			frame.y = posY;
			this.addChild(frame);
			
			preBlur = new BlurFilter(3,10);
			postBlur = new BlurFilter(2,2);
			dmf = new DisplacementMapFilter(dmfSource, new Point(), BitmapDataChannel.RED, BitmapDataChannel.BLUE, 120, 500, DisplacementMapFilterMode.COLOR,0x000000,0);
			
			var a:Number = 30;
			var d:Number = -1024;
			cmf = new ColorMatrixFilter([a*1,0,0,0,d,
										 a*0.6,0,0,0,d,
										 a*0.4,0,0,0,d,
										 2.4,0,0,0,0]);
			
			clouds.startScroll();
			clouds2.startScroll();
			dmfClouds.startScroll();
			
		}
		
		public function start():void
		{
			this.addEventListener(Event.ENTER_FRAME, onEnter);
		}
		public function stop():void
		{
			this.removeEventListener(Event.ENTER_FRAME, onEnter);
		}
		
		public function onEnter(evt:Event):void 
		{
			var rect:Rectangle = new Rectangle(0,0,displayWidth, displayHeight);
			
			dmfSource.draw(dmfClouds);	
			
			displayBitmapData.lock();
			
			displayBitmapData.draw(clouds);
			displayBitmapData.draw(clouds2,null,null,BlendMode.ADD);
			displayBitmapData.draw(shapeGrad);
			
			displayBitmapData.applyFilter(displayBitmapData, rect, origin, cmf);
			displayBitmapData.applyFilter(displayBitmapData, rect, origin, preBlur);
			displayBitmapData.applyFilter(displayBitmapData, rect, origin, dmf);
			displayBitmapData.applyFilter(displayBitmapData, rect, origin, postBlur);
			
			displayBitmapData.unlock();	
		}
	}

}







