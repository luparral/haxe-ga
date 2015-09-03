package ua;

import ua.utils.QueryString;
import googleAnalytics.ThreadedSocketRequest;
import openfl.net.URLRequest;
import openfl.net.URLLoader;
import openfl.net.URLRequestMethod;
import openfl.events.ErrorEvent;
import openfl.events.IOErrorEvent;

class Tracker {
	static var HOST:String = "www.google-analytics.com";
	static var PORT:Int = 80;
	var trackingId:String;
	var applicationName:String;
	var user:User;

	public function new(trackingId:String, applicationName:String, user:User) {
		this.trackingId = trackingId;
		this.applicationName = applicationName;
		this.user = user;
	}
	
	// public function getSession():Session{}

	public function createEvent(category:String, action:String):Event {
		var event = new Event(trackingId, applicationName, category, action);
		return event;
	}

	public function sendHit(hit:Hit):Void {
		//agregar info de session, si corresponde
		var queryString:QueryString = new QueryString(hit);
		queryString.addParamsObj(user);
		trace("hit example: "+queryString.toString());
		sendRequest(queryString);
	}

	private function sendRequest(queryString:QueryString):Void{
		var userAgent = "haxe-ga/2.0";
		var url : String = '/collect?' + queryString.toString();
		googleAnalytics.ThreadedSocketRequest.request(Tracker.HOST, Tracker.PORT, url, userAgent);
    /*
    	var request:URLRequest = new URLRequest("http://"+Tracker.HOST+url);

		request.method = URLRequestMethod.GET;

		var loader = new URLLoader();
		loader.addEventListener(openfl.events.Event.COMPLETE, function(e:openfl.events.Event) {
			trace("COMPLETE");
			trace(e.target.data);
		});
		loader.addEventListener(ErrorEvent.ERROR, function(e:openfl.events.Event) {
			trace("ErrorEvent: "+e);
		});
		loader.addEventListener(IOErrorEvent.IO_ERROR, function(e:openfl.events.IOErrorEvent) {
			trace("IOErrorEvent: "+e);
		});

		loader.load(request);
		*/
	}	

}



