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

	public function new(?user:User) {
		super(HIT_TYPE_EVENT, user);
	}

}