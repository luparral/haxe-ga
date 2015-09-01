package ua.utils;

class UUID {

	private static var CHARS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".split("");
  
  	/**
	 * (a Mersenne prime M31) modulus constant = 2^31 - 1 = 0x7ffffffe
	 */
	private inline static var MPM = 2147483647.0;
	
	/**
	 * generate RFC4122, version 4 ID
	 * example "92329D39-6F5C-4520-ABFC-AAB64544E172"
	 * @param	seed optional PRNG seed
	 */
	public static function uuidRfc4122V4( ?seed : Int ) {
		
		if (seed.isNull()) seed = Math.floor(Math.random() * MPM);
		var chars = CHARS, uuid = [], i;

		// rfc4122, version 4 form
		var r : Int;

		// rfc4122 requires these characters
		uuid[8] = uuid[13] = uuid[18] = uuid[23] = "-";
		uuid[14] = "4";

		// Fill in random data.  At i==19 set the high bits of clock sequence as
		// per rfc4122, sec. 4.1.5
		for (i in 0...36) {
			if (uuid[i].isNull()) {
				r = 0 | ((seed = seed.nextParkMiller()).toFloat() * 16).int();
				uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
			}
		}

		return uuid.join("");
	}
}