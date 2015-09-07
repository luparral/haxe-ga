package ua;

import openfl.net.SharedObject;
import ua.utils.UUID;

class User {
	
	/*
	* This anonymously identifies a particular user, device, or browser instance. For mobile apps, this is randomly generated for each particular instance of an application install. The value of this field should be a random UUID (version 4) as described in http://www.ietf.org/rfc/rfc4122.txt
	*/
	@param("cid")
	public var clientID(default, null):String;

	/*
	*Optional. This is intended to be a known identifier for a user provided by the site owner/tracking library user. It must not itself be PII (personally identifiable information). The value should never be persisted in GA cookies or other Analytics provided storage.
	*/
	@param("uid")
	public var userID:String;

	
	public function new(clientID:String, userID:String) {
		this.userID = userID;
		this.clientID = clientID;
	}

	static private var user:User = null;

	static public function getCurrentUser(userID:String=null):User {

		if(user!=null) return user;

		var uaUserSO:SharedObject = SharedObject.getLocal("uaUser");

		if(uaUserSO.data!=null && uaUserSO.data.clientID!=null) {
			user = new User(uaUserSO.data.clientID, userID);
			return user;
		}

		var clientID:String = UUID.generate();

		uaUserSO.setProperty("clientID", clientID);
		uaUserSO.flush();

		user = new User(clientID, userID);
		return user;
	}

	static public function clear():Void {
		user = null;

		var uaUserSO:SharedObject = SharedObject.getLocal("uaUser");
		uaUserSO.clear();
		uaUserSO = null;
	}
}