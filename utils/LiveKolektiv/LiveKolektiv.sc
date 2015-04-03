LiveKolektiv {
	var you, others, accounts;
	var blockFirstEval;

	*new{ |name|
		^super.new.init(name);
	}

	init{|name|

		History.clear;
		History.start;

		accounts = Order.new;
		this.addAccount(\kof);
		this.addAccount(\alex);
		this.addAccount(\alex2);
		this.addAccount(\joach);
		this.addAccount(\joach2);

		you = this.myAccount(name);
		this.printYou;
		others = Order.new;




		// blockFirstEval = true;



		// this.me.logIn;

		// this.initSendMsg;
		// this.initReceiveMsg;


	}
	/*
	initSendMsg{
	this.me.code.textChangedAction = {arg ...args;
	var position = args[1];
	var removeNum = args[2];
	var string = args[3];
	this.listeners.do{|player|
	var header = ("livecode_" ++ this.me.name.asString ++ "_" ++ player.name.asString).asSymbol;
	player.net.sendMsg(header, this.me.name, position, removeNum, string);
	("SendMsg || " ++ header ++ " || " ++ position ++ " || " ++ removeNum ++ " || " ++ string).postln;
	};

	/*
	// old version
	var index = args[1];
	var remove = args[2];
	var string = args[3];
	this.listeners.do{|player|
	var header = ("livecode_" ++ this.me.name.asString ++ "_" ++ player.name.asString).asSymbol;
	player.net.sendMsg(header,this.me.name,index,remove,string);
	("SendMsg || " ++ header ++ " || " ++ index ++ " || " ++ remove ++ " || " ++ string).postln;
	};
	*/
	};

	History.forwardFunc = { |code|
	// block setup code from sending others
	if(blockFirstEval==true){
	"Setup code cached".postln;
	blockFirstEval=false;
	}{
	this.listeners.do{|player|
	var header = ("livecode_exec_" ++ this.me.name.asString ++ "_" ++ player.name.asString).asSymbol;
	player.net.sendMsg(header,this.me.name,code);
	("SendExecuteMsg || " ++ header ++ " || " ++ code ).postln;
	};
	};
	};
	}
	*/
	receivedMsg_fire{

	}
	receivedMsg_join{

	}
	receivedMsg_code{|time, msg|
		var timestamp = time;
				var header = msg[0].asSymbol;
				var sender = msg[1].asString;
				var position = msg[2].asInt;
				var removeNum = msg[3].asInt;
				var string = msg[4].asString;

				("MSG : " ++ msg).postln;
				("TIME : " ++ time).postln;

				you.code.string_(string, position, removeNum);
				("ReceivedMsg || " ++ sender ++ " || " ++ timestamp ++ " || " ++ position ++ " || " ++ removeNum ++ " || " ++ string).postln;
	}

	initReceiveMsg{
		OSCFunc({|msg, time, addr, recvPort| \oneShot.postln}, '/chat', n);
		OSCdef(\test, {|msg, time, addr, recvPort| \unmatching.postln}, '/chat', n); // def style

		this.listeners.do{|player|
			OSCFunc({|msg, time, addr, recvPort| this.receivedMsg_code(time, msg) }, ("livecode_" ++ you.name.asString).asSymbol, player.net);
		};

		this.listeners.do{|player|

			OSCresponder(
				player.net,
				("livecode_" ++ player.name.asString ++ "_" ++ this.me.name.asString).asSymbol,
				{arg ...args;
					var msg = args[2];
					var sender = msg[1].asString;
					var index = msg[2].asInt;
					var remove = msg[3].asInt;
					var string = msg[4].asString;
					("ReceivedMsg || " ++ sender ++ " || " ++ index ++ " || " ++ remove ++ " || " ++ string).postln;
					this.me.code.string_(string,index,remove);
				}
			).add;

			OSCresponder(
				player.net,
				("livecode_exec_" ++ player.name.asString ++ "_" ++ this.me.name.asString).asSymbol,
				{arg ...args;
					var msg = args[2];
					var sender = msg[1].asString;
					var code = msg[2].asString;
					args.postln;
					("ReceivedExecuteMsg || " ++ sender ++ " || " ++ code).postln;

					// added for some basic level of security
					code = code.replace("unixCmd", "!unixCmd!").replace("File", "!File!").replace("Pipe", "!Pipe!");

					code.interpret;
				}
			).add;
		}
	}

	profileIP{|name|
		var ip = switch (name)
		{\alex} { "25.164.56.183" }
		{\alex2} { "25.55.172.28" }
		{\kof} { "25.164.28.14" }
		{\joach} { "25.0.209.252" }
		{\joach2} { "25.54.28.51" }
		{"This userName isnt on profileList, srr".warn;};
		^ip;
	}

	addAccount{|name| accounts.add(PlayerKolektiv(name.asSymbol, this.profileIP(name), this)); }

	myAccount{|yourName|accounts.do{|oneP| if(oneP.name.asString == yourName.asString) { ^oneP; }; }; }
	/*
	listeners{
	var answ = List.new;
	players.do{|oneP|
	if(oneP.name.asString != yourName.asString)	{ answ.add(oneP); };
	};
	^answ;
	}
	*/


	printYou { ^("You || account " ++ you.name ++ " || ip " ++ you.net.hostname ++ " || port " ++ you.net.port).asString; }
	printListeners { var names, ips;
		this.listeners.do{|player|
			("Listeners || name " ++ player.name ++ " || ip " ++ player.net.ip).postln;
		};
		^"";
	}

}
