package nid.game.engine.controller 
{
	import flare.core.Pivot3D;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public interface IController 
	{
		function update():void;		
		function setModel(model:Pivot3D):void;
	}
	
}