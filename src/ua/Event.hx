package ua;

class Event extends Hit{

	/*
	* Specifies the event category. 
	*/
	@param(ec)
	private var category():String;

	/*
	* Specifies the event action. 
	*/
	@param(ea)
	private var action():String;

	/*
	* Optional. Specifies the event label. 
	*/
	@param(el)
	private var label():String;	

	/*
	* Specifies the event value. 
	*/
	@param(ev)
	private var value():String;	



}