package nid.game.wt 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import nid.game.engine.GameEngine;
	import nid.game.network.Network;
	import nid.game.shell.UserInterface;
	import nid.game.wt.events.ViewEvent;
	import nid.game.wt.view.ViewList;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Application
	{
		public static var stage:Stage;
		public static var notifier:EventDispatcher;
		
		public var ui:UserInterface;
		public var game:GameEngine;
		public var network:Network;
		public var parameters:Object;
		
		private static var instance:Application;
		public static function getInstance():Application
		{
			if (instance == null) { instance = new Application(); }
			return instance;
		}
		
		public function Application() 
		{
			notifier = new EventDispatcher();
		}
		
		public function boot(root:DisplayObject):void
		{
			stage 			= root.stage;
			stage.align 	= StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			parameters 	= root.loaderInfo.parameters;
			
			network = new Network();
			game 	= new GameEngine(stage);
			ui 		= new UserInterface();
			
			stage.addChild(ui);
			ui.init();
			notifier.dispatchEvent(new ViewEvent(ViewEvent.VIEW_CHANGE, { view:ViewList.GAME_VIEW } ));
			stage.addEventListener(Event.RESIZE, ui.resize);
		}
		
	}

}