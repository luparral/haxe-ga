package ua;

class Social extends Hit {

	static private var HIT_TYPE_EVENT:String = "social";


	/*
	 * Specifies the social network, for example Facebook or Google Plus. 
	 */
	@param("sn")
	public var network:String;

	/*
	 * Specifies the social interaction action. For example on Google Plus when a user clicks the +1 button, the social action is 'plus'.
	 */
	@param("sa")
	public var action:String;

	/*
	 * Specifies the target of a social interaction. This value is typically a URL but can be any text.
	 */
	@param("st")
	public var actionTarget:String;

	public function new(trackingId:String, applicationName:String, network:String, action:String, actionTarget:String, trackeable:Bool=true, protocolVersion:String="1") {
		super(HIT_TYPE_EVENT, trackingId, applicationName, trackeable, protocolVersion);
		this.network = network;
		this.action = action;
		this.actionTarget = actionTarget;
	}

}