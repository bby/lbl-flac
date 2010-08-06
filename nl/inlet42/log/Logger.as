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

	public class Logger 
	{

		private static var loggers:Array = new Array();

		
		public static function addLoggers(loggers:Array):void 
		{
			for each (var logger : ILogger in loggers) 
			{
				addLogger(logger);
			}
		}

		public static function removeLoggers():void 
		{
			loggers = new Array();	
		}

		public static function addLogger(inLogger:ILogger):void 
		{
			inLogger.init();
			loggers.push(inLogger);
		}

		public static function debug(... args):void 
		{
			for each (var logger : ILogger in loggers) 
			{
				logger.sendDebug(args); 
			}
		}

		public static function info(... args):void 
		{
			for each (var logger : ILogger in loggers) 
			{
				logger.sendInfo(args); 
			}
		}

		public static function notice(... args):void 
		{
			for each (var logger : ILogger in loggers) 
			{
				logger.sendNotice(args); 
			}
		}

		public static function warning(... args):void 
		{
			for each (var logger : ILogger in loggers) 
			{
				logger.sendWarning(args); 
			}
		}

		public static function error(... args):void 
		{
			for each (var logger : ILogger in loggers) 
			{
				logger.sendError(args); 
			}
		}

		public static function fatal(... args):void 
		{
			for each (var logger : ILogger in loggers) 
			{
				logger.sendFatal(args); 
			}
		}

		public static function critical(... args):void 
		{
			for each (var logger : ILogger in loggers) 
			{
				logger.sendCritical(args); 
			}
		}

		public static function status(... args):void 
		{
			for each (var logger : ILogger in loggers) 
			{
				logger.sendStatus(args); 
			}
		}
	}
}
