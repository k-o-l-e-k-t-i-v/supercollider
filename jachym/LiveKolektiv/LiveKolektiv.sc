LiveKolektiv {
	classvar all_Names, all_IP;
	var userName;
	var c, x, d;

	*new{ |name|
		^super.new.init(name);
	}

	init{|name|

		userName = name;

		all_Names = List.new();
		all_IP = List.new();

		this.addPlayer(\joach2,"25.54.28.51");
		this.addPlayer(\joach,"25.0.209.252");
		this.addPlayer(\alex,"25.164.56.183");
		this.addPlayer(\kof,"25.164.28.14");

		c = Collective(userName,\livecoding,[\joach2,"25.54.28.51",\joach,"25.0.209.252",\alex,"25.164.56.183",\kof,"25.164.28.14"]).start;
		// hloupe zapsany array


		c.autoCollect;

		x = Participation(c).start;
		d = Document.new("livecoding.scd","//welcome to shared session\n\n");

		// d.onClose = { x.stop; History.end; };

		this.initSendMsg;
		this.initReceiveMsg;
	}

	initSendMsg{
		var string, position;
		d.textChangedAction = {arg ...args;
			// args.postcs;
			string = args[3];
			position = args[1];

			this.listenerNames.do{|name|
				("SendMsg to " ++ name ++ " || " ++ string ++ " || " ++ position).postln;
			};
			"\n".postln;

			c.sendToEach(\shared,userName,args[args.size-3],args[args.size-1]);
		};

		/*
		// sending
		d.textChangedAction = {arg ...args;
		args.postln;
		// [one,two,three,four,five].postln;
		c.sendToEach(\shared,name,args[args.size-3],args[args.size-1]);
		};


		d.keyDownAction = {arg ...args;
		("key down + "++args).postln;
		// [one,two,three,four,five].postln;
		if(args[args.size-3].asInt!==65533){
		c.sendToEach(\shared,name,args[args.size-5],args[args.size-1]);
		}
		};

		History.forwardFunc = { |code|
		c.sendToEach(\exec,name,code);
		};
		*/
	}
	initReceiveMsg{
		/*
		//receiving
		x.addResponder(\shared, { |r,t,msg|
			("recieved: "++msg).postln;
			if((msg[msg.size-3].asString).contains(name.asString)==false){
				("if passed"+msg[msg.size-3]).postln;
				d.insertText(msg[msg.size-1].asString,msg[msg.size-2].asInt+1);
			}{("ok, filtering out your own sends: "++msg[msg.size-3]).postln;};
		});


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
		all_Names.add(name);
		all_IP.add(ip);
	}

	listenerNames{
		var answ = List.new;
		all_Names.size.do{|i|
			if((all_Names[i].asString).contains(userName.asString)==false) 	{ answ.add(all_Names[i]); };
		};
		^answ;
	}
	listenerIP{
		var answ = List.new;
		all_Names.size.do{|i|
			if((all_Names[i].asString).contains(userName.asString)==false)	{ answ.add(all_IP[i]); };
		};
		^answ;
	}
	yourName{
		var answ;
		all_Names.size.do{|i|
			if((all_Names[i].asString).contains(userName.asString)==true)	{ ^all_Names[i]; };
		};
	}
	yourIP{
		var answ;
		all_Names.size.do{|i|
			if((all_Names[i].asString).contains(userName.asString)==true)	{ ^all_IP[i]; };
		};
	}

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