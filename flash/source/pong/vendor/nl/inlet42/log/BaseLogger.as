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
package nl.inlet42.log 
{

	public class BaseLogger 
	{

		protected var _firstLineNumber:uint = 4;

		protected function getSender():String
		{
			try 
			{
           	
				var senderCompleteErrorLine:String = new Error().getStackTrace().split("\n")[_firstLineNumber];

				var reg:RegExp = new RegExp(/[\[|\/]([\w.:]+)?:(\d+)\]/gi);

				var sender:Array = reg.exec(senderCompleteErrorLine);

				var s:String = sender[1] + ":" + sender[2];
            
				if(s.indexOf("NaN") == -1)
				{
					return s; // enable verbose stacktracing for this feature
				}
				else
				{
					return "";
				}
			} catch (e:Error) 
			{
				return "";
			}
			return "";
		}
	}
}
