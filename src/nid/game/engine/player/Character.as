package nid.game.engine.player 
{
	import flare.basic.Scene3D;
	import flare.core.Mesh3D;
	import flare.core.Pivot3D;
	import flare.loaders.Flare3DLoader;
	import flare.utils.Pivot3DUtils;
	import nid.game.engine.animation.SoldierAnimation;
	import nid.game.engine.components.BoneController;
	import nid.game.engine.controller.BaseController;
	import nid.game.engine.controller.IController;
	import nid.game.engine.data.GameData;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Character
	{
		public var animations:SoldierAnimation;
		public var weapon:Pivot3D;
		public var model:Pivot3D;
		
		public function Character()
		{
			
		}
		
		public function init():void 
		{
			attachWeapon(weapon);
			animations.appendAnimation(model)
			model.gotoAndPlay(SoldierAnimation.IDLE);
		}
		public function attachWeapon(new_weapon:Pivot3D):void
		{
			weapon = new_weapon;
			var skinnedMesh:Mesh3D = model.getChildByName( "Soldier" ) as Mesh3D;
			
			//weapon.setScale(3, 3, 3);
			weapon.setScale(2.5, 2.5, 2.5);
			weapon.setTranslation(-1, -1.2, 1);
			weapon.setRotation(-3, -85, 0);
			
			weapon.addComponent( new BoneController( skinnedMesh, "RArmIndex1" ) );
		}
		
		public function update(controller:BaseController):void 
		{
			
		}
	}

}