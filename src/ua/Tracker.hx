package ua;

import ua.utils.QueryString;
import ua.Session;
import ua.SystemInfo;
import googleAnalytics.ThreadedSocketRequest;
import openfl.net.URLRequest;
import openfl.net.URLLoader;
import openfl.net.URLRequestMethod;
import openfl.events.ErrorEvent;
import openfl.events.IOErrorEvent;
import ar.com.euda.openfl.hamburga.Game;
import flash.Lib;


import haxe.Http;

class Tracker {
	static var HOST:String = "http://www.google-analytics.com";
	static var PORT:Int = 80;
	var trackingId:String;
	var applicationName:String;
	public var applicationVersion:String;
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
		if(applicationVersion != null){
			event.applicationVersion = applicationVersion;
		}
		return event;
	}

	public function createScreenview(screenName:String=null){
		if(screenName == null){
			screenName = this.screenName;
		}
		var screenview = new Screenview(trackingId, applicationName, screenName);
		if(applicationVersion != null){
			screenview.applicationVersion = applicationVersion;
		}
		return screenview;
	}

	public function createTiming(category:String, variableName:String, time:Int){
		var timing = new Timing(trackingId, applicationName, category, variableName, time);
		if(applicationVersion != null){
			timing.applicationVersion = applicationVersion;
		}
		return timing;
	}

	public function createSocial(network:String, action:String, actionTarget:String){
		var social = new Social(trackingId, applicationName, network, action, actionTarget);
		if(applicationVersion != null){
			social.applicationVersion = applicationVersion;
		}
		return social;
	}

	public function createException(){
		var exception = new Exception(trackingId, applicationName);
		if(applicationVersion != null){
			exception.applicationVersion = applicationVersion;
		}
		return exception;		
	}

	public function sendHit(hit:Hit):Void {
		//agregar info de session, si corresponde
		trace('************************going to send hit');
		hit.applicationVersion=Game.instance.buildVersion.toString();
		var queryString:QueryString = new QueryString(hit);
		queryString.addParamsObj(user);
		sendRequest(queryString);
	}

	public function sendFirstHit(hit:Hit, session:Session, systemInfo:SystemInfo):Void {
		//agregar info de session, si corresponde
		trace('************************going to send first hit');
		//hit.applicationVersion=Game.instance.buildVersion.toString();
		var queryString:QueryString = new QueryString(hit);
		queryString.addParamsObj(user);
		queryString.addParamsObj(session);
		queryString.addParamsObj(systemInfo);
		sendRequest(queryString);
	}

	private function sendRequest(queryString:QueryString):Void{
		trace('***********************going to send request');
		
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


		trace('*********************** userAgent ' + userAgent);
		trace('*********************** queryString: ' + queryString.toString());

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



