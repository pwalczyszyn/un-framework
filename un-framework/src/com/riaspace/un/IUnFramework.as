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