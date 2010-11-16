// ActionScript file
package 
{
	import flash.events.IEventDispatcher;
	
	public function get eventDispatcher():IEventDispatcher
	{
		return _dispatcher;
	}
}

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

var _dispatcher:IEventDispatcher = new EventDispatcher();