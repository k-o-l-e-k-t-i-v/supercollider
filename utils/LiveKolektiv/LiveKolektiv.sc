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

		collectiveArray = this.addPlayer(\joach2,"25.54.28.51");
		collectiveArray = this.addPlayer(\joach,"25.0.209.252");
		collectiveArray = this.addPlayer(\alex,"25.164.56.183");
		collectiveArray = this.addPlayer(\kof,"25.164.28.14");
		collectiveArray = collectiveArray.asArray;
		("collectiveArray || " ++ collectiveArray).postln;



		d = Document.new("livecoding.scd","//welcome to shared session\n\n");
		d.onClose = { History.end; };

		this.initSendMsg;
		this.initReceiveMsg;
	}

	initSendMsg{
		var string, position;
		d.textChangedAction = {arg ...args;
			"\n".postln;
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
		};

		History.forwardFunc = { |code|
		};
	}

	initReceiveMsg{


		a = OSCresponder(
			nil , // Listen to all IP addresses
			'/livecode',
			{arg ...args;
				var timestamp = args[0].asFloat;
				var msg = args[2];
				var sender = msg[1].asString;
				var char = msg[2].asString;
				var index = msg[3].asInt;

				("Received message form"+sender+"char:"+char+"index:"+index).postln;

				if(sender!=userName){
					d.insertText(char,index);
				};

			}
		);
		a.add;


		//receiving
		// x.addResponder(\shared, { |r,t,msg|

		// x.addResponder(\livecoding, { |r,t,msg|
		// ("recieved: "++msg).postln;
		/*
		if((msg[msg.size-3].asString).contains(name.asString)==false){
		("if passed"+msg[msg.size-3]).postln;
		d.insertText(msg[msg.size-1].asString,msg[msg.size-2].asInt+1);
		}{("ok, filtering out your own sends: "++msg[msg.size-3]).postln;};
		*/
		// });

		/*
		x.addResponder(\exec, { |r,t,msg|
		var code = msg[msg.size-1];
		("exec:"+code).postln;
		if((msg[0]++"").contains(name.asString)==false){
		code.interpret;
		History.enter(code,msg[0]);
		}
		});
		*/
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
