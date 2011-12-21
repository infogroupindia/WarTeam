package nid.game.wt.view 
{
	import flash.display.Sprite;
	import nid.game.wt.Application;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class LoginView extends LoginUI implements IView
	{
		
		public function LoginView() 
		{
			
		}
		
		public function get title():String { return ViewList.LOGIN_VIEW; }
		public function close():void 
		{
			this.fire.stop();
		}
		public function open():void 
		{
			this.fire.start();
		}
		
		public function align():void
		{
			this.x = (Application.stage.stageWidth - this.width) / 2;
			this.y = (Application.stage.stageHeight - this.height) / 2;
		}
	}

}