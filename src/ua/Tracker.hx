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
	public var user:User;
	public var screenName:String;

	public function new(trackingId:String, applicationName:String, ?user:User) {
		this.trackingId = trackingId;
		this.applicationName = applicationName;
		this.user = user;
	}
	
	// public function getSession():Session{}

	public function createEvent(category:String, action:String):Event {
		var event = new Event(trackingId, applicationName, category, action);
		if(screenName != null){
			event.screenName = screenName;
		}
		return event;
	}

	public function createScreenview(screenName:String=null){
		if(screenName == null){
			screenName = this.screenName;
		}
		var screenview = new Screenview(trackingId, applicationName, screenName);
		return screenview;
	}

	public function createTiming(category:String, variableName:String, time:Int){
		var timing = new Timing(trackingId, applicationName, category, variableName, time);
		return timing;
	}

	public function createSocial(network:String, action:String, actionTarget:String){
		var social = new Social(trackingId, applicationName, network, action, actionTarget);
		return social;
	}

	public function createException(){
		var exception = new Exception(trackingId, applicationName);
		return exception;		
	}

	public function sendHit(hit:Hit):Void {
		//agregar info de session, si corresponde
		trace('************************going to send hit');
		var queryString:QueryString = new QueryString(hit);
		queryString.addParamsObj(user);
		sendRequest(queryString);
	}

	private function sendRequest(queryString:QueryString):Void{
		trace('***********************going to send request');
		var userAgent = "haxe-ga/2.0";

		trace('***********************queryString: ' + queryString.toString());

		#if debug
		var url : String = Tracker.HOST + '/debug/collect?' + queryString.toString();
		#else
		var url : String = Tracker.HOST + '/collect?' + queryString.toString();
		#end

		//googleAnalytics.ThreadedSocketRequest.request(Tracker.HOST, Tracker.PORT, url, userAgent);
		var request:Http = new Http(url);
		request.setHeader('User-Agent', userAgent);
		request.setHeader('Host', Tracker.HOST);
		request.setHeader('Connection', 'close');
		request.request(false);		
	}

	public function getTrackingId(){
		return this.trackingId;
	}

	public function getApplicationName(){
		return this.applicationName;
	}

	public function getUser(){
		return this.user;
	}

}



