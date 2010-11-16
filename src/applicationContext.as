// ActionScript file
package
{
	public function get applicationContext():ApplicationContext
	{
		return _applicationContext;
	}
}

var _applicationContext:ApplicationContext = new ApplicationContext();

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.utils.Proxy;
import flash.utils.flash_proxy;

import mx.events.PropertyChangeEvent;
import mx.events.PropertyChangeEventKind;

use namespace flash_proxy;

internal dynamic class ApplicationContext extends Proxy implements IEventDispatcher
{
	
	private var values:Object;
	
	private var contextEventHandler:IEventDispatcher;
	
	public function ApplicationContext()
	{
		contextEventHandler = new EventDispatcher(this);
		values = new Object();
	}
	
	flash_proxy override function getProperty(name:*):*
	{
		return values[name];
	}
	
	flash_proxy override function setProperty(name:*, value:*):void
	{
		var oldValue:* = values[name];
		values[name] = value;
		var kind:String = PropertyChangeEventKind.UPDATE;
		dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, kind, name, oldValue, value, this));
	}
	
	public function hasEventListener(type:String):Boolean
	{
		return contextEventHandler.hasEventListener(type);
	}
	
	public function willTrigger(type:String):Boolean
	{
		return contextEventHandler.willTrigger(type);
	}
	
	public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0.0, useWeakReference:Boolean=false):void
	{
		contextEventHandler.addEventListener(type, listener, useCapture, priority, useWeakReference);
	}
	
	public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
	{
		contextEventHandler.removeEventListener(type, listener, useCapture);
	}
	
	public function dispatchEvent(event:Event):Boolean
	{
		return contextEventHandler.dispatchEvent(event);
	}
}