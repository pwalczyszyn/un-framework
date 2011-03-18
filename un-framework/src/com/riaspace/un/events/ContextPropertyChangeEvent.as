package com.riaspace.un.events
{
	import mx.events.PropertyChangeEvent;
	
	public class ContextPropertyChangeEvent extends PropertyChangeEvent
	{
		public static const PROPERTY_CHANGE:String = "propertyChange";
		
		public function ContextPropertyChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, kind:String=null, property:Object=null, oldValue:Object=null, newValue:Object=null, source:Object=null)
		{
			super(type, bubbles, cancelable, kind, property, oldValue, newValue, source);
		}
	}
}