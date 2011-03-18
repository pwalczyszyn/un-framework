package com.riaspace.un
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public interface IUnFramework
	{
		function get model():ApplicationModel;
		
		function get services():IRemoteServices;

		function get dispatcher():IEventDispatcher;

		function inject(objectId:String, objectValue:*, overwrite:Boolean = true):*;
		
		function execute(serviceId:String, methodName:String, args:Array = null, resultHandler:Function = null, faultHandler:Function = null):void;
		
		function listen(type:String, listener:Function, priority:int = 0):void;
		
		function dispatch(event:Event):Boolean;
	}
}