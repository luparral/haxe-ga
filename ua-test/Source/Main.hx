package;


import openfl.display.Sprite;
import ua.User;
import ua.Hit;
import ua.Event;
import ua.utils.QueryString;

/**
 * Test project for Universal Analytics lib
 * Run with -Dclear to clean up user data, if not user data is persistent (as required by api)
 */
class Main extends Sprite {
	
	
	public function new () {
		
		super ();

		#if clear
		User.clear();
		#end
		
		var user:User = User.getCurrentUser("1");

		trace("user uuid: "+user.clientID);

		var hit:Hit = new Hit("lalala", null);

		hit.screenName = "main";
		hit.applicationName = "ua-test";

		var queryString:QueryString = new QueryString(hit);

		queryString.addParamsObj(user);

		trace("hit example: "+queryString.toString());


		var event:Event = new Event(user);

		event.screenName ="main";
		event.applicationName = "ua-test";
		event.category = "app";
		event.action = "open";
		event.value = "0";

		queryString = new QueryString(event);

		trace("hit event example: "+queryString.toString());
		
	}
	
	
}