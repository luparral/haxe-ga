package ua;

class Exception extends Hit {

	static private var HIT_TYPE_EVENT:String = "exception";

	/*
	 * Optional. Specifies the description of an exception.
	 */
	@param("exd")
	public var exceptionDescription:String;	

	/*
	 * Optional. Specifies whether the exception was fatal.
	 */
	@param("exf")
	public var isExceptionFatal:String;	

	public function new(trackingId:String, applicationName:String, protocolVersion:String="1") {
		super(HIT_TYPE_EVENT, trackingId, applicationName, protocolVersion);
	}


}