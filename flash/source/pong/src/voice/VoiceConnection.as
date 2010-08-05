package voice 
{
	import nl.inlet42.log.Logger;

	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.XMLSocket;

	/**
	 *	@author Jankees.van.Woezik
	 */
	public class VoiceConnection extends XMLSocket 
	{

		private var _packetLeft:VoiceData;
		private var _packetRight:VoiceData;
		private var _event:VoiceDataEvent;

		private static const LOWEST_PITCH_FREQ:int = 150;
		private static const HIGHEST_PITCH_FREQ:int = 510;
		
		public function VoiceConnection()
		{
			Logger.info("Starting connection with: 127.0.0.1 on port 3000");
			
			_packetLeft = new VoiceData(0,0);
			_packetRight = new VoiceData(0,0);
			
		
			super("127.0.0.1",3000);
			configureListeners();
		}

		private function configureListeners():void 
		{
			addEventListener(Event.CLOSE,closeHandler);
			addEventListener(Event.CONNECT,connectHandler);
			addEventListener(DataEvent.DATA,dataHandler);
			addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
			addEventListener(ProgressEvent.PROGRESS,progressHandler);
			addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorHandler);
		}

		private function closeHandler(event:Event):void 
		{
			Logger.info("closeHandler: " + event);
		}

		private function connectHandler(event:Event):void 
		{
			Logger.info("connectHandler: " + event);
		}

		/**
            <?xml version="1.0"?>
            <OSCPACKET ADDRESS="127.0.0.1" PORT="54416" TIME="1">
                <MESSAGE NAME="data">
                    
                    <ARGUMENT TYPE="f" VALUE="230.0"/>
                    <ARGUMENT TYPE="f" VALUE="90.0"/>
                    
                    <ARGUMENT TYPE="f" VALUE="230.0"/>
                    <ARGUMENT TYPE="f" VALUE="90.0"/>
                
                </MESSAGE>
            </OSCPACKET>
		 */
		private function dataHandler(event:DataEvent):void 
		{
			// 125 = 0
			// 640 = 1
			_packetLeft.pitch = (XML(event.data).MESSAGE.ARGUMENT[0].@VALUE - LOWEST_PITCH_FREQ) / (HIGHEST_PITCH_FREQ - LOWEST_PITCH_FREQ);
			_packetLeft.amplitude = XML(event.data).MESSAGE.ARGUMENT[1].@VALUE;
			 
			_packetRight.pitch = (XML(event.data).MESSAGE.ARGUMENT[2].@VALUE - LOWEST_PITCH_FREQ) / (HIGHEST_PITCH_FREQ - LOWEST_PITCH_FREQ);
			_packetRight.amplitude = XML(event.data).MESSAGE.ARGUMENT[3].@VALUE;
		
			_event = new VoiceDataEvent();
			_event.data = [_packetLeft,_packetRight];
			
			dispatchEvent(_event);
		}

		private function ioErrorHandler(event:IOErrorEvent):void 
		{
			Logger.error("ioErrorHandler: " + event);
		}

		private function progressHandler(event:ProgressEvent):void 
		{
			Logger.info("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
		}

		private function securityErrorHandler(event:SecurityErrorEvent):void 
		{
			Logger.error("securityErrorHandler: " + event);
		}
	}
}
