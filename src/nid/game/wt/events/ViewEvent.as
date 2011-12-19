package nid.game.wt.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class ViewEvent extends Event 
	{
		public static const VIEW_CHANGE:String = "view_change";
		
		public function get view():String { return String(data); }
		public var data:Object;
		
		public function ViewEvent(type:String,data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			this.data = data;
			super(type, bubbles, cancelable);
		} 
	}
}