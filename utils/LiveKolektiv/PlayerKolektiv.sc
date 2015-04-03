PlayerKolektiv{
	var userName, userNet;
	var kolektiv;
	var doc;
	var isLogIn;
	var positionCursor, positionPrivateEnd;

	*new{ |name, addr, parent|
		^super.new.init(name, addr, parent);
	}

	init{|name, ip, parent|

		userName = name;
		userNet = NetAddr(ip, NetAddr.langPort);
		kolektiv = parent;

		isLogIn = false;
	}

	logIn{
		doc = Document.new("LiveKolektiv session","");
	}

	name { ^userName; }
	net { ^userNet; }
	code { ^doc; }
}

