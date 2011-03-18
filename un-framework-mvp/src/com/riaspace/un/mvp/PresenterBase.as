package com.riaspace.un.mvp
{
	import flash.display.DisplayObject;

	public class PresenterBase extends ControllerBase
	{
		protected var view:DisplayObject;
		
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