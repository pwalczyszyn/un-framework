package com.riaspace.un
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class UnFramework implements IUnFramework
	{
		private var _eventDispatcher:IEventDispatcher;
		
		private var _context:Context;
		
		private var _service:IRemoteService;
		
		public function UnFramework()
		{
			_eventDispatcher = new EventDispatcher;
		}
		
		public function get eventDispatcher():IEventDispatcher
		{
			return _eventDispatcher;
		}
		
		public function dispatch(event:Event):Boolean
		{
			return _eventDispatcher.dispatchEvent(event);
		}
		
		public function listen(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			_eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function get context():Object
		{
			if (!_context)
				_context = new Context(_eventDispatcher);
			
			return _context;
		}
		
		public function inout(objectId:String, objectValue:*=null):*
		{
			if (objectValue)
				return context[objectId] = objectValue;
			else
				return context[objectId];
		}
		
		public function get service():IRemoteService
		{
			if (!_service)
				_service = new RemoteService;
			return _service;
		}
		
		public function execute(serviceId:String, methodName:String, args:Array=null, resultHandler:Function=null, faultHandler:Function=null):void
		{
			service.execute(serviceId, methodName, args, resultHandler, faultHandler);
		}
	}

}