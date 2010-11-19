package com.riaspace.un
{
	import com.riaspace.un.IRemoteServices;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.remoting.Operation;
	import mx.rpc.remoting.RemoteObject;
	
	public class RemoteServices implements IRemoteServices
	{
		private var configObj:Object;
		
		public function configure(config:Object):void
		{
			if (config is Class)
				configObj = new config();
			else
				configObj = config;
		}
		
		public function getRemoteObject(remoteObjectId:String):RemoteObject
		{
			if (configObj)
				return configObj[remoteObjectId];
			return null;
		}
		
		public function executeAsyncToken(token:AsyncToken, resultHandler:Function, faultHandler:Function):void
		{
			token.addResponder(new Responder(resultHandler, faultHandler));
		}
		
		public function execute(remoteObjectId:String, methodName:String, args:Array = null, resultHandler:Function = null, faultHandler:Function = null):void
		{
			var remoteObject:RemoteObject = getRemoteObject(remoteObjectId);
			if (!remoteObject)
				throw new Error(remoteObjectId + " not configured!");
			
			var method:Operation = remoteObject[methodName];
			method.arguments = args;
			executeAsyncToken(method.send(), resultHandler, faultHandler);
		}
	}
}