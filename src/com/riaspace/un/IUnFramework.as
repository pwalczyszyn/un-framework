package com.riaspace.un
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public interface IUnFramework extends IEventDispatcher
	{
		function get eventDispatcher():IEventDispatcher;
		
		function get context():Context;
		
		function inout(objectId:String, objectValue:* = null):*;
		
		function get services():IRemoteServices;
		
		function execute(serviceId:String, methodName:String, args:Array = null, resultHandler:Function = null, faultHandler:Function = null):void;
	}
}