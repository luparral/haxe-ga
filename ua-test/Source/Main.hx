package;


import openfl.display.Sprite;
import ua.User;
import ua.Hit;
import ua.Event;
import ua.Session;
import ua.utils.QueryString;

/**
 * Test project for Universal Analytics lib
 * Run with -Dclear to clean up user data, if not user data is persistent (as required by api)
 */
class Main extends Sprite {
	
	var tracker:Tracker;
	static public var TRAKING_ID(default, never):String = "UA-60080806-4";
	static public var APPLICATION_NAME(default, never):String = "ua-test";

	public function new () {
		
		super ();

		#if clear
		User.clear();
		#end

		var session:Session = new Session();

		session.start();
		trace(session.sessionControl); // start
		
		var user:User = User.getCurrentUser("1");

		tracker = new Tracker(TRAKING_ID,APPLICATION_NAME, user);

		var initAppEvent = tracker.createEvent("applifecycle", "start");
		initAppEvent.label = "INIT";

		tracker.sendHit(initAppEvent);



	}
	
	
}