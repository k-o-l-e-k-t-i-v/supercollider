LiveKolektiv {
	var yourName;
	var players;
	var blockFirstEval;

	*new{ |name|
		History.clear;
		History.start;



		^super.new.init(name);
	}

	init{|name|
		players = List.new();
		yourName = name;
		blockFirstEval = true;


		this.addPlayer(\kof);
		this.addPlayer(\alex);
		this.addPlayer(\alex2);
		this.addPlayer(\joach);
		this.addPlayer(\joach2);


		this.me.logIn;

		this.initSendMsg;
		this.initReceiveMsg;

		this.printYou;
	}

	initSendMsg{
		this.me.code.textChangedAction = {arg ...args;
			var index = args[1];
			var remove = args[2];
			var string = args[3];
			this.listeners.do{|player|
				var header = ("livecode_" ++ this.me.name.asString ++ "_" ++ player.name.asString).asSymbol;
				player.net.sendMsg(header,this.me.name,index,remove,string);
				("SendMsg || " ++ header ++ " || " ++ index ++ " || " ++ remove ++ " || " ++ string).postln;
			};
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

	initReceiveMsg{
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

	addPlayer{|name| players.add(UserKolektiv(name.asSymbol)); }

	listeners{
		var answ = List.new;
		players.do{|oneP|
			if(oneP.name.asString != yourName.asString)	{ answ.add(oneP); };
		};
		^answ;
	}

	me{players.do{|oneP| if(oneP.name.asString == yourName.asString) { ^oneP; }; }; }

	printYou { ^("You || name " ++ this.me.name ++ " || ip " ++ this.me.net.ip).asString; }
	printListeners { var names, ips;
		this.listeners.do{|player|
			("Listeners || name " ++ player.name ++ " || ip " ++ player.net.ip).postln;
		};
		^"";
	}

}
