package ua;
import openfl.net.SharedObject;

class Session {

	/*
	* Optional. Used to control the session duration. A value of 'start' forces a new session to start with this hit and 'end' forces the current session to end with this hit. All other values are ignored.
	*/
	@param("sc")
	public var sessionControl(default, null):String;
	
	/*
	* Optional. The IP address of the user. This should be a valid IP address in IPv4 or IPv6 format. It will always be anonymized just as though &aip (anonymize IP) had been used.
	*/
	@param("uip")
	public var ipOverride(default, null):String;

	/*
	* Optional. The User Agent of the browser. Note that Google has libraries to identify real user agents. Hand crafting your own agent could break at any time.
	*/
	@param("ua")
	public var userAgentOverride(default, null):String;

	/*
	* Optional. The User Agent of the browser. Note that Google has libraries to identify real user agents. Hand crafting your own agent could break at any time.
	*/
	@param("geoid")
	public var geographicalOverride(default, null):String;

	public function start(){
		this.sessionControl = "start";
	}

	public function end(){
		this.sessionControl = "end";
	}

	public function new(){
		//constructor default
	}

}