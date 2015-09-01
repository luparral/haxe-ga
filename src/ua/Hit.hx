package ua;

/*
 * Google Universal Analytics Hit representation
 * https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters
 */
class Hit {
	
	/*
	 * The type of hit. Must be one of 'pageview', 'screenview', 'event', 'transaction', 'item', 'social', 'exception', 'timing'
	 */
	@:param(t)
	public var type:String;

	public var nonInteractive:Bool;

	@:param(ni)
	private var ni(get, null):String;

	@:param(cd)
	public var screenName:String;

	/*
	 * Specifies the application name. This field is required for all hit types sent to app properties. For hits sent to web properties, this field is optional.
	 */
	@:param(an)
	public var applicationName:String;

	@:param(ci)
	private var clientID:String;

	public function new(type:String, user:User) {
		this.type = type;

	}

	private function get_ni():String {
		if(nonInteractive) return "1";
		return null;
	}
}
