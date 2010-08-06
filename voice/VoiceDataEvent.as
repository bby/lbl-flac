package voice 
{
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	public class VoiceDataEvent extends Event
	{

		/** Listen to this generic event: */
		public static const _EVENT:String = "VoiceDataEvent";
		//
		// public properties:
		public var subtype:String;
		public var data:Array;

		public function VoiceDataEvent() 
		{
			super(_EVENT,true);
		}

		override public function clone():Event 
		{
			var c:VoiceDataEvent = new VoiceDataEvent();
			return c;
		}

		override public function toString():String 
		{
			// voice.VoiceDataEvent
			return getQualifiedClassName(this);
		}
	}
}
