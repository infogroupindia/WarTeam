package nid.game.wt.view 
{
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public interface IView 
	{
		function get title():String;
		function close():void;
		function open():void;
		function align():void;
		function set alpha(value:Number):void;
		function set visible(Bool:Boolean):void;
	}
	
}