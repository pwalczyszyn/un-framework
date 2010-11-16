// ActionScript file
package 
{
	import flash.events.IEventDispatcher;
	
	public function get eventDispatcher():IEventDispatcher
	{
		return _eventDispatcher;
	}
}

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

var _eventDispatcher:IEventDispatcher = new EventDispatcher();