package nid.game.engine.animation 
{
	import flare.core.Pivot3D;
	import flare.loaders.Flare3DLoader;
	import flare.utils.Pivot3DUtils;
	import nid.game.engine.GameEngine;
	import nid.game.wt.game.Assets;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class SoldierAnimation 
	{
		static public const IDLE:String 			= "idle";
		static public const AIM:String 				= "aim";
		static public const FIRE:String 			= "fire";
		static public const RELOAD:String 			= "reload";
		static public const WALK:String 			= "walk";
		static public const WALK_AIM:String 		= "walkAim";
		static public const WALK_FIRE:String 		= "walkFire";
		static public const RUN:String 				= "run";
		static public const RUN_AIM:String 			= "runAim";
		static public const RUN_FIRE:String 		= "runFire";
		static public const CROUCH:String 			= "crouch";
		static public const CROUCH_AIM:String 		= "crouchAim";
		static public const CROUCH_FIRE:String 		= "crouchFire";
		static public const CROUCH_WALK:String 		= "crouchWalk";
		static public const CROUCH_WALK_AIM:String 	= "crouchWalkAim";
		static public const CROUCH_WALK_FIRE:String = "crouchWalkFire";
		static public const CROUCH_RUN:String 		= "crouchRun";
		static public const CROUCH_RUN_AIM:String 	= "crouchRunAim";
		static public const CROUCH_RUN_FIRE:String 	= "crouchRunFire";
		static public const JUMP:String 			= "jump";
		
		public var crouch:Flare3DLoader;
		public var crouch_aim:Flare3DLoader;
		public var crouch_fire:Flare3DLoader;
		public var crouch_walk:Flare3DLoader;
		public var crouch_walk_aim:Flare3DLoader;
		public var crouch_walk_fire:Flare3DLoader;
		public var crouch_run:Flare3DLoader;
		public var crouch_run_aim:Flare3DLoader;
		public var crouch_run_fire:Flare3DLoader;
		public var idle:Flare3DLoader;
		public var aim:Flare3DLoader;
		public var fire:Flare3DLoader;
		public var reload:Flare3DLoader;
		public var walk:Flare3DLoader;
		public var walk_aim:Flare3DLoader;
		public var walk_fire:Flare3DLoader;
		public var run:Flare3DLoader;
		public var run_aim:Flare3DLoader;
		public var run_fire:Flare3DLoader;
		public var jump:Flare3DLoader;
		
		static private var instance:SoldierAnimation;
		public static function getAnimation():SoldierAnimation
		{
			if (instance == null) instance = new SoldierAnimation()
			return instance;
		}
		
		public function SoldierAnimation() 
		{
			idle 			= new Flare3DLoader(Assets.IDLE_ANI );
			//aim 			= new Flare3DLoader(Assets.AIM_ANI );
			//fire 			= new Flare3DLoader(Assets.FIRE_ANI );
			//reload 			= new Flare3DLoader(Assets.RELOAD_ANI);
			walk 			= new Flare3DLoader(Assets.WALK_ANI);
			//walk_aim 		= new Flare3DLoader(Assets.WALK_AIM_ANI);
			//walk_fire 		= new Flare3DLoader(Assets.WALK_FIRE_ANI);
			run 			= new Flare3DLoader(Assets.RUN_ANI);
			//run_aim 		= new Flare3DLoader(Assets.RUN_AIM_ANI);
			//run_fire 		= new Flare3DLoader(Assets.RUN_FIRE_ANI);
			//crouch 				= new Flare3DLoader(Assets.CROUCH_ANI);
			//crouch_aim			= new Flare3DLoader(Assets.CROUCH_AIM_ANI);
			//crouch_fire			= new Flare3DLoader(Assets.CROUCH_FIRE_ANI);
			//crouch_walk			= new Flare3DLoader(Assets.CROUCH_WALK_ANI);
			//crouch_walk_aim		= new Flare3DLoader(Assets.CROUCH_WALK_AIM_ANI);
			//crouch_walk_fire	= new Flare3DLoader(Assets.CROUCH_WALK_FIRE_ANI);
			//crouch_run			= new Flare3DLoader(Assets.CROUCH_RUN_ANI);
			//crouch_run_aim		= new Flare3DLoader(Assets.CROUCH_RUN_AIM_ANI);
			//crouch_run_fire		= new Flare3DLoader(Assets.CROUCH_RUN_FIRE_ANI);
			//jump		= new Flare3DLoader(Assets.JUMP_ANI);
			
			GameEngine.scene.library.push( idle as Flare3DLoader );
			//GameEngine.scene.library.push( aim as Flare3DLoader );
			//GameEngine.scene.library.push( fire as Flare3DLoader );
			//GameEngine.scene.library.push( reload as Flare3DLoader );
			GameEngine.scene.library.push( walk as Flare3DLoader );
			//GameEngine.scene.library.push( walk_aim as Flare3DLoader );
			//GameEngine.scene.library.push( walk_fire as Flare3DLoader );
			GameEngine.scene.library.push( run as Flare3DLoader );
			//GameEngine.scene.library.push( run_aim as Flare3DLoader );
			//GameEngine.scene.library.push( run_fire as Flare3DLoader );
			//GameEngine.scene.library.push( crouch as Flare3DLoader );
			//GameEngine.scene.library.push( crouch_aim as Flare3DLoader );
			//GameEngine.scene.library.push( crouch_fire as Flare3DLoader );
			//GameEngine.scene.library.push( crouch_walk as Flare3DLoader );
			//GameEngine.scene.library.push( crouch_walk_aim as Flare3DLoader );
			//GameEngine.scene.library.push( crouch_walk_fire as Flare3DLoader );
			//GameEngine.scene.library.push( crouch_run as Flare3DLoader );
			//GameEngine.scene.library.push( crouch_run_aim as Flare3DLoader );
			//GameEngine.scene.library.push( crouch_run_fire as Flare3DLoader );
			//GameEngine.scene.library.push( jump as Flare3DLoader );
		}
		
		public function appendAnimation(model:Pivot3D):void
		{
			Pivot3DUtils.appendAnimation( model, idle				, IDLE);
			//Pivot3DUtils.appendAnimation( model, aim				, AIM);
			//Pivot3DUtils.appendAnimation( model, fire				, FIRE);
			//Pivot3DUtils.appendAnimation( model, reload				, RELOAD);
			Pivot3DUtils.appendAnimation( model, walk				, WALK );
			//Pivot3DUtils.appendAnimation( model, walk_aim			, WALK_AIM );
			//Pivot3DUtils.appendAnimation( model, walk_fire			, WALK_FIRE );
			Pivot3DUtils.appendAnimation( model, run				, RUN );
			//Pivot3DUtils.appendAnimation( model, run_aim			, RUN_AIM);
			//Pivot3DUtils.appendAnimation( model, run_fire			, RUN_FIRE);
			//Pivot3DUtils.appendAnimation( model, crouch				, CROUCH);
			//Pivot3DUtils.appendAnimation( model, crouch_aim			, CROUCH_AIM);
			//Pivot3DUtils.appendAnimation( model, crouch_fire		, CROUCH_FIRE);
			//Pivot3DUtils.appendAnimation( model, crouch_walk		, CROUCH_WALK);
			//Pivot3DUtils.appendAnimation( model, crouch_walk_aim	, CROUCH_WALK_AIM);
			//Pivot3DUtils.appendAnimation( model, crouch_walk_fire	, CROUCH_WALK_FIRE);
			//Pivot3DUtils.appendAnimation( model, crouch_run			, CROUCH_RUN);
			//Pivot3DUtils.appendAnimation( model, crouch_run_aim		, CROUCH_RUN_AIM);
			//Pivot3DUtils.appendAnimation( model, crouch_run_fire	, CROUCH_RUN_FIRE);
			//Pivot3DUtils.appendAnimation( model, jump				, JUMP );
		}
	}

}