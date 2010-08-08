﻿package com.label.scribble{	import flash.events.Event;	import com.label.timesquid.*;	import com.label.timesquid.bill.*;	import flash.display.MovieClip;	import flash.events.MouseEvent;	import flash.display.ActionScriptVersion;	import flash.events.KeyboardEvent;		import com.greensock.TweenMax;	import flash.text.TextField;	public class Scribble extends MovieClip	{		public var button:MovieClip;		public var scribbled:MovieClip;		public var hit_area:MovieClip;		public var billArm:com.label.timesquid.bill.Arm;		public var testButton:MovieClip;		var action:Action;		public var js1:MovieClip;		public var js2:MovieClip;		public var js3:MovieClip;		public var js4:MovieClip;		public var js5:MovieClip;		public var js6:MovieClip;		public var js7:MovieClip;		public var volume_reading:TextField;		public var pitchText:MovieClip;				protected var scribbledAlready:Boolean = false;		public var pitchDetector:PitchDetector;		public function Scribble()		{			trace("Init");			this.stop();			this.setup();			scribbledAlready = false;			TweenMax.from(button, 1, {alpha:0});			//Add key listener					}		public function setup():void		{			scribbled.gotoAndStop(1);			scribbled.visible = false;						trace("Setting up Action");			action = new Action();			action.addEventListener("Scribble", scribbleOut);						var aSocket = new Limb("127.0.0.1",5331,action);			aSocket.connect();						aSocket.addEventListener("ArduinoReady", setup);						button.addEventListener(MouseEvent.CLICK, nextLineEvent);		}				public function nextLineEvent(e:Event):void		{			trace("Next");			gotoAndStop(this.currentFrame+1);						switch(currentFrame)			{				case 7:					//Add snooga text										pitchText = new SnoggaText();					pitchText.x=437;					pitchText.y=200;					this.addChild(pitchText);					pitchDetector.setTargetClip(pitchText);					trace("pitchDetector", pitchDetector.clip_mc);					break;				case 8:										removeChild(pitchText);					pitchText = new HiText();					pitchText.x=437;					pitchText.y=230;					this.addChild(pitchText);					pitchDetector.setTargetClip(pitchText);					break;				case 9:					trace("HERE");					removeChild(pitchText);					pitchText = new YouLook();										pitchText.x=276;					pitchText.y=253;										this.addChild(pitchText);					pitchDetector.setTargetClip(pitchText);										break;			}		}				public function scribbleOut(e:Event):void		{						//What frame			switch(currentFrame)			{				case 2:				case 3:				case 4:										//350 - 500					var scale = action.theVal-300 ;					if (scale<0)					{						scale = 0;					}					//100% 					scale = ((100/250)*scale/200);										//js1.scaleX = 0.1+scale;					js1.scaleY = 0.1+scale;					//js2.scaleX = 0.1+scale;					js2.scaleY = 0.1+scale;					//js3.scaleX = 0.1+scale;					js3.scaleY = 0.1+scale;					//js4.scaleX = 0.1+scale;					js4.scaleY = 0.1+scale;					//js5.scaleX = 0.1+scale;					js5.scaleY = 0.1+scale;					//js6.scaleX = 0.1+scale;					js6.scaleY = 0.1+scale;					//js7.scaleX = 0.1+scale;					js7.scaleY = 0.1+scale;					break;				case 6:										if (!scribbledAlready && action.rawVal<350)					{						scribbledAlready = true;						scribbled.visible = true;						scribbled.gotoAndPlay(1);					}					break;				default:										break;			}		}	}}