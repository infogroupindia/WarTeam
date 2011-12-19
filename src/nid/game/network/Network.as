package nid.game.network 
{
	import flash.events.EventDispatcher;
	import flash.net.XMLSocket;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class Network extends EventDispatcher 
	{
		public var session:Session;
		public var socket:XMLSocket;
		
		public function Network() 
		{
			session = new Session();
			socket = new XMLSocket();
		}
		public function init():void
		{
			
		}
	}

}