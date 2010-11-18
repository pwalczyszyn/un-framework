package com.riaspace.un 
{
	import com.riaspace.un.events.ContextPropertyChangeEvent;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import mx.events.PropertyChangeEventKind;
	
	use namespace flash_proxy;
	
	[Event(name="propertyChange", type="com.riaspace.un.events.ContextPropertyChangeEvent")]
	
	public dynamic class Context extends Proxy implements IEventDispatcher
	{
		
		private var _values:Object;
		
		private var _dispatcher:IEventDispatcher;
		
		public function Context(dispatcher:IEventDispatcher)
		{
			_dispatcher = dispatcher;
			_values = new Object();
		}
		
		flash_proxy override function getProperty(name:*):*
		{
			return _values[name];
		}
		
		flash_proxy override function setProperty(name:*, value:*):void
		{
			var oldValue:* = _values[name];
			_values[name] = value;
			var kind:String = PropertyChangeEventKind.UPDATE;
			dispatchEvent(new ContextPropertyChangeEvent(ContextPropertyChangeEvent.PROPERTY_CHANGE, false, false, kind, name, oldValue, value, this));
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return _dispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean
		{
			return _dispatcher.willTrigger(type);
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0.0, useWeakReference:Boolean=false):void
		{
			_dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			_dispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return _dispatcher.dispatchEvent(event);
		}
	}
}