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

internal class RemoteService implements IRemoteService
{
	public static const instance:IRemoteService = new RemoteService();
	
	public function call(token:AsyncToken, resultHandler:Function, faultHandler:Function):void
	{
		token.addResponder(new Responder(resultHandler, faultHandler));
	}
	
}