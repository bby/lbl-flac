﻿package {	import util.NumberUtils;	import voice.BaseVoiceApplication;	import voice.VoiceDataEvent;	import flash.display.Loader;	import flash.display.Bitmap;	import flash.display.Sprite;	import flash.display.Shape;	import flash.geom.Point;	import flash.net.URLRequest;	import flash.events.Event;	import flash.text.TextField;    import flash.text.TextFieldType;	import flash.text.TextFormat;		import com.greensock.*;	import com.greensock.easing.*;	import com.greensock.plugins.*;	/**	 *@author Jankees.van.Woezik (base42.nl)	 *@author Patrick.Brouwer (base42.nl)	 *@version 2.0	 */	public class PitchDetector extends BaseVoiceApplication {				//try the following;		// - change according to colour		// - change to a word		// - make the word tilt by pitch				public static const GAME_WIDTH:Number = 800;		public static const GAME_HEIGHT:Number = 600;				private var high_pitch_image_loader:Loader;		private var low_pitch_image_loader:Loader;		private var imageLow:Bitmap;		private var imageHigh:Bitmap;		private var square:Shape;		        private var format1_fmt:TextFormat;		private var format2_fmt:TextFormat;		public function PitchDetector() {			high_pitch_image_loader = new Loader();			high_pitch_image_loader.load(new URLRequest("resources/beegees.jpg"));			high_pitch_image_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, highImageLoaded);			low_pitch_image_loader = new Loader();			low_pitch_image_loader.load(new URLRequest("resources/barrywhite.jpg"));			low_pitch_image_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, lowImageLoaded);			/*var squareSize:uint=100;			square = new Shape();			square.graphics.beginFill(0xFF0000, 0.5);			square.graphics.drawRect(0, 0, squareSize, squareSize);			square.graphics.endFill();			addChild(square);*/						format1_fmt = new TextFormat();			format1_fmt.color = "0xFF0000";						format2_fmt = new TextFormat();			format2_fmt.color = "0x00CC00";						TweenPlugin.activate([TransformMatrixPlugin]);		}		override protected function handleVoiceEvents(event:VoiceDataEvent):void {			super.handleVoiceEvents(event);			movePads();		}				private function lowImageLoaded(event:Event):void {			imageLow=new Bitmap(event.target.content.bitmapData);			//addChild(imageLow);		}		private function highImageLoaded(event:Event):void {			imageHigh=new Bitmap(event.target.content.bitmapData);			//addChild(imageHigh);		}		private function movePads():void {			var newY:Number;			//if (_voiceDataLeft.pitch>0) {								trace("pitch = " + _voiceDataLeft.pitch);				trace("volume = " + _voiceDataLeft.amplitude);				if (_voiceDataLeft.pitch>0.8) {					TweenMax.to(clip_mc, 2, {transformMatrix:{skewX:25}});				} else {					TweenMax.to(clip_mc, 0.2, {transformMatrix:{skewX:0}, delay:4});				}								/*if (_voiceDataLeft.amplitude > 80) {					TweenMax.to(clip_mc, 0, {colorTransform:{tint:0xff0000, tintAmount:1}});				} else {					TweenMax.to(clip_mc, 1.5, {colorTransform:{tint:0x00CC00, tintAmount:1}, delay:1.5});				}*/																/*trace(_voiceDataLeft.pitch * imageHigh.alpha);				square.scaleY = (_voiceDataLeft.amplitude / 60);    				newY = square.y + (calculateNewVerticalPosition(_voiceDataLeft.pitch) - square.y) * 0.1;				newY = NumberUtils.limit(newY,(square.height/2), GAME_HEIGHT - (square.height/2));    				square.y = newY;*/			//}			if (_voiceDataRight.pitch>0) {				/*if (_voiceDataLeft.pitch<1.2) {					imageLow.alpha=1;				} else {					imageLow.alpha=0;				}*/								/*square.scaleY = (_voiceDataRight.amplitude / 60);    				newY = square.y + (calculateNewVerticalPosition(_voiceDataRight.pitch) - square.y) * 0.1;				newY = NumberUtils.limit(newY,(square.height/2), GAME_HEIGHT- (square.height/2));				square.y = newY;*/			}		}				private function calculateNewVerticalPosition(inPitch:Number):Number		{			return stage.stageHeight - (stage.stageHeight * inPitch);						return 0;		}	}}