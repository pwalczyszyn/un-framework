package com.riaspace.un
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public interface IUnFramework
	{
		function get eventDispatcher():IEventDispatcher;
		
		function dispatch(event:Event):Boolean;
		
		function listen(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void;
		
		function get context():Object;
		
		function inout(objectId:String, objectValue:* = null):*;
		
		function get service():IRemoteService;
		
		function execute(serviceId:String, methodName:String, args:Array = null, resultHandler:Function = null, faultHandler:Function = null):void;
	}
}