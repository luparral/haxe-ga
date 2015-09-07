package ua;

class SystemInfo {

	/*
	* Optional. Specifies the screen resolution.
	*/
	@param("sr")
	public var screenResolution:String;


	/*
	* Optional. Specifies the viewable area of the browser / device.
	*/
	@param("vp")
	public var viewportSize:String;

	/*
	* Optional. Specifies the character set used to encode the page / document.
	*/
	@param("de")
	public var documentEncoding:String;

	/*
	* Optional. Specifies the screen color depth.
	*/
	@param("sd")
	public var screenColors:String;

	/*
	* Optional. Specifies the language.
	*/
	@param("ul")
	public var userLanguage:String;

	/*
	* Optional. Specifies whether Java was enabled.
	*/
	@param("je")
	public var javaEnabled:String;

	/*
	* Optional. Specifies the flash version.
	*/
	@param("fl")
	public var flashVersion:String;

	public function new(){
		//constructor default
	}

}
	