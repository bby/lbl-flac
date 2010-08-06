package voice 
{
	import flash.events.Event;
	import nl.inlet42.log.Logger;
	import nl.inlet42.log.connectors.TrazzleConnector;

	import flash.display.Sprite;

	/**
	 *	@author Jankees.van.Woezik
	 */
	public class BaseVoiceApplication extends Sprite 
	{

		private var _voice:VoiceConnection;
		
		protected var _voiceDataLeft:VoiceData;
		protected var _voiceDataRight:VoiceData;
		
		public function BaseVoiceApplication()
		{
			Logger.addLogger(new TrazzleConnector());
            
			_voice = new VoiceConnection();
			_voice.addEventListener(VoiceDataEvent._EVENT,handleVoiceEvents);
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		protected function addedToStage(event : Event) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, dispose);
		}

		protected function dispose(event:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, dispose);
			_voice.removeEventListener(VoiceDataEvent._EVENT,handleVoiceEvents);
		}

		protected function handleVoiceEvents(event:VoiceDataEvent):void
		{
			_voiceDataLeft = event.data[0];
			_voiceDataRight = event.data[1];
		}
	}
}
