package com.riaspace.un
{
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public interface IRemoteService
	{
		function set config(value:Class):void;
		
		function getRemoteObject(remoteObjectId:String):RemoteObject;
			
		function callDirectly(token:AsyncToken, resultHandler:Function, faultHandler:Function):void;
		
		function call(serviceId:String, methodName:String, args:Array = null, resultHandler:Function = null, faultHandler:Function = null):void;
	}
}