package ua;

import openfl.net.SharedObject;
import ua.utils.UUID;

class User {
	
	public var clientID(default, null):String;

	public var userID(default, null):String;

	private function new(clientID:String, userID:String) {
		this.userID = userID;
		this.clientID = clientID;
	}

	static private var user:User = null;

	static public function getCurrentUser(userID:String=null):User {

		if(user!=null) return user;

		var uaUserSO:SharedObject = SharedObject.getLocal("uaUser");

		if(usUserSO.data!=null && usUserSO.data.clientID!=null) {
			user = new User(usUserSO.data.clientID, userID);
			return user;
		}

		var clientID:String = UUID.uuidRfc4122V4();

		uaUserSO.setProperty("clientID", clientID);
		uaUserSO.flush();

		user = new User(clientID, userID);
		return user;
	}
}