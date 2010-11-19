package com.riaspace.un
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public interface IUnFramework
	{
		function get context():Context;
		
		function get services():IRemoteServices;

		function get dispatcher():IEventDispatcher;

		function inject(objectId:String, objectValue:* = null):*;
		
		function execute(serviceId:String, methodName:String, args:Array = null, resultHandler:Function = null, faultHandler:Function = null):void;
		
		function listen(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void;
		
		function dispatch(event:Event):Boolean;
	}
}