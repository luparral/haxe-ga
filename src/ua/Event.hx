package ua;

class Event extends Hit {

	static private var HIT_TYPE_EVENT:String = "event";

	/*
	 * Specifies the event category. 
	 */
	@param("ec")
	public var category:String;

	/*
	 * Specifies the event action. 
	 */
	@param("ea")
	public var action:String;

	/*
	 * Optional. Specifies the event label. 
	 */
	@param("el")
	public var label:String;	

	/*
	 * Specifies the event value. 
	 */
	@param("ev")
	public var value:String;

	/*
	* Optional. It is used for the 'Screen Name' of the screenview hit.
	*/
	@param("cd")
	public var screenName:String;



	public function new(trackingId:String, applicationName:String, category:String, action:String, protocolVersion:String="1") {
		super(HIT_TYPE_EVENT, trackingId, applicationName, protocolVersion);
		this.category = category;
		this.action = action;
	}
}