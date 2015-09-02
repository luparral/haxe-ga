package ua;

class Screenview extends Hit{

	static private var HIT_TYPE_EVENT:String = "screenview";
	
	/*
	* It is used for the 'Screen Name' of the screenview hit.
	*/
	@param("cd")
	public var screenName:String;


	public function new(trackingId:String, applicationName:String, screenName:String, protocolVersion:String="1") {
		super(HIT_TYPE_EVENT, trackingId, applicationName, protocolVersion);
		this.screenName = screenName;
	}
}