LiveKolektiv {
	classvar players, ipAdrs;
	var userName;

	*new{ |name|
		^super.new.init(userName);
	}

	init{|name|
		userName = name;
	}
}