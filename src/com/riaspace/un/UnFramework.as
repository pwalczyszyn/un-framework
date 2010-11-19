package com.riaspace.un
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class UnFramework implements IUnFramework
	{
		private var _eventDispatcher:IEventDispatcher = new EventDispatcher;
		
		private var _context:Context;
		
		private var _service:IRemoteServices;
		
		public function get dispatcher():IEventDispatcher
		{
			return _eventDispatcher;
		}

		public function listen(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			_eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function dispatch(event:Event):Boolean
		{
			return _eventDispatcher.dispatchEvent(event);
		}
		
		public function get context():Context
		{
			if (!_context)
				_context = new Context(_eventDispatcher);
			return _context;
		}
		
		public function inject(objectId:String, objectValue:*=null):*
		{
			if (objectValue)
				return context[objectId] = objectValue;
			else
				return context[objectId];
		}
		
		public function get services():IRemoteServices
		{
			if (!_service)
				_service = new RemoteServices;
			return _service;
		}
		
		public function execute(serviceId:String, methodName:String, args:Array=null, resultHandler:Function=null, faultHandler:Function=null):void
		{
			services.execute(serviceId, methodName, args, resultHandler, faultHandler);
		}
	}
}