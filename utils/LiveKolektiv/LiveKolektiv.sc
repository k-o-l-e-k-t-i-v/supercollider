LiveKolektiv {
	var yourName;
	var a, n, d;
	var players;

	*new{ |name|
		^super.new.init(name);
	}

	init{|name|
		players = List.new();
		yourName = name;

		this.addPlayer(\kof);
		this.addPlayer(\alex);
		this.addPlayer(\joach);
		this.addPlayer(\joach2);

		this.me.logIn;

		this.initSendMsg;
		this.initReceiveMsg;
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
		// History.forwardFunc = { |code| };
	}

	initReceiveMsg{
		this.listeners.do{|player|
			OSCresponder(
				player.net,
				("livecode_" ++ player.name.asString ++ "_" ++ this.me.name.asString).asSymbol,
				{arg ...args;
					// var timestamp = args[0].asFloat;
					var msg = args[2];
					var sender = msg[0].asSymbol;
					var index = msg[1].asInt;
					var remove = msg[2].asInt;
					var string = msg[3].asString;
					("ReceivedMsg || " ++ sender ++ " || " ++ index ++ " || " ++ remove ++ " || " ++ string).postln;
					this.me.code.insertText(string,index);
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
