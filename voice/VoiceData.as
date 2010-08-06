package voice 
{

	/**
	 *	@author Jankees.van.Woezik
	 */
	public class VoiceData 
	{

		public var pitch:Number;
		public var amplitude:Number;

		public function VoiceData(inPitch:Number,inAmplitude:Number) 
		{
			pitch = inPitch;
			amplitude = inAmplitude;
		}

		public function toString():String 
		{
			// voice.VoiceData
			return "VoiceData [pitch: " + pitch + " amplitude: " + amplitude + "]";
		}
	}
}
