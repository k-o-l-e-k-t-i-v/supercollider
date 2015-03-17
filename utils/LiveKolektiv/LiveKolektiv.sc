LiveKolektiv {
	classvar all_Names, all_IP;
	var userName;
	var a, n, d;

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

	initSendMsg{
		var string, position;
		var flag_isMyChange = false; //flag --> default false

		d.keyDownAction = {arg ...args;
			args.postln;
			if(args[3].asInt<10000){
				flag_isMyChange = true;	//watcher, if is it yours chanche of document || flag --> true
			}
		};

		d.textChangedAction = {arg ...args;
			("\nFlag_isMyChange || " ++ flag_isMyChange).postln;
			if(flag_isMyChange){    //gate, if is it yours chanche of document than send to other listeners
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
