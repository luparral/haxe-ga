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
import ua.ThreadedRequest;

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

	public function createEvent(category:String, action:String, trackeable:Bool=true):Event {
		var event = new Event(trackingId, applicationName, category, action, trackeable);
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
		//trace('************************going to send hit');
		//trace('************************ hit is trackeable: ' + hit.isTrackeable());
		if(hit.isTrackeable()){
			hit.applicationVersion=Game.instance.buildVersion.toString();
			var queryString:QueryString = new QueryString(hit);
			queryString.addParamsObj(user);
			sendRequest(queryString);
		}
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

	private function sendRequest(queryString:QueryString):Void {
		#if flash
		trace("+++++++ Sending flash analytics request");

		var query:String = queryString.toString();
		
		#if debug
		var url:String = ThreadedRequest.HOST + '/debug/collect?' + query;
		#else
		var url:String = ThreadedRequest.HOST + '/collect?' + query;
		#end

		var l : flash.display.Loader = new flash.display.Loader();
		var urlRequest : flash.net.URLRequest=new flash.net.URLRequest();
		urlRequest.url=url;
		try{ 
			l.load(urlRequest);
		} catch (e:flash.errors.Error) {
			trace("++++++ flash request error. id ["+e.errorId+"] name ["+e.name+"] message ["+e.message+"]");
		}
		#else
		ThreadedRequest.request(queryString);
		#end
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



