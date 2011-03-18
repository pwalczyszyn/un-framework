//////////////////////////////////////////////////////////////////////////////////////
//
//	Copyright 2011 Piotr Walczyszyn (http://riaspace.com | @pwalczyszyn)
//	
//	Licensed under the Apache License, Version 2.0 (the "License");
//	you may not use this file except in compliance with the License.
//	You may obtain a copy of the License at
//	
//		http://www.apache.org/licenses/LICENSE-2.0
//	
//	Unless required by applicable law or agreed to in writing, software
//	distributed under the License is distributed on an "AS IS" BASIS,
//	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//	See the License for the specific language governing permissions and
//	limitations under the License.
//	
//////////////////////////////////////////////////////////////////////////////////////

package com.riaspace.un
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class UnFramework implements IUnFramework
	{
		private var _eventDispatcher:IEventDispatcher = new EventDispatcher;
		
		private var _context:ApplicationModel;
		
		private var _service:IRemoteServices;
		
		public function get dispatcher():IEventDispatcher
		{
			return _eventDispatcher;
		}

		public function listen(type:String, listener:Function, priority:int = 0):void
		{
			_eventDispatcher.addEventListener(type, listener, false, priority, true);
		}
		
		public function dispatch(event:Event):Boolean
		{
			return _eventDispatcher.dispatchEvent(event);
		}
		
		public function get model():ApplicationModel
		{
			if (!_context)
				_context = new ApplicationModel(_eventDispatcher);
			return _context;
		}
		
		public function inject(objectId:String, objectValue:*, overwrite:Boolean = true):*
		{
			return overwrite ? model[objectId] = objectValue : model[objectId];
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