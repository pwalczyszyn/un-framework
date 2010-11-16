package com.riaspace.un
{
	import mx.rpc.AsyncToken;

	public interface IRemoteService
	{
		function call(token:AsyncToken, resultHandler:Function, faultHandler:Function):void;
	}
}