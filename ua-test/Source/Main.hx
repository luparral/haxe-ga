package;

import openfl.display.Sprite;
import openfl.events.MouseEvent;

import ua.User;
import ua.Hit;
import ua.Event;
import ua.Session;
import ua.Tracker;
import ua.utils.QueryString;


/**
 * Test project for Universal Analytics lib
 * Run with -Dclear to clean up user data, if not user data is persistent (as required by api)
 */
class Main extends Sprite {
	
	var tracker:Tracker;
	var user:User;

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
		
		user = User.getCurrentUser("1");

		tracker = new Tracker(TRAKING_ID,APPLICATION_NAME, user);

		var initAppEvent = tracker.createEvent("applifecycle", "start");
		initAppEvent.label = "INIT";

		tracker.sendHit(initAppEvent);

		stage.addEventListener(MouseEvent.CLICK, sendEvent);

	}

	private function sendEvent(e:openfl.events.Event):Void {
		user = User.getCurrentUser("1");

		tracker = new Tracker(TRAKING_ID,APPLICATION_NAME, user);

		var initAppEvent = tracker.createEvent("ui", "click");

		tracker.sendHit(initAppEvent);
	}
	
	
}