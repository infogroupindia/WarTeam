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
		static public const STAND:String 			= "stand";
		
		static public const RELAX_WALK:String 		= "relax_walk";
		static public const WALK:String 			= "walk";
		static public const WALK_AIM:String 		= "walkAim";
		static public const WALK_FIRE:String 		= "walkFire";
		
		static public const WALK_BACK:String 			= "walkBack";
		static public const WALK_BACK_AIM:String 		= "walkBackAim";
		static public const WALK_BACK_FIRE:String 		= "walkBackFire";
		
		static public const WALK_LEFT:String 			= "walkLeft";
		static public const WALK_LEFT_AIM:String 		= "walkLeftAim";
		static public const WALK_LEFT_FIRE:String 		= "walkLeftFire";
		
		static public const WALK_RIGHT:String 			= "walkRight";
		static public const WALK_RIGHT_AIM:String 		= "walkRightAim";
		static public const WALK_RIGHT_FIRE:String 		= "walkRightFire";
		
		static public const RUN:String 					= "run";
		static public const RUN_AIM:String 				= "runAim";
		static public const RUN_FIRE:String 			= "runFire";
		
		static public const RUN_BACK:String 			= "runBack";
		static public const RUN_BACK_AIM:String 		= "runBackAim";
		static public const RUN_BACK_FIRE:String 		= "runBackFire";
		
		static public const RUN_LEFT:String 			= "runLeft";
		static public const RUN_LEFT_AIM:String 		= "runLeftAim";
		static public const RUN_LEFT_FIRE:String 		= "runLeftFire";
		
		static public const RUN_RIGHT:String 			= "runRight";
		static public const RUN_RIGHT_AIM:String 		= "runRightAim";
		static public const RUN_RIGHT_FIRE:String 		= "runRightFire";
		
		static public const CROUCH:String 					= "crouch";
		static public const CROUCH_AIM:String 				= "crouchAim";
		static public const CROUCH_FIRE:String 				= "crouchFire";
		
		static public const CROUCH_WALK:String 				= "crouchWalk";
		static public const CROUCH_WALK_AIM:String 			= "crouchWalkAim";
		static public const CROUCH_WALK_FIRE:String 		= "crouchWalkFire";
		
		static public const CROUCH_WALK_BACK:String 		= "crouchWalkBack";
		static public const CROUCH_WALK_BACK_AIM:String 	= "crouchWalkBackAim";
		static public const CROUCH_WALK_BACK_FIRE:String 	= "crouchWalkBackFire";
		
		static public const CROUCH_WALK_LEFT:String 		= "crouchWalkLeft";
		static public const CROUCH_WALK_LEFT_AIM:String 	= "crouchWalkLeftAim";
		static public const CROUCH_WALK_LEFT_FIRE:String 	= "crouchWalkLeftFire";
		
		static public const CROUCH_WALK_RIGHT:String 		= "crouchWalkRight";
		static public const CROUCH_WALK_RIGHT_AIM:String 	= "crouchWalkRightAim";
		static public const CROUCH_WALK_RIGHT_FIRE:String 	= "crouchWalkRightFire";
		
		static public const CROUCH_RUN:String 				= "crouchRun";
		static public const CROUCH_RUN_AIM:String 			= "crouchRunAim";
		static public const CROUCH_RUN_FIRE:String 			= "crouchRunFire";
		
		static public const CROUCH_RUN_BACK:String 			= "crouchRunBack";
		static public const CROUCH_RUN_BACK_AIM:String 		= "crouchRunBackAim";
		static public const CROUCH_RUN_BACK_FIRE:String 	= "crouchRunBackFire";
		
		static public const CROUCH_RUN_LEFT:String 			= "crouchRunLeft";
		static public const CROUCH_RUN_LEFT_AIM:String 		= "crouchRunLeftAim";
		static public const CROUCH_RUN_LEFT_FIRE:String 	= "crouchRunLeftFire";
		
		static public const CROUCH_RUN_RIGHT:String 		= "crouchRunRight";
		static public const CROUCH_RUN_RIGHT_AIM:String 	= "crouchRunRightAim";
		static public const CROUCH_RUN_RIGHT_FIRE:String 	= "crouchRunRightFire";
		
		static public const JUMP:String = "jump";
		
		public var crouch:Animation;
		public var crouch_aim:Animation;
		public var crouch_fire:Animation;
		
		public var crouch_walk:Animation;
		public var crouch_walk_aim:Animation;
		public var crouch_walk_fire:Animation;
		public var crouch_walk_back:Animation;
		public var crouch_walk_back_aim:Animation;
		public var crouch_walk_back_fire:Animation;
		public var crouch_walk_left:Animation;
		public var crouch_walk_left_aim:Animation;
		public var crouch_walk_left_fire:Animation;
		public var crouch_walk_right:Animation;
		public var crouch_walk_right_aim:Animation;
		public var crouch_walk_right_fire:Animation;
		
		public var crouch_run:Animation;
		public var crouch_run_aim:Animation;
		public var crouch_run_fire:Animation;
		public var crouch_run_back:Animation;
		public var crouch_run_back_aim:Animation;
		public var crouch_run_back_fire:Animation;
		public var crouch_run_left:Animation;
		public var crouch_run_left_aim:Animation;
		public var crouch_run_left_fire:Animation;
		public var crouch_run_right:Animation;
		public var crouch_run_right_aim:Animation;
		public var crouch_run_right_fire:Animation;
		
		public var idle:Animation;
		public var aim:Animation;
		public var fire:Animation;
		public var reload:Animation;
		public var stand:Animation;
		
		public var relax_walk:Animation;
		public var walk:Animation;
		public var walk_aim:Animation;
		public var walk_fire:Animation;
		public var walk_back:Animation;
		public var walk_back_aim:Animation;
		public var walk_back_fire:Animation;
		public var walk_left:Animation;
		public var walk_left_aim:Animation;
		public var walk_left_fire:Animation;
		public var walk_right:Animation;
		public var walk_right_aim:Animation;
		public var walk_right_fire:Animation;
		
		public var run:Animation;
		public var run_aim:Animation;
		public var run_fire:Animation;
		public var run_back:Animation;
		public var run_back_aim:Animation;
		public var run_back_fire:Animation;
		public var run_left:Animation;
		public var run_left_aim:Animation;
		public var run_left_fire:Animation;
		public var run_right:Animation;
		public var run_right_aim:Animation;
		public var run_right_fire:Animation;
		
		public var jump:Animation;
		
		public var animations:Vector.<Animation>;
		
		static private var instance:SoldierAnimation;
		public static function getAnimation():SoldierAnimation
		{
			if (instance == null) instance = new SoldierAnimation()
			return instance;
		}
		
		public function SoldierAnimation() 
		{
			animations = new Vector.<Animation>();
			
			idle 			= new Animation(new Flare3DLoader(Assets.IDLE_ANI ), IDLE);
			stand 			= new Animation(new Flare3DLoader(Assets.STAND_ANI), STAND);
			aim 			= new Animation(new Flare3DLoader(Assets.AIM_ANI ), AIM);
			fire 			= new Animation(new Flare3DLoader(Assets.FIRE_ANI ), FIRE);
			reload 			= new Animation(new Flare3DLoader(Assets.RELOAD_ANI), RELOAD);
			
			relax_walk 		= new Animation(new Flare3DLoader(Assets.RELAX_WALK_ANI), RELAX_WALK);
			walk 			= new Animation(new Flare3DLoader(Assets.WALK_ANI), WALK);
			walk_aim 		= new Animation(new Flare3DLoader(Assets.WALK_AIM_ANI), WALK_AIM);
			walk_fire 		= new Animation(new Flare3DLoader(Assets.WALK_FIRE_ANI), WALK_FIRE);
			
			walk_back 		= new Animation(new Flare3DLoader(Assets.WALK_BACK_ANI), WALK_BACK);
			walk_back_aim 	= new Animation(new Flare3DLoader(Assets.WALK_BACK_AIM_ANI), WALK_BACK_AIM);
			walk_back_aim 	= new Animation(new Flare3DLoader(Assets.WALK_BACK_FIRE_ANI), WALK_BACK_FIRE);
			
			walk_left 		= new Animation(new Flare3DLoader(Assets.WALK_LEFT_ANI), WALK_LEFT);
			walk_left_aim 	= new Animation(new Flare3DLoader(Assets.WALK_LEFT_AIM_ANI), WALK_LEFT_AIM);
			walk_left_aim 	= new Animation(new Flare3DLoader(Assets.WALK_LEFT_FIRE_ANI), WALK_LEFT_FIRE);
			
			walk_right 		= new Animation(new Flare3DLoader(Assets.WALK_RIGHT_ANI), WALK_RIGHT);
			walk_right_aim 	= new Animation(new Flare3DLoader(Assets.WALK_RIGHT_AIM_ANI), WALK_RIGHT_AIM);
			walk_right_aim 	= new Animation(new Flare3DLoader(Assets.WALK_RIGHT_FIRE_ANI), WALK_RIGHT_FIRE);
			
			run 			= new Animation(new Flare3DLoader(Assets.RUN_ANI), RUN);
			run_aim 		= new Animation(new Flare3DLoader(Assets.RUN_AIM_ANI), RUN_AIM);
			run_fire 		= new Animation(new Flare3DLoader(Assets.RUN_FIRE_ANI), RUN_FIRE);
			
			run_back 			= new Animation(new Flare3DLoader(Assets.RUN_BACK_ANI), RUN_BACK);
			run_back_aim 		= new Animation(new Flare3DLoader(Assets.RUN_BACK_AIM_ANI), RUN_BACK_AIM);
			run_back_fire 		= new Animation(new Flare3DLoader(Assets.RUN_BACK_FIRE_ANI), RUN_BACK_FIRE);
			
			run_left 			= new Animation(new Flare3DLoader(Assets.RUN_LEFT_ANI), RUN_LEFT);
			run_left_aim 		= new Animation(new Flare3DLoader(Assets.RUN_LEFT_AIM_ANI), RUN_LEFT_AIM);
			run_left_fire 		= new Animation(new Flare3DLoader(Assets.RUN_LEFT_FIRE_ANI), RUN_LEFT_FIRE);
			
			run_right 			= new Animation(new Flare3DLoader(Assets.RUN_RIGHT_ANI), RUN_RIGHT);
			run_right_aim 		= new Animation(new Flare3DLoader(Assets.RUN_RIGHT_AIM_ANI), RUN_RIGHT_AIM);
			run_right_fire 		= new Animation(new Flare3DLoader(Assets.RUN_RIGHT_FIRE_ANI), RUN_RIGHT_FIRE);
			
			crouch 				= new Animation(new Flare3DLoader(Assets.CROUCH_ANI), CROUCH);
			crouch_aim			= new Animation(new Flare3DLoader(Assets.CROUCH_AIM_ANI), CROUCH_AIM);
			crouch_fire			= new Animation(new Flare3DLoader(Assets.CROUCH_FIRE_ANI), CROUCH_FIRE);
			
			crouch_walk			= new Animation(new Flare3DLoader(Assets.CROUCH_WALK_ANI), CROUCH_WALK);
			crouch_walk_aim		= new Animation(new Flare3DLoader(Assets.CROUCH_WALK_AIM_ANI), CROUCH_WALK_AIM);
			crouch_walk_fire	= new Animation(new Flare3DLoader(Assets.CROUCH_WALK_FIRE_ANI), CROUCH_WALK_FIRE);
			
			crouch_walk_back			= new Animation(new Flare3DLoader(Assets.CROUCH_WALK_ANI), CROUCH_WALK_BACK);
			crouch_walk_back_aim		= new Animation(new Flare3DLoader(Assets.CROUCH_WALK_AIM_ANI), CROUCH_WALK_BACK_AIM);
			crouch_walk_back_fire		= new Animation(new Flare3DLoader(Assets.CROUCH_WALK_FIRE_ANI), CROUCH_WALK_BACK_FIRE);
			
			crouch_walk_left			= new Animation(new Flare3DLoader(Assets.CROUCH_WALK_ANI), CROUCH_WALK_LEFT);
			crouch_walk_left_aim		= new Animation(new Flare3DLoader(Assets.CROUCH_WALK_AIM_ANI), CROUCH_WALK_LEFT_AIM);
			crouch_walk_left_fire		= new Animation(new Flare3DLoader(Assets.CROUCH_WALK_FIRE_ANI), CROUCH_WALK_LEFT_FIRE);
			
			crouch_walk_right			= new Animation(new Flare3DLoader(Assets.CROUCH_WALK_ANI), CROUCH_WALK_RIGHT);
			crouch_walk_right_aim		= new Animation(new Flare3DLoader(Assets.CROUCH_WALK_AIM_ANI), CROUCH_WALK_RIGHT_AIM);
			crouch_walk_right_fire		= new Animation(new Flare3DLoader(Assets.CROUCH_WALK_FIRE_ANI), CROUCH_WALK_RIGHT_FIRE);
			
			crouch_run			= new Animation(new Flare3DLoader(Assets.CROUCH_RUN_ANI), CROUCH_RUN);
			crouch_run_aim		= new Animation(new Flare3DLoader(Assets.CROUCH_RUN_AIM_ANI), CROUCH_RUN_AIM);
			crouch_run_fire		= new Animation(new Flare3DLoader(Assets.CROUCH_RUN_FIRE_ANI), CROUCH_RUN_FIRE);
			
			crouch_run_back				= new Animation(new Flare3DLoader(Assets.CROUCH_RUN_ANI), CROUCH_RUN_BACK);
			crouch_run_back_aim			= new Animation(new Flare3DLoader(Assets.CROUCH_RUN_AIM_ANI), CROUCH_RUN_BACK_AIM);
			crouch_run_back_fire		= new Animation(new Flare3DLoader(Assets.CROUCH_RUN_FIRE_ANI), CROUCH_RUN_BACK_FIRE);
			
			crouch_run_left				= new Animation(new Flare3DLoader(Assets.CROUCH_RUN_ANI), CROUCH_RUN_LEFT);
			crouch_run_left_aim			= new Animation(new Flare3DLoader(Assets.CROUCH_RUN_AIM_ANI), CROUCH_RUN_LEFT_AIM);
			crouch_run_left_fire		= new Animation(new Flare3DLoader(Assets.CROUCH_RUN_FIRE_ANI), CROUCH_RUN_LEFT_FIRE);
			
			crouch_run_right			= new Animation(new Flare3DLoader(Assets.CROUCH_RUN_ANI), CROUCH_RUN_RIGHT);
			crouch_run_right_aim		= new Animation(new Flare3DLoader(Assets.CROUCH_RUN_AIM_ANI), CROUCH_RUN_RIGHT_AIM);
			crouch_run_right_fire		= new Animation(new Flare3DLoader(Assets.CROUCH_RUN_FIRE_ANI), CROUCH_RUN_RIGHT_FIRE);
			
			//jump		= new Animation(new Flare3DLoader(Assets.JUMP_ANI), IDLE);
			
			
			animations.push(idle);
			animations.push(stand);
			animations.push(aim);
			animations.push(fire);
			animations.push(reload);
			
			animations.push(relax_walk);
			animations.push(walk);
			animations.push(walk_aim);
			animations.push(walk_fire);
			
			animations.push(walk_back);
			animations.push(walk_back_aim);
			animations.push(walk_back_fire);
			
			animations.push(walk_left);
			animations.push(walk_left_aim);
			animations.push(walk_left_fire);
			
			animations.push(walk_right);
			animations.push(walk_right_aim);
			animations.push(walk_right_fire);
			
			animations.push(run);
			animations.push(run_aim);
			animations.push(run_fire);
			
			animations.push(run_back);
			animations.push(run_back_aim);
			animations.push(run_back_fire);
			
			animations.push(run_left);
			animations.push(run_left_aim);
			animations.push(run_left_fire);
			
			animations.push(run_right);
			animations.push(run_right_aim);
			animations.push(run_right_fire);
			
			//animations.push(crouch);
			//animations.push(crouch_aim);
			//animations.push(crouch_fire);
			
			//animations.push(crouch_walk_back);
			//animations.push(crouch_walk_back_aim);
			//animations.push(crouch_walk_back_fire);
			//animations.push(crouch_walk_left);
			//animations.push(crouch_walk_left_aim);
			//animations.push(crouch_walk_left_fire);
			//animations.push(crouch_walk_right);
			//animations.push(crouch_walk_right_aim);
			//animations.push(crouch_walk_right_fire);
			//
			//animations.push(crouch_run_back);
			//animations.push(crouch_run_back_aim);
			//animations.push(crouch_run_back_fire);
			//animations.push(crouch_run_left);
			//animations.push(crouch_run_left_aim);
			//animations.push(crouch_run_left_fire);
			//animations.push(crouch_run_right);
			//animations.push(crouch_run_right_aim);
			//animations.push(crouch_run_right_fire);
			
			
			for (var i:int = 0; i < animations.length; i++)
			{
				if (animations[i] != null && animations[i].data != null) GameEngine.scene.library.push( animations[i].data as Flare3DLoader );
			}
			
		}
		
		public function appendAnimation(model:Pivot3D):void
		{
			
			for (var i:int = 0; i < animations.length; i++)
			{
				if (animations[i] != null && animations[i].data != null) Pivot3DUtils.appendAnimation( model, animations[i].data, animations[i].name);
			}
		}
	}

}