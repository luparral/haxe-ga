package ua;

class Timing extends Hit{

	/*
	* Specifies the user timing category.
	*/
	@param("utc")
	public var userTimingCategory:String;

	/*
	* Specifies the user timing variable.
	*/
	@param("utv")
	public var userTimingVariableName:String;

	/*
	* Specifies the user timing value. The value is in milliseconds.	
	*/
	@param("utt")
	public var userTimingTime:Integer;

	/*
	* Optional. Specifies the user timing label.
	*/
	@param("utl")
	public var userTimingLabel:String;

	/*
	* Optional. Specifies the time it took for a page to load. The value is in milliseconds.
	*/
	@param("plt")
	public var pageLoadTime:Integer;

	/*
	* Optional. Specifies the time it took to do a DNS lookup.The value is in milliseconds.
	*/
	@param("dns")
	public var dnsTime:Integer;

	/*
	* Optional. Specifies the time it took for the page to be downloaded. The value is in milliseconds.
	*/
	@param("pdt")
	public var pageDownloadTime:Integer;

	/*
	* Optional. Specifies the time it took for any redirects to happen. The value is in milliseconds.
	*/
	@param("rrt")
	public var redirectResponseTime:Integer;

	/*
	* Optional. Specifies the time it took for a TCP connection to be made. The value is in milliseconds.
	*/
	@param("tcp")
	public var tcpConnectTime:Integer;

	/*
	* Optional. Specifies the time it took for the server to respond after the connect time. The value is in milliseconds.
	*/
	@param("srt")
	public var serverResponseTime:Integer;

	/*
	* Optional. Specifies the time it took for Document.readyState to be 'interactive'. The value is in milliseconds.
	*/
	@param("dit")
	public var domInteractiveTime:Integer;

	/*
	* Optional. Specifies the time it took for the DOMContentLoaded Event to fire. The value is in milliseconds.
	*/
	@param("clt")
	public var contentLoadTime:Integer;


}