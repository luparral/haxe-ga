package ua;

#if cpp
import cpp.vm.Thread;
#elseif neko
import neko.vm.Thread;
#end

import ua.utils.QueryString;
import haxe.Http;
import flash.Lib;

class ThreadedRequest {


	private static var thread:Thread;
	private static var initted:Bool=false;	
	private static var HOST:String = "http://www.google-analytics.com";
	private static var PORT:Int = 80;

	public static function init() {
		if(initted) return;
		initted=true;
		thread = Thread.create(onThreadMessage);
	}


	private static function onThreadMessage(){
		var msg = null;
		while(true){
			try{
				msg = Thread.readMessage(true);
				if ( msg == null ) continue;
				sendRequest(msg);

			} catch(e:Dynamic) {
					trace("Exception: "+e);
			}
			
		}
	}

	public static function request(queryString:QueryString):Void{
		#if ( cpp || neko )
			init();
			thread.sendMessage(queryString.toString());
		#end
	}

	private static function sendRequest(query:String):Void{
		
		var version:String=" [haxe]";
		#if (openfl && !flash && !html5)
		#if openfl_next
		version+="/" + Lib.application.config.packageName + "." + Lib.application.config.version;
		#else
		version+="/" + Lib.packageName + "." + Lib.version;
		#end
		#end


		#if ios
		var userAgent = 'iOS'+version;
		#elseif android
		var userAgent = 'Android'+version;
		#elseif mac
		var userAgent = 'OS-X'+version;
		#elseif tizen
		var userAgent = "Tizen"+version;
		#elseif blackberry
		var userAgent = "BlackBerry"+version;
		#elseif windows
		var userAgent = "Windows"+version;
		#elseif linux
		var userAgent = "Linux"+version;
		#else
		var userAgent = '-not-set-'+version;
		#end

		trace('******************* userAgent ' + userAgent);
		
		#if debug
		var url:String = ThreadedRequest.HOST + '/debug/collect?' + query;
		#else
		var url:String = ThreadedRequest.HOST + '/collect?' + query;
		#end
		
		trace("******************* ua url: " + url);

		//googleAnalytics.ThreadedSocketRequest.request(Tracker.HOST, Tracker.PORT, url, userAgent);
		var request:Http = new Http(url);
		request.setHeader('User-Agent', userAgent);
		request.setHeader('Host', ThreadedRequest.HOST);
		request.setHeader('Connection', 'close');
		request.request(false);
	}
}