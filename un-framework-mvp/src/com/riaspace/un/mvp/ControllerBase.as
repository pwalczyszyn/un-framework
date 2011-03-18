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

package com.riaspace.un.mvp
{
	import com.riaspace.un.ApplicationModel;
	import com.riaspace.un.IRemoteServices;
	import com.riaspace.un.IUnFramework;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import mx.core.IMXMLObject;
	
	public class ControllerBase implements IMXMLObject, IUnFramework
	{
		public function ControllerBase()
		{
			super();
		}
		
		public function initialized(document:Object, id:String):void
		{
			// Calling postInitialized function, that function can be overriden by subclasses
			postInitialized();
		}
		
		/**
		 * This function can be overriden by subclasses
		 */
		protected function postInitialized():void
		{
		}

		/**
		 * Returns global application model.
		 * 
		 * PropertyChangeEvent handler can be registered with ApplicationModel instance.
		 */
		[Bindable(event="propertyChange")]
		public function get model():ApplicationModel
		{
			return $.model;
		}

		public function get services():IRemoteServices
		{
			return $.services;
		}
		
		public function get dispatcher():IEventDispatcher
		{
			return $.dispatcher;
		}
		
		public function inject(objectId:String, objectValue:*, overwrite:Boolean = true):*
		{
			return $.inject(objectId, objectValue, overwrite);
		}
		
		public function execute(serviceId:String, methodName:String, args:Array = null, resultHandler:Function = null, faultHandler:Function = null):void
		{
			$.execute(serviceId, methodName, args, resultHandler, faultHandler);
		}
		
		public function listen(type:String, listener:Function, priority:int = 0):void
		{
			$.listen(type, listener, priority);
		}
		
		public function dispatch(event:Event):Boolean
		{
			return $.dispatch(event);
		}
	}
}