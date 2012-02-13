package nid.game.engine 
{
	import flare.basic.Scene3D;
	import flare.basic.Viewer3D;
	import flare.core.Camera3D;
	import flare.core.Pivot3D;
	import flare.loaders.Flare3DLoader1;
	import flare.system.Input3D;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Vector3D;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import nid.game.engine.controller.IController;
	import nid.game.engine.controller.LocalController;
	import nid.game.engine.controller.RemoteController;
	import nid.game.engine.data.GameData;
	import nid.game.engine.events.GameEvent;
	import nid.game.engine.player.Player;
	import nid.game.engine.world.Environment;
	import nid.game.managers.CursorManager;
	import nid.game.managers.SoundManager;
	import nid.game.wt.CONFIG;
	import nid.game.wt.game.Assets;
	import nid.game.wt.ui.Preloader;
	import nid.utils.Monitor;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class GameEngine extends EventDispatcher
	{
		public static var environment:Environment;
		public static var scene:Scene3D;
		public static var sound:SoundManager;
		
		private var stage:Stage;
		public var viewport:Viewport;
		private var playerStack:Vector.<Player>
		private var player:Player;
		private var oldPosition:Vector3D = new Vector3D();
		private var jump:Boolean;
		private var velocity:Vector3D = new Vector3D();
		private var friction:Vector3D = new Vector3D(0.6, 1, 0.6);
		private var preloader:Preloader;
		
		public function GameEngine(stage:Stage) 
		{
			this.stage 	= stage;
			viewport 	= new Viewport();
			stage.addChild(viewport);
			//stage.removeChild(viewport);
			
			preloader = new Preloader();
			sound = new SoundManager();
			
			init();
		}
		/**
		 * Game engine controls
		 */
		public function init():void
		{
			viewport.addChild(new Monitor());
			
			scene = new Viewer3D(viewport);
			//scene = new Scene3D(viewport);
			scene.addEventListener( Scene3D.COMPLETE_EVENT, completeEvent );
			scene.autoResize = true;
			scene.registerClass( Flare3DLoader1 );
			
			scene.camera = new Camera3D( "camera_1" );
			//scene.camera.setPosition( -100, 100, -20 );
			scene.camera.setPosition( 0, 80, 100 );
			scene.camera.lookAt( 0, 50, 0 );
			
			scene.pause();
			scene.addEventListener( Scene3D.PROGRESS_EVENT, progressEvent );
			scene.addEventListener( Scene3D.COMPLETE_EVENT, completeEvent );
			
			preloader.x = (stage.stageWidth - preloader.width) / 2;
			preloader.y = (stage.stageHeight - preloader.height) / 2;
			viewport.addChild(preloader);
			
			environment = new Environment(scene);
			environment.load();
			
			playerStack = new Vector.<Player>();
			
			/**
			 * Host Player
			 */
			var data:GameData = new GameData( CONFIG.hostID );
			data.model = "green_soldier";
			data.weapon = "m4";
			player = new Player(scene, data , new LocalController());
			playerStack.push(player);
		}
		
		private function completeEvent(e:Event):void 
		{
			if (viewport.contains(preloader)) viewport.removeChild(preloader);
			player.init();
			resume();
			Mouse.hide();
		}
		
		private function progressEvent(e:Event):void 
		{
			preloader.progress(scene.loadProgress);
		}
		
		public function resume():void
		{
			trace('Game resume');
			//Mouse.cursor = CursorManager.CROSS_HAIR;
			//Mouse.hide();
			scene.resume();
			scene.addEventListener( Scene3D.UPDATE_EVENT, render);
		}
		public function pause():void
		{
			trace('Game pauses');
			Mouse.cursor = MouseCursor.AUTO;
			Mouse.show();
			scene.removeEventListener( Scene3D.UPDATE_EVENT, render);
			scene.pause();
		}
		
		private function render(e:Event):void 
		{
			for (var i:int = 0; i < playerStack.length; i++)
			{
				playerStack[i].update();
				Mouse.cursor = CursorManager.CROSS_HAIR;
			}
		}
		
		/**
		 * Player controls
		 */
		public function join(data:GameData):void
		{
			if (valid(data.id))
			{
				var player:Player = new Player(scene, data, new RemoteController());
				playerStack.push(player);
				dispatchEvent(new GameEvent(GameEvent.JOIN, data));
			}
		}
		public function leave(id:int):void
		{
			var leaveIndex:int;
			
			for (var i:int = 0; i < playerStack.length; i++)
			{
				if (playerStack[i].id == id)
				{
					leaveIndex = i;
					playerStack[i].distroy();
				}
			}
			playerStack.splice(leaveIndex, 1);
		}
		public function valid(id:int):Boolean
		{
			for (var i:int = 0; i < playerStack.length; i++)
			{
				if (playerStack[i].id == id)
				return false;
			}
			return true;
		}
		public function resize():void 
		{
			//scene.setViewport( 0, 0, stage.stageWidth, stage.stageHeight, scene.antialias );
		}
	}

}