UserKolektiv{
	var userName, userNet;
	var doc;
	var isMaster;

	*new{ |name|
		^super.new.init(name);
	}

	init{|name|
		var ip;

		userName = name;
		isMaster = false;

		ip = switch (userName)
		{\alex} { "25.164.56.183" }
		{\alex2} { "25.55.172.28" }
		{\kof} { "25.164.28.14" }
		{\joach} { "25.0.209.252" }
		{\joach2} { "25.54.28.51" }
		{"This userName isnt on list, srr".warn;};

		userNet = NetAddr(ip, NetAddr.langPort);
	}

	logIn{
		doc = Document.new("LiveKolektiv session","");
	}

	name { ^userName; }
	net { ^userNet; }
	code { ^doc; }
}

MasterKolektiv : UserKolektiv{

}