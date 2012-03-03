package nid.game.managers 
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author Nidin P Vinayakan
	 */
	public class SoundManager 
	{
		[Embed(source="./sound/sounds.swf", symbol="m4_shoot")]
		private var m4Wav:Class;
		
		private var channel:SoundChannel;
		private var mp4fireFx:Sound;
		private var busy:Boolean;
		
		public function SoundManager() 
		{
			mp4fireFx = new m4Wav() as Sound;
		}
		public function play(name:String):void
		{
			if (!busy)
			{
				if (channel != null) channel.stop();
				busy = true;
				channel = mp4fireFx.play();
				channel.soundTransform = new SoundTransform(0.25);
				setTimeout(function():void { busy = false; }, 60);
			}
		}
	}

}