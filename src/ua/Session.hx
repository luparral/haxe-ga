package ua;

class Session {

	/*
	* Optional. Used to control the session duration. A value of 'start' forces a new session to start with this hit and 'end' forces the current session to end with this hit. All other values are ignored.
	*/
	@param("sc")
	private var sessionControl(default, null):String;
	
	/*
	* Optional. The IP address of the user. This should be a valid IP address in IPv4 or IPv6 format. It will always be anonymized just as though &aip (anonymize IP) had been used.
	*/
	@param("uip")
	private var ipOverride(default, null):String;

	/*
	* Optional. The User Agent of the browser. Note that Google has libraries to identify real user agents. Hand crafting your own agent could break at any time.
	*/
	@param("ua")
	private var userAgentOverride(default, null):String;

	/*
	* Optional. The User Agent of the browser. Note that Google has libraries to identify real user agents. Hand crafting your own agent could break at any time.
	*/
	@param("geoid")
	private var geographicalOverride(default, null):String;


	private function new(sessionControl:String, ipOverride:String, userAgentOverride:String, geographicalOverride:String) {
		this.sessionControl = sessionControl;
		this.ipOverride = ipOverride;
		this.userAgentOverride = userAgentOverride;
		this.geographicalOverride = geographicalOverride;
	}

}