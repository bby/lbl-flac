package util 
{

	/**
	 * @author Patrick Brouwer [patrick at inlet dot nl]
	 */
	public class NumberUtils 
	{

		public static function limit(value:Number, min:Number, max:Number):Number 
		{
			return Math.min(Math.max(min,value),max);
		}

		/**
		 * Get a random number from start to end
		 * @param inFrom starting number
		 * @param inTo ending number
		 * @param inFloat use float, default false
		 * @use
		 * <code>
		 *      // returns a number between 8 and 19
		 *      Random.between(8, 19);
		 *      
		 *      // returns a float between 8 and 19, for example 7.87623
		 *      Random.between(8, 19, true);
		 * </code>
		 */
		public static function randomBetween(inFrom:Number, inTo:Number, inFloat:Boolean = false):Number 
		{
			var from:Number = (inFrom < inTo) ? inFrom : inTo;
			var to:Number = (inTo > inFrom) ? inTo : inFrom;
			return inFloat ? (from + Math.random() * Math.abs(to - from)) : (from + Math.round(Math.random() * Math.abs(to - from)));
		}
	}
}
