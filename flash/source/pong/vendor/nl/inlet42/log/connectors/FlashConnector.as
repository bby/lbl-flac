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

    public class FlashConnector extends BaseLogger implements ILogger 
    {

        public function init():void 
        {
        }

        public function sendDebug(...args):void 
        {
            trace("debug: " + args + getSender());
        }

        public function sendInfo(...args):void 
        {
            trace("info: " + args + getSender());
        }

        public function sendNotice(...args):void 
        {
            trace("notice: " + args + getSender());
        }

        public function sendWarning(...args):void 
        {
            trace("warning: " + args + getSender());
        }

        public function sendError(...args):void 
        {
            trace("error: " + args + getSender());
        }

        public function sendFatal(...args):void 
        {
            trace("fatal: " + args + getSender());
        }

        public function sendCritical(...args):void 
        {
            trace("critical: " + args + getSender());
        }

        public function sendStatus(...args):void 
        {
            trace("status: " + args + getSender());
        }
    }
}
