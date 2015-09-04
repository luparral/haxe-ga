package ua;

import ua.utils.QueryString;
import googleAnalytics.ThreadedSocketRequest;
import openfl.net.URLRequest;
import openfl.net.URLLoader;
import openfl.net.URLRequestMethod;
import openfl.events.ErrorEvent;
import openfl.events.IOErrorEvent;
import haxe.Http;

class Tracker {
	static var HOST:String = "http://www.google-analytics.com";
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

	public function createScreenview(screenName:String){
		var screenview = new Screenview(trackingId, applicationName, screenName);
		return screenview;
	}

	public function createTiming(userTimingCategory:String, userTimingVariable:String, userTimingTime:Int){
		var timing = new Timing(trackingId, applicationName, userTimingCategory, userTimingVariable, userTimingTime);
		return timing;
	}

	public function createSocial(socialNetwork:String, socialAction:String, socialActionTarget:String){
		var social = new Social(trackingId, applicationName, socialNetwork, socialAction, socialActionTarget);
		return social;
	}

	public function createException(){
		var exception = new Exception(trackingId, applicationName);
		return exception;		
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
		//googleAnalytics.ThreadedSocketRequest.request(Tracker.HOST, Tracker.PORT, url, userAgent);
		var request:Http = new Http(url);
		request.setHeader('User-Agent', userAgent);
		request.setHeader('Host', Tracker.HOST);
		request.setHeader('Connection', 'close');
		request.request(false);		
	}	

}



