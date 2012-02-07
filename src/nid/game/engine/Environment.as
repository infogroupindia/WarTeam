package nid.game.engine 
{
	import flare.basic.Scene3D;
	import flare.core.Pivot3D;
	import flare.primitives.SkyBox;
	import flash.display.MovieClip;
	import nid.game.wt.game.Assets;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Environment extends MovieClip 
	{
		private var scene:Scene3D;
		private var level:Pivot3D;
		
		public function Environment(scene:Scene3D) 
		{
			this.scene = scene;
			
		}
		public function load():void
		{
			//var sky:SkyBox = new SkyBox( Assets.SKYBOX_1, SkyBox.HORIZONTAL_CROSS, scene );
			//scene.addChild(sky);
			level = scene.addChildFromFile( Assets.LEVEL_1 );
		}
	}

}