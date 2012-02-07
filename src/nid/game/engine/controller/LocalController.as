package nid.game.engine.controller 
{
	import flare.core.Pivot3D;
	import flare.system.Input3D;
	import flash.geom.Vector3D;
	import nid.game.engine.animation.SoldierAnimation;
	import nid.game.engine.GameEngine;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class LocalController extends BaseController implements IController 
	{
		public var walkVelocity:Number = 1.5;		
		public var runVelocity:Number = 3;		
		public var velocity:Vector3D;
		public var friction:Vector3D;
		
		private var loc_velocity:Number;
		private var model:Pivot3D;
		
		public function LocalController() 
		{
			velocity 	= new Vector3D();
			friction 	= new Vector3D();
			oldPosition = new Vector3D();
		}
		public function setModel(model:Pivot3D):void
		{
			this.model = model;
			
		}
		public function update():void
		{
			
			
			if ( Input3D.mouseDown )
			{
				model.rotateY(Input3D.mouseXSpeed);
				GameEngine.scene.camera.rotateX(Input3D.mouseYSpeed);
				firing = true;
			}
			
			loc_velocity = walkVelocity;
			
			direction = "";
			var state:String = "idle";
			
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
				direction = direction + (direction == ""?"":"_" ) + "left";
			}
			else if ( Input3D.keyDown( Input3D.D ) )
			{
				direction = direction + (direction == ""?"":"_" ) + "right";
			}
			
			direction = state + "_" + direction;
			if (Input3D.keyHit(Input3D.SHIFT)) change = true;
			if (Input3D.keyUp(Input3D.SHIFT)) change = true;
			if (Input3D.keyDown(Input3D.W) || Input3D.keyDown(Input3D.S) || Input3D.keyDown(Input3D.A) || Input3D.keyDown(Input3D.D))
			keyDown = true;
			else keyDown = false;

			if (change || (keyDown && isIdle))
			{
				trace('test');
				appyAnimation();
				isIdle = false;
				change = false;
			}
			else if(!keyDown && !isIdle)
			{
				isIdle = true;
				model.gotoAndPlay(SoldierAnimation.IDLE);
			}
			
			//if ( !jumping && Input3D.keyHit( Input3D.SPACE ) )
			//{
				//player_translateY = 10; 
				//jumping = true;
			//}
			
			//model.x += velocity.x;
			//model.y += velocity.y;
			//model.z += velocity.z;
			//
			//velocity.x = ( model.x - oldPosition.x ) * friction.x;
			//velocity.y = ( model.y - oldPosition.y ) * friction.y;
			//velocity.z = ( model.z - oldPosition.z ) * friction.z;
		}
		private function appyAnimation():void
		{
			trace(direction);
			switch(direction)
			{
				case "walk_forward":
				{
					model.gotoAndPlay(SoldierAnimation.WALK);
				}
				break;
				
				case "walk_backward":
				{
					model.gotoAndPlay(SoldierAnimation.WALK);
				}
				break;
				
				case "walk_left":
				{
					model.gotoAndPlay(SoldierAnimation.WALK);
				}
				break;
				
				case "walk_right":
				{
					model.gotoAndPlay(SoldierAnimation.WALK);
				}
				break;
				
				case "walk_forward_left":
				{
					model.gotoAndPlay(SoldierAnimation.WALK);
				}
				break;
				
				case "walk_forward_right":
				{
					model.gotoAndPlay(SoldierAnimation.WALK);
				}
				break;
				
				case "walk_backward_left":
				{
					model.gotoAndPlay(SoldierAnimation.WALK);
				}
				break;
				
				case "walk_backward_right":
				{
					model.gotoAndPlay(SoldierAnimation.WALK);
				}
				break;
				
				case "run_forward":
				{
					model.gotoAndPlay(SoldierAnimation.RUN);
				}
				break;
				
				case "run_backward":
				{
					model.gotoAndPlay(SoldierAnimation.RUN);
				}
				break;
				
				case "run_left":
				{
					model.gotoAndPlay(SoldierAnimation.RUN);
				}
				break;
				
				case "run_right":
				{
					model.gotoAndPlay(SoldierAnimation.RUN);
				}
				break;
				
				case "run_forward_left":
				{
					model.gotoAndPlay(SoldierAnimation.RUN);
				}
				break;
				
				case "run_forward_right":
				{
					model.gotoAndPlay(SoldierAnimation.RUN);
				}
				break;
				
				case "run_backward_left":
				{
					model.gotoAndPlay(SoldierAnimation.RUN);
				}
				break;
				case "run_backward_right":
				{
					model.gotoAndPlay(SoldierAnimation.RUN);
				}
				break;
				
			}
		}
	}

}