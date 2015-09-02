package ua;

class Social extends Hit {

	static private var HIT_TYPE_EVENT:String = "social";


	/*
	 * Specifies the social network, for example Facebook or Google Plus. 
	 */
	@param("sn")
	public var socialNetwork:String;

	/*
	 * Specifies the social interaction action. For example on Google Plus when a user clicks the +1 button, the social action is 'plus'.
	 */
	@param("sa")
	public var socialAction:String;

	/*
	 * Specifies the target of a social interaction. This value is typically a URL but can be any text.
	 */
	@param("st")
	public var socialActionTarget:String;

	public function new(trackingId:String, applicationName:String, socialNetwork:String, socialAction:String, socialActionTarget:String, protocolVersion:String="1") {
		super(HIT_TYPE_EVENT, trackingId, applicationName, protocolVersion);
		this.socialNetwork = socialNetwork;
		this.socialAction = socialAction;
		this.socialActionTarget = socialActionTarget;
	}

}