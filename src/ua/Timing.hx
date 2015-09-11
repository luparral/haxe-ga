package ua;

class Timing extends Hit{

	static private var HIT_TYPE_EVENT:String = "timing";

	/*
	* Specifies the user timing category.
	*/
	@param("utc")
	public var category:String;

	/*
	* Specifies the user timing variable.
	*/
	@param("utv")
	public var variableName:String;

	/*
	* Specifies the user timing value. The value is in milliseconds.	
	*/
	@param("utt")
	public var time:Int;

	/*
	* Optional. Specifies the user timing label.
	*/
	@param("utl")
	public var label:String;

	/*
	* Optional. Specifies the time it took for a page to load. The value is in milliseconds.
	*/
	@param("plt")
	public var pageLoadTime:Int;

	/*
	* Optional. Specifies the time it took to do a DNS lookup.The value is in milliseconds.
	*/
	@param("dns")
	public var dnsTime:Int;

	/*
	* Optional. Specifies the time it took for the page to be downloaded. The value is in milliseconds.
	*/
	@param("pdt")
	public var pageDownloadTime:Int;

	/*
	* Optional. Specifies the time it took for any redirects to happen. The value is in milliseconds.
	*/
	@param("rrt")
	public var redirectResponseTime:Int;

	/*
	* Optional. Specifies the time it took for a TCP connection to be made. The value is in milliseconds.
	*/
	@param("tcp")
	public var tcpConnectTime:Int;

	/*
	* Optional. Specifies the time it took for the server to respond after the connect time. The value is in milliseconds.
	*/
	@param("srt")
	public var serverResponseTime:Int;

	/*
	* Optional. Specifies the time it took for Document.readyState to be 'interactive'. The value is in milliseconds.
	*/
	@param("dit")
	public var domInteractiveTime:Int;

	/*
	* Optional. Specifies the time it took for the DOMContentLoaded Event to fire. The value is in milliseconds.
	*/
	@param("clt")
	public var contentLoadTime:Int;

	public function new(trackingId:String, applicationName:String, category:String, variableName:String, time:Int, trackeable:Bool=true, protocolVersion:String="1") {
		super(HIT_TYPE_EVENT, trackingId, applicationName, trackeable, protocolVersion);
		this.category = category;
		this.variableName = variableName;
		this.protocolVersion = protocolVersion;
	}


}