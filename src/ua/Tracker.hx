class Tracker {
	
	var trackingId:String;
	var applicationName:String;
	var user:User;

	public function new(trackingId:String, applicationName:String, user:User) {
		this.trackingId = trackingId;
		this.applicationName = applicationName;
		this.user = user;
	}
	
	public function getSession():Session{}

	public function createEvent(category:String, action:String):Event {
		var event = new Event(trackingId, applicationName, category, action);
		return event;
	}

	public function sendHit(hit:Hit):Void {
		//generar querystring
		//agregar info de user
		//agregar info de session, si corresponde


		var queryString:QueryString = new QueryString(hit);
		queryString.addParamsObj(user);
		trace("hit example: "+queryString.toString());
		sendRequest();

	}

	private function sendRequest(hit:Hit):Void{

	}

}



