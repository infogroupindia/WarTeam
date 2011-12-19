package nid.game.wt 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import nid.game.engine.GameEngine;
	import nid.game.network.Network;
	import nid.game.shell.UserInterface;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Application
	{
		public static var stage:Stage;
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
			
		}
		
		public function boot(root:DisplayObject):void
		{
			stage = root.stage;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			parameters = root.loaderInfo.parameters;
			
			ui = new UserInterface();
			network = new Network();
			
			stage.addChild(ui);
			ui.init();
			
			stage.addEventListener(Event.RESIZE, ui.resize);
			
			network = new Network();
		}
		
	}

}