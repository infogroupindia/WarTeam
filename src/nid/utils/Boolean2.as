package  nid.utils
{
	/**
	 * ...
	 * @author Nidin.P.Vinayak
	 */
	public final class Boolean2
	{
		
		public static function toBoolean(value:String):Boolean 
		{
			return value ==  null?false:(value.toLowerCase() == "true"?true:value.toLowerCase() == "y"?true:value.toLowerCase() == "yes"?true:false);
		}
		
	}

}