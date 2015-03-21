UserKolektiv{
	var userName, userNet;
	var doc, ideDoc;
	var isMaster;

	*new{ |name|
		^super.new.init(name);
	}

	init{|name|
		var ip;

		userName = name;
		isMaster = false;

		ip = switch (userName)
		{\alex}   { "25.164.56.183" }
		{\kof} { "25.164.28.14" }
		{\joach} { "25.0.209.252" }
		{\joach2} { "25.54.28.51" }
		{"This userName isnt on list, srr".warn;};

		userNet = NetAddr(ip, 57120);
	}

	logIn{
		doc = Document.new("LiveKolektiv session","");
		ideDoc = Document.findByQUuid(doc.quuid);
	}

	name { ^userName; }
	net { ^userNet; }
	code { ^ideDoc; }
}

MasterKolektiv : UserKolektiv{

}