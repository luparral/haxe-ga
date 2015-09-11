package ua;

/*
 * Google Universal Analytics Hit representation
 * https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters
 */

class Hit {
	
	/*
	* The type of hit. Must be one of 'pageview', 'screenview', 'event', 'transaction', 'item', 'social', 'exception', 'timing'
	*/
	@param("t")
	public var type(default, null):String;

	/*
	* The Protocol version. The current value is '1'. This will only change when there are changes made that are not backwards compatible.
	*/
	@param("v")
	public var protocolVersion:String;

	/*
	* The tracking ID / web property ID. The format is UA-XXXX-Y. All collected data is associated by this ID.
	*/
	@param("tid")
	public var trackingId:String;

	/*
	* Specifies the application name. This field is required for all hit types sent to app properties. For hits sent to web properties, this field is optional.
	*/
	@param("an")
	public var applicationName:String;

	/*
	* Optional. Specifies the application version.
	*/
	@param("av")
	public var applicationVersion:String;

	/*
	* Optional. Specifies that a hit be considered non-interactive.
	*/
	public var nonInteractive:Bool;

	@param("ni")
	public var ni(get, null):String;

	/*
	* Optional. When present, the IP address of the sender will be anonymized.
	*/
	public var anonymizeIP:Bool;

	@param("aip")
	public var aip(get, null):String;

	/*
	* Optional. Indicates the data source of the hit. Hits sent from analytics.js will have data source set to 'web'; hits sent from one of the mobile SDKs will have data source set to 'app'.
	*/
	@param("ds")
	public var dataSource:String;

	/*
	* Optional. Used to collect offline / latent hits. The value represents the time delta (in milliseconds) between when the hit being reported occurred and the time the hit was sent. The value must be greater than or equal to 0. Values greater than four hours may lead to hits not being processed.
	*/
	@params("qt")
	public var queueTime:String;

	/*
	* Optional. Used to send a random number in GET requests to ensure browsers and proxies don't cache hits. It should be sent as the final parameter of the request. This value is not used in reporting.
	*/
	@params("z")
	public var cacheBuster:String;	
	
	private var trackeable:Bool;

	private function new(type:String, trackingId:String, applicationName:String, trackeable:Bool=true, protocolVersion:String="1") {
		this.type = type;
		this.trackingId = trackingId;
		this.applicationName = applicationName;
		this.protocolVersion = protocolVersion;
		this.trackeable = trackeable;
	}

	public function get_ni():String {
		if(nonInteractive) return "1";
		return null;
	}

	public function get_aip():String{
		if(anonymizeIP) return "1";
		return null;
	}

	public function isTrackeable():Bool{
		return this.trackeable;
	}

}
