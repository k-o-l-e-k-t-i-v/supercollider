LiveKolektiv {
	classvar all_Names, all_IP;
	var userName;
	var a, n, d;
	var flag_isMyChange;

	*new{ |name|
		^super.new.init(name);
	}

	init{|name|
		var collectiveArray;
		userName = name;

		all_Names = List.new();
		all_IP = List.new();

		this.addPlayer(\joach2,"25.54.28.51");
		this.addPlayer(\joach,"25.0.209.252");
		this.addPlayer(\alex,"25.164.56.183");
		this.addPlayer(\kof,"25.164.28.14");

		// d = Document.new("livecoding.scd","//welcome to shared session");
		d = Document.new("livecoding.scd");
		d.onClose = { History.end; };

		this.initSendMsg;
		this.initReceiveMsg;
	}

	// win 3.7.0alpha kof version
	/*
	getLineNumber{
	var breaks,numLines;

	breaks = d.rangeText(0,d.selectionStart).findAll("\n");
	numLines = breaks.size + 1;
	^numLines;

	}

	getLineBeginning{
	var lastBrake = d.rangeText(0,d.selectionStart).findBackwards("\n");

	^lastBrake;

	}

	initSendMsg{
	var string, start,end,currentLineNumnber;

	flag_isMyChange = false; //flag --> default false

	d.keyDownAction = {arg ...args;
	args.postln;
	if(args[3].asInt<10000){
	flag_isMyChange = true;	//watcher, if is it yours chanche of document || flag --> true
	}
	};

	d.textChangedAction = {arg ...args;

	var flag_isMyChange = false;

	var currLnText = d.currentLine.asString;
	var currLnNum = this.getLineNumber;
	var currLineBeginning = this.getLineBeginning;
	var carretPos = d.selectionStart;
	var currentLineNumber;


	[currLnText,currLnNum,currLineBeginning,carretPos].postln;


	("\nFlag_isMyChange || " ++ flag_isMyChange).postln;
	if(flag_isMyChange){    //gate, if is it yours chanche of document than send to other listeners
	flag_isMyChange = false; // flag back to default until you again press key || flag --> false

	args.postcs;
	string = currLnText;
	start = currLineBeginning;
	end = carretPos;
	currentLineNumber = currLnNum;


	this.listenerIP.do{|ip|
	n = NetAddr(ip, 57120);
	// string, zacatek index, konec index, linenumber
	n.sendMsg('/livecode',userName,string,start,end,currentLineNumber);
	};

	this.listenerNames.do{|name|
	("SendMsg to" + name + "||" + string + "||" + start + "||"+ end +"||"+currentLineNumber).postln;
	};
	}
	};

	History.forwardFunc = { |code|
	};
	}
	*/
	initSendMsg{
		var string, position;
		flag_isMyChange = false; //flag --> default false
		d.keyDownAction = {arg ...args;
			args.postln;
			if(args[3].asInt<10000){
				flag_isMyChange = true; //watcher, if is it yours chanche of document || flag --> true
			}
		};
		d.textChangedAction = {arg ...args;
			("\nFlag_isMyChange || " ++ flag_isMyChange).postln;
			if(flag_isMyChange){ //gate, if is it yours chanche of document than send to other listeners
				flag_isMyChange = false; // flag back to default until you again press key || flag --> false
				args.postcs;
				string = args[3];
				position = args[1];
				this.listenerIP.do{|ip|
					n = NetAddr(ip, 57120);
					n.sendMsg('/livecode',userName,string,position);
				};
				this.listenerNames.do{|name|
					("SendMsg to " ++ name ++ " || " ++ string ++ " || " ++ position).postln;
				};
			}
		};
		History.forwardFunc = { |code|
		};
	}

	// win 3.7.0alpha kof version
	/*
	initReceiveMsg{
	flag_isMyChange = false;

	a = OSCresponder(
	nil , // Listen to all IP addresses
	'/livecode',
	{arg ...args;
	var flag_isMyChange = false;
	var timestamp = args[0].asFloat;
	var msg = args[2];
	var sender = msg[0].asString;
	var txt = msg[1].asString;
	var start = msg[2].asInt;
	var end = msg[3].asInt;
	var lnNum = msg[4].asInt;

	args.postln;
	("Received message form"+txt+"start:"+start+"end:"+end+"line number:"+lnNum).postln;

	d.prSetText(txt,\replace,start,end);
	}
	);
	a.add;
	}
	*/

	initReceiveMsg{
		flag_isMyChange = false;
		a = OSCresponder(
			nil , // Listen to all IP addresses
			'/livecode',
			{arg ...args;
				var timestamp = args[0].asFloat;
				var msg = args[2];
				var sender = msg[1].asString;
				var char = msg[2].asString;
				var index = msg[3].asInt;
				args.postln;
				("Received message form"+sender+"char:"+char+"index:"+index).postln;
				d.insertText(char,index);
			}
		);
		a.add;
	}

	addPlayer{|name, ip|
		var answ = List.new;
		all_Names.add(name);
		all_IP.add(ip);

		all_Names.size.do{|i|
			answ.add(all_Names[i]);
			answ.add(all_IP[i].asString);
		};
		^answ;
	}

	listenerNames{
		var answ = List.new;
		all_Names.size.do{|i|
			if(all_Names[i].asString != userName.asString) 	{ answ.add(all_Names[i]); };
		};
		^answ;
	}
	listenerIP{
		var answ = List.new;
		all_Names.size.do{|i|
			if(all_Names[i].asString != userName.asString) { answ.add(all_IP[i]); };
		};
		^answ;
	}

	yourName{ all_Names.do{|name| if(name.asString == userName.asString) { ^name; }; };	}
	yourIP{ all_Names.size.do{|i| if(all_Names[i].asString == userName.asString) { ^all_IP[i]; };	}; }

	printYou { ^("You || name " ++ this.yourName ++ " || ip " ++ this.yourIP).asString; }
	printListeners { var names, ips;
		names = this.listenerNames;
		ips = this.listenerIP;
		names.size.do{ |i|
			("Listeners || name " ++ names[i] ++ " || ip " ++ ips[i]).postln;
		};
		^"";
	}

}
