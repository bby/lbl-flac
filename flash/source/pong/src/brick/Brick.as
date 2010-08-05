package brick
{
	import flash.events.Event;
	import fla.brick.Background;

	import voice.BaseVoiceApplication;
	import voice.VoiceDataEvent;

	import flash.display.Sprite;

	/**
	 *	@author Jankees.van.Woezik (base42.nl)
	 *	@author Patrick.Brouwer (base42.nl)
	 *	@version 2.0
	 */
	public class Brick extends BaseVoiceApplication
	{

		private var _holder : Sprite;
		private var _game : BrickLevel;

		public function Brick() 
		{
		}

		override protected function dispose(event : Event) : void
		{
			super.dispose(event);
			if (_game)
			{
				_game = null;
			}
		}

		override protected function addedToStage(event : Event) : void
		{
			super.addedToStage(event);
			addChild(new Background());
			
			_holder = new Sprite();
			_holder.x = _holder.y = 95;
			addChild(_holder);
			
			createLevel(0);
		}

		private function createLevel(levelNum : int) : void
		{
			if (_game)
			{
				_holder.removeChild(_game);
				_game = null;
			}
			
			_game = new BrickLevel(levelNum);
			_holder.addChild(_game);
		}

		override protected function handleVoiceEvents(event : VoiceDataEvent) : void
		{
			if (_game)
			{
				_game.input(event.data);
			}
		}
	}
}
