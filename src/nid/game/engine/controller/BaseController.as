package nid.game.engine.controller 
{
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class BaseController 
	{
		public var player_translateX:Number;
		public var player_translateY:Number;
		public var player_translateZ:Number;
		
		public var player_rotateX:Number;
		public var player_rotateY:Number;
		public var player_rotateZ:Number;
		
		public var player_x:Number;
		public var player_y:Number;
		public var player_z:Number;
		
		public var camera_translateX:Number;
		public var camera_translateY:Number;
		public var camera_translateZ:Number;
		
		public var camera_rotateX:Number;
		public var camera_rotateY:Number;
		public var camera_rotateZ:Number;
		
		public var camera_x:Number;
		public var camera_y:Number;
		public var camera_z:Number;
		
		/**
		 * Flags
		 */
		public var keyDown:Boolean;
		public var change:Boolean;
		public var isIdle:Boolean;
		public var jumping:Boolean;
		public var walking:Boolean;
		public var running:Boolean;
		public var crouching:Boolean;
		public var standing:Boolean;
		public var firing:Boolean;
		
		public var direction:String;
		
		public var oldPosition:Vector3D;
		
		public function BaseController() 
		{
			
		}
		
	}

}