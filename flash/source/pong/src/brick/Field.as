package brick 
{
	import util.NumberUtils;

	import flash.display.Sprite;

	/**
	 *	@author Jankees.van.Woezik
	 */
	public class Field extends Sprite 
	{

		private var _levelNumber:Number;
		private var _randomField:Boolean;
		private var blockStyle:int;
		private var _blocks:Array;

		public function Field(inLevelNumber:Number)
		{
			_levelNumber = inLevelNumber;
			
			_blocks = [];
			
			_randomField = true;

			var leni:uint = BrickLevel.WIDTH / (Block.WIDTH + 5);
			for (var i:uint = 0;i < leni;i ++) 
			{
				var lenj:uint = 5;
				for (var j:uint = 0;j < lenj;j ++) 
				{
					blockStyle = 5 - j;
					if(_randomField)
					{
						blockStyle = NumberUtils.randomBetween(0,5);
					}
					
					var block:Block = new Block(blockStyle);
					_blocks.push(block);
					block.x = i * (Block.WIDTH + 5); 
					block.y = j * (Block.HEIGHT + 5); 
					addChild(block);
				}
			}
		
			x = (BrickLevel.WIDTH - width) / 2;
			y = 15;
		}

		public function hitTest(inBall:Sprite):Block
		{
			var child:Block;
			var leni:uint = numChildren;
			for (var i:uint = 0;i < leni;i ++) 
			{
				try 
				{
					child = Block(getChildAt(i));
					if(child.hittest(inBall)) return child;
				} catch (e:Error) 
				{
					// a object has been removed so there is one i to much
				}
			}
			return null;
		}
		
		public function getBlocks():Array
		{
			return _blocks;
		}
	}
}
