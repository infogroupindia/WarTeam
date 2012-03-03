package nid.game.engine.controller 
{
	import flare.collisions.CollisionInfo;
	import flare.collisions.SphereCollision;
	import flare.core.Camera3D;
	import flare.core.Pivot3D;
	import flare.events.MouseEvent3D;
	import flare.system.Input3D;
	import flare.utils.Pivot3DUtils;
	import flash.geom.Vector3D;
	import flash.ui.Mouse;
	import nid.game.engine.animation.SoldierAnimation;
	import nid.game.engine.GameEngine;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class LocalController extends BaseController implements IController 
	{
		public var walkVelocity:Number = 1;		
		public var runVelocity:Number = 4;		
		public var velocity:Vector3D;
		public var friction:Vector3D;
		
		private var loc_velocity:Number;
		private var model:Pivot3D;
		private var camera:Camera3D;
		private var collisions:SphereCollision;
		
		public function LocalController() 
		{
			velocity 	= new Vector3D();
			friction 	= new Vector3D(0.3, 1, 0.3);
			oldPosition = new Vector3D();
		}
		public function setModel(model:Pivot3D):void
		{
			this.model = model;
			this.model.y = 10;
			this.model.rotateY(180);
			//this.model.z = 100;
			camera = GameEngine.scene.camera;
			oldPosition.copyFrom( model.getPosition() );
		}
		public function init():void
		{
			trace('#[LocalController] init();');
			collisions = new SphereCollision( model, 20);
			collisions.addCollisionWith( GameEngine.environment.level.getChildByName("wall"));
		}
		public function update():void
		{
			if ( Input3D.mouseHit) change = true;
			if ( Input3D.mouseUp) change = true;
			if ( Input3D.mouseDown )
			{
				firing = true;
				GameEngine.sound.play('m4fire');
				//model.rotateY(Input3D.mouseXSpeed);
			}
			else firing = false;
			
			model.rotateY(Input3D.mouseXSpeed / 2);
			
			loc_velocity = walkVelocity;
			
			direction = "";
			var state:String = "idle";
			
			if ( Input3D.keyDown( Input3D.R) ) 
			{
				reload = true;
				change = true;
			}
			
			if ( Input3D.keyDown( Input3D.SHIFT ) ) 
			{
				loc_velocity = runVelocity;
				running = true;
				state = "run";
			}
			else
			{
				state = "walk";
			}
			
			if ( Input3D.keyDown( Input3D.A ) ) model.translateX(loc_velocity);
			if ( Input3D.keyDown( Input3D.D ) ) model.translateX(-loc_velocity);
			if ( Input3D.keyDown( Input3D.S ) ) model.translateZ(loc_velocity);
			if ( Input3D.keyDown( Input3D.W ) ) model.translateZ(-loc_velocity);
			
			if ( Input3D.keyDown( Input3D.W ) )
			{
				direction = "forward";
			}
			else if ( Input3D.keyDown( Input3D.S ) )
			{
				direction = "backward";
			}
			
			if ( Input3D.keyDown( Input3D.A ) )
			{
				direction = direction + (direction == ""?"":"_") + "left";
			}
			else if ( Input3D.keyDown( Input3D.D ) )
			{
				direction = direction + (direction == ""?"":"_" ) + "right";
			}
			
			direction = state + "_" + direction;
			if (Input3D.keyHit(Input3D.SHIFT) || Input3D.keyUp(Input3D.SHIFT)) change = true;
			
			if (Input3D.keyHit(Input3D.W) || Input3D.keyHit(Input3D.A) || Input3D.keyHit(Input3D.S) || Input3D.keyHit(Input3D.D)
				|| Input3D.keyUp(Input3D.W) || Input3D.keyUp(Input3D.A) || Input3D.keyUp(Input3D.S) || Input3D.keyUp(Input3D.D)
				) change = true;
			
			if (Input3D.keyDown(Input3D.W) || Input3D.keyDown(Input3D.S) || Input3D.keyDown(Input3D.A) || Input3D.keyDown(Input3D.D))
			keyDown = true;
			else keyDown = false;

			if (change || (keyDown && isIdle))
			{
				appyAnimation();
				isIdle = false;
				change = false;
			}
			else if(!keyDown && (!isIdle || change))
			{
				isIdle = true;
				change = false;
				model.gotoAndPlay(firing?SoldierAnimation.FIRE:SoldierAnimation.STAND);
			}
			
			/**
			 * Physics
			 */
			
			if ( !jumping && Input3D.keyHit( Input3D.SPACE ) )
			{
				model.translateY( 10 ); 
				jumping = true;
			}
			
			model.x += velocity.x;
			model.y += velocity.y - 0.75;
			model.z += velocity.z;
			
			model.y  = model.y < 0?0:model.y;
			//trace(collisions.slider());
			
			if ( collisions.slider() )
			{
				var info:CollisionInfo = collisions.data[0];
				if ( info.normal.y > 0.8 ) jumping = false;
			}
			
			velocity.x = ( model.x - oldPosition.x ) * friction.x;
			velocity.y = ( model.y - oldPosition.y ) * friction.y;
			velocity.z = ( model.z - oldPosition.z ) * friction.z;
			
			oldPosition.copyFrom( model.getPosition() );
			
			//camera
			Pivot3DUtils.setPositionWithReference( camera, 0, 100, 100, model, 0.1 );
			Pivot3DUtils.lookAtWithReference( camera, 0, 50, 0, model);
		}
		
		
		private function appyAnimation():void
		{
			trace(direction);
			if (reload)
			{
				reload = false;
				model.gotoAndPlay(SoldierAnimation.RELOAD);
				return;
			}
			switch(direction)
			{
				case "walk_forward":
				{
					model.gotoAndPlay(firing?SoldierAnimation.WALK_FIRE:SoldierAnimation.WALK);
				}
				break;
				
				case "walk_backward":
				{
					model.gotoAndPlay(firing?SoldierAnimation.WALK_BACK_FIRE:SoldierAnimation.WALK_BACK);
				}
				break;
				
				case "walk_backward_left":
				case "walk_left":
				case "walk_forward_left":
				{
					model.gotoAndPlay(firing?SoldierAnimation.WALK_LEFT_FIRE:SoldierAnimation.WALK_LEFT);
				}
				break;
				
				case "walk_backward_right":
				case "walk_forward_right":
				case "walk_right":
				{
					model.gotoAndPlay(firing?SoldierAnimation.WALK_RIGHT_FIRE:SoldierAnimation.WALK_RIGHT);
				}
				break;
				
				//case "walk_forward_left":
				//{
					//model.gotoAndPlay(SoldierAnimation.WALK_LEFT);
				//}
				//break;
				//
				//case "walk_forward_right":
				//{
					//model.gotoAndPlay(SoldierAnimation.WALK_RIGHT);
				//}
				//break;
				
				//case "walk_backward_left":
				//{
					//model.gotoAndPlay(SoldierAnimation.WALK_LEFT);
				//}
				//break;
				//
				//case "walk_backward_right":
				//{
					//model.gotoAndPlay(SoldierAnimation.WALK_RIGHT);
				//}
				//break;
				
				case "run_forward":
				{
					model.gotoAndPlay(firing?SoldierAnimation.RUN_FIRE:SoldierAnimation.RUN);
				}
				break;
				
				case "run_backward":
				{
					model.gotoAndPlay(firing?SoldierAnimation.RUN_BACK_FIRE:SoldierAnimation.RUN_BACK);
				}
				break;
				
				case "run_backward_left":
				case "run_forward_left":
				case "run_left":
				{
					model.gotoAndPlay(firing?SoldierAnimation.RUN_LEFT_FIRE:SoldierAnimation.RUN_LEFT);
				}
				break;
				
				case "run_backward_right":
				case "run_forward_right":
				case "run_right":
				{
					model.gotoAndPlay(firing?SoldierAnimation.RUN_RIGHT_FIRE:SoldierAnimation.RUN_RIGHT);
				}
				break;
				
				//case "run_forward_left":
				//{
					//model.gotoAndPlay(SoldierAnimation.RUN_LEFT);
				//}
				//break;
				//
				//case "run_forward_right":
				//{
					//model.gotoAndPlay(SoldierAnimation.RUN_RIGHT);
				//}
				//break;
				//
				//case "run_backward_left":
				//{
					//model.gotoAndPlay(SoldierAnimation.RUN_BACK);
				//}
				//break;
				//case "run_backward_right":
				//{
					//model.gotoAndPlay(SoldierAnimation.RUN_BACK);
				//}
				//break;
				
			}
		}
	}

}