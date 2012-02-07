package nid.game.engine 
{
	import flare.basic.Scene3D;
	import flash.display.MovieClip;
	import nid.game.engine.animation.SoldierAnimation;
	import nid.game.engine.controller.BaseController;
	import nid.game.engine.controller.IController;
	import nid.game.engine.data.GameData;
	import nid.game.wt.CONFIG;
	import nid.game.wt.models.ModelLibrary;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Player extends MovieClip 
	{
		private var controller:IController;
		private var character:Character;
		public var angle:Number;
		public var id:int;
		public var data:GameData;
		
		public function Player(scene:Scene3D, data:GameData, controller:IController)
		{
			this.controller 		= controller;
			this.data 				= data;
			
			character 				= new Character();
			character.model 		= ModelLibrary.getModel(data.model);
			character.animations 	= SoldierAnimation.getAnimation();
			character.weapon 		= ModelLibrary.getModel(data.weapon);
			
			scene.camera.parent 	= character.model;
			controller.setModel(character.model);
		}
		public function init():void 
		{
			character.init();
			BaseController(controller).oldPosition.copyFrom( character.model.getPosition() );
		}
		public function update():void
		{
			controller.update();
		}
		public function distroy():void 
		{
			
		}
		
	}

}