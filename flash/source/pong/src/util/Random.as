/**
 *   
 *  This file is part of AS3FlashProject.
 *
 *  AS3FlashProject is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License.
 *
 *  AS3FlashProject is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with AS3FlashProject.  If not, see <http://www.gnu.org/licenses/>.
 *  
 *  For more information contact one of the authors at www.inlet42.nl;
 *  
 */
 package util 
{

	/**
	 * @description 
	 * <p>This class offers some utils for Random stuff see code examples below:</p>
	 * 
	 */ 
	public class Random 
	{

		public static function color():uint 
		{
			return 0xffffff * Math.random();
		}

		/**
		 * @param inObjects is an array of object where you one from
		 * @use
		 * <code>
		 *    //returns "string1","string2","string3" or "string4" 
		 *    Random.Object(["string1","string2","string3","string4"]);
		 * </code>
		 *
		 */ 
		public static function object(inObjects:Array):Object 
		{
			var randomIndex:Number = Math.round(Math.random() * (inObjects.length - 1));
			return inObjects[randomIndex];
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
		public static function between(inFrom:Number, inTo:Number, inFloat:Boolean = false):Number 
		{
			var from:Number = (inFrom < inTo) ? inFrom : inTo;
			var to:Number = (inTo > inFrom) ? inTo : inFrom;
			return inFloat ? (from + Math.random() * Math.abs(to - from)) : (from + Math.round(Math.random() * Math.abs(to - from)));
		}
	}
}
