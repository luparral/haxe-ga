package googleAnalytics;

#if cpp
import cpp.vm.Thread;
#elseif neko
import neko.vm.Thread;
#end

class ThreadedSocketRequest {

	#if ( cpp || neko )
	
	private static var thread:Thread;
	private static var initted:Bool=false;	
	
	public static function init() {
		if(initted) return;
		initted=true;
		thread = Thread.create(onThreadMessage);
	}

	private static function onThreadMessage(){
		var s:sys.net.Socket = null;
		var msg = null;
		while(true){ // Keep thread open forever waiting for a message to send
			try {
				msg = Thread.readMessage(true);
				if ( msg == null ) continue;
				s = new sys.net.Socket();
				s.setBlocking(true);
				trace("Resolving host...");
				var host = new sys.net.Host(msg.host);
				trace("Connecting ("+msg.host+")...");
				s.connect(host,msg.port);
				trace("Sending...\n"+msg.message);
				s.write(msg.message);
				trace("Readline...");
				var response = s.input.readLine();

				if(response==null) {
					trace("Request failed. Timeout!");
				} else {
					trace('response: ' + response);
				}		
			} catch(e:Dynamic) {
				trace("Exception: "+e);
			}

			try {
				if(s!=null){
					s.close();
					s=null;
				}
			} catch(e:Dynamic) {

			}
		}	
	}

	#end

	public static function request(host:String, port:Int, url:String, userAgent:String){
		#if ( cpp || neko )
			init();
			thread.sendMessage({
				"host":host,
				"port":port,
				"message":"GET "+url+" HTTP/1.1\nHost:"+host+"\nUser-Agent: "+userAgent+"\n\n"
			});
		#end
	}

}
