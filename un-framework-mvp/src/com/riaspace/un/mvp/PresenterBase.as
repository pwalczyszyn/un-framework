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
	import flash.display.DisplayObject;

	public class PresenterBase extends ControllerBase
	{
		protected var view:Object;
		
		public function PresenterBase()
		{
			super();
		}
		
		override public function initialized(document:Object, id:String):void
		{
			view = DisplayObject(document);
			super.initialized(document, id);
		}
	}
}