package nid.game.shell 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import nid.game.wt.events.ViewEvent;
	import nid.game.wt.view.DashBoardView;
	import nid.game.wt.view.GameView;
	import nid.game.wt.view.IView;
	import nid.game.wt.view.LoginView;
	import nid.game.wt.view.RegistrationView;
	import nid.game.wt.view.ViewList;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class UserInterface extends Sprite 
	{
		private var viewStack:Dictionary;
		private var current_view:IView;
		
		/**
		 * Layers
		 */
		private var view_layer:Sprite;
		private var status_layer:Sprite;
		private var fader_layer:Sprite;
		private var popup_layer:Sprite;
		
		public function UserInterface() 
		{
			view_layer = new Sprite();
			fader_layer = new Sprite();
			popup_layer = new Sprite();
			status_layer = new Sprite();
			
			addChild(view_layer);
			addChild(fader_layer);
			addChild(popup_layer);
			addChild(status_layer);
			
			viewStack = new Dictionary();
			
			viewStack[ViewList.DASHBOARD_VIEW] 		= new DashBoardView();
			viewStack[ViewList.LOGIN_VIEW] 			= new LoginView();
			viewStack[ViewList.REGISTRATION_VIEW] 	= new RegistrationView();
			viewStack[ViewList.GAME_VIEW] 			= new GameView();
		}
		public function init():void
		{
			current_view = viewStack[ViewList.LOGIN_VIEW];
			view_layer.addChild(viewStack[ViewList.LOGIN_VIEW]);
			current_view.open();
			current_view.align();
		}
		public function handleViewChange(e:ViewEvent):void 
		{
			flush();
			
			view_layer.addChild(viewStack[e.view]);
		}
		public function resize(e:Event):void
		{
			if (current_view != null) current_view.align();
		}
		private function flush():void 
		{
			if (current_view != null)
			{
				current_view.close();
			}
		}
	}

}