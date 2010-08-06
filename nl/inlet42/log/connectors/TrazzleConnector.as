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
package nl.inlet42.log.connectors 
{
	import nl.inlet42.log.BaseLogger;
	import nl.inlet42.log.ILogger;

	import com.nesium.logging.TrazzleLogger;

	public class TrazzleConnector extends BaseLogger implements ILogger 
	{

		private static var _trazzle : TrazzleLogger;

		public function init() : void 
		{
			_trazzle = TrazzleLogger.instance(); 
		}

		public function sendDebug(... args) : void 
		{
			_trazzle.log("d" + " " + args, 0);
		}

		public function sendInfo(... args) : void 
		{
			_trazzle.log("i" + " " + args, 0);
		}

		public function sendNotice(... args) : void 
		{
			_trazzle.log("n" + " " + args, 0);
		}

		public function sendWarning(... args) : void 
		{
			_trazzle.log("e" + " " + args, 0);
		}

		public function sendError(... args) : void 
		{
			_trazzle.log("e" + " " + args, 0);
		}

		public function sendFatal(... args) : void 
		{
			_trazzle.log("f" + " " + args, 0);
		}

		public function sendCritical(... args) : void 
		{
			_trazzle.log("c" + " " + args, 0);
		}

		public function sendStatus(... args) : void 
		{
			_trazzle.log("s" + " " + args, 0);
		}
	}
}
