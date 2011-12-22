package nid.game.engine 
{
	import flare.basic.Scene3D;
	import flare.core.Camera3D;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class GameEngine extends EventDispatcher
	{
		private var stage:Stage;
		public var viewport:Viewport;
		private var environment:Environment;
		private var playerStack:Vector.<Player>
		private var scene:Scene3D;
		
		public function GameEngine(stage:Stage) 
		{
			this.stage 	= stage;
			viewport 	= new Viewport();
			stage.addChild(viewport);
			stage.removeChild(viewport);
			init();
		}
		/**
		 * Game engine controls
		 */
		public function init():void
		{
			scene = new Scene3D(viewport);
			scene.camera = new Camera3D( "camera_01" );
			scene.camera.setPosition( 0, 20, -10 );
			scene.camera.lookAt( 0, 0, 0 );
			
			scene.addEventListener( Scene3D.PROGRESS_EVENT, progressEvent );
			scene.addEventListener( Scene3D.COMPLETE_EVENT, completeEvent );
			scene.pause();
			
			environment = new Environment();
			playerStack = new Vector.<Player>();
		}
		
		private function completeEvent(e:Event):void 
		{
			
		}
		
		private function progressEvent(e:Event):void 
		{
			
		}
		
		private function render(e:Event):void 
		{
			
		}
		
		public function resume():void
		{
			addEventListener(Event.ENTER_FRAME, render);
		}
		public function pause():void
		{
			removeEventListener(Event.ENTER_FRAME, render);
		}
		
		/**
		 * Player controls
		 */
		public function join(data:Object):void
		{
			var player:Player = new Player(data);
			playerStack.push(player);
		}
		public function leave(id:int):void
		{
			var tmp_1:Vector.<Player> = new Vector.<Player>();
			
			for (var i:int = 0; i < playerStack.length; i++)
			{
				if (playerStack[i].id == id)
				{
					playerStack[i].distroy();
				}
				else
				{
					tmp_1.push(playerStack[i]);
				}
			}
			playerStack = null;
			playerStack = tmp_1;
		}
		
		public function resize():void 
		{
			
		}
	}

}