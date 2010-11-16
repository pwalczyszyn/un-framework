// ActionScript file
package
{
	import com.riaspace.un.IRemoteService;
	
	public function get remoteService():IRemoteService
	{
		return RemoteService.instance;
	}
	
}
import com.riaspace.un.IRemoteService;

import mx.rpc.AsyncToken;
import mx.rpc.Responder;
import mx.rpc.remoting.Operation;
import mx.rpc.remoting.RemoteObject;

internal class RemoteService implements IRemoteService
{
	internal static var instance:IRemoteService = new RemoteService();
	
	private var configObj:Object;
	
	public function set config(value:Class):void
	{
		configObj = new value();
	}
	
	public function getRemoteObject(remoteObjectId:String):RemoteObject
	{
		if (configObj)
			return configObj[remoteObjectId];
		return null;
	}
	
	public function callDirectly(token:AsyncToken, resultHandler:Function, faultHandler:Function):void
	{
		token.addResponder(new Responder(resultHandler, faultHandler));
	}
	
	public function call(remoteObjectId:String, methodName:String, args:Array = null, resultHandler:Function = null, faultHandler:Function = null):void
	{
		var remoteObject:RemoteObject = getRemoteObject(remoteObjectId);
		if (!remoteObject)
			throw new Error(remoteObjectId + " not configured!");
		
		var method:Operation = remoteObject[methodName];
		method.arguments = args;
		callDirectly(method.send(), resultHandler, faultHandler);
	}
}