LiveKolektiv {
	var name;
	var net;
	var doc;

	var blockFirstEval;

	*new{ |userName|
		^super.new.init(userName);
	}

	init{|userName|
		name = userName;

		NetAddr.broadcastFlag_(flag:true);
		net = NetAddr("25.255.255.255", NetAddr.langPort); // broadcast

		History.clear;
		History.start;

		blockFirstEval = true;
		// doc = Document.new("LiveKolektiv","");
		Document.current.text="";
		doc = Document.current;

		this.initSendMsg;
		this.initReceiveMsg;


		this.printYou;
	}

	initReceiveMsg{
		// AbstractResponderFunc.clear;

		OSCFunc({|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_join(time, msg) }{"myJoinMsg".postln}; }, '/join');
		OSCFunc({|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_sync(msg) }{"mySyncMsg".postln}; }, '/sync');
		OSCFunc({|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_livecode(time, msg) }{"myMsg".postln}; }, '/livecode');
		OSCFunc({|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_execute(msg)} {"myExeMsg".postln};}, '/executecode');

	}

	initSendMsg{
		this.sendMsg_join;
		doc.textChangedAction = {arg ...args; this.sendMsg_livecode(args) };
		History.forwardFunc = { |code| this.sendMsg_execute(code) };
	}

	isOtherMsg{|msg|
		var sender = msg[1];
		if(sender.asString != name.asString) {^true}{^false};
	}

	sendMsg_execute{|code|
		// block setup code from sending others
		if(blockFirstEval==true){
			"Setup code cached".postln;
			blockFirstEval=false;
		}{
			net.sendMsg('/executecode', name, code);
			("SendExecuteMsg || executecode || " ++ name ++ " || " ++ code ).postln;
		};
	}

	receivedMsg_execute{|msg|
		var sender = msg[1].asString;
		// var code = msg[2].asString;
		("MSG : " ++ msg).postln;


		// added for some basic level of security
		// code = code.replace("unixCmd", "!unixCmd!").replace("File", "!File!").replace("Pipe", "!Pipe!");
		// code.interpret;
		// ^("ReceivedExecuteMsg || " ++ sender ++ " || " ++ code);
	}

	sendMsg_join{
		net.sendMsg('/join', name);
	}

	receivedMsg_join{
		this.sendMsg_sync;
	}

	sendMsg_sync{
		var txt;


		doc = Document.findByQUuid(Document.current.quuid);
		txt = doc.text.asString;

		// txt = Document.current.string(0,-1).asString;

		// txt = txt.replace("\r","");

		"Got join msg, sending my document".postln;
		"MSG:"+txt.postln;
		net.sendMsg('/sync', name, txt.asString);
	}

	receivedMsg_sync{arg ...args;
		var msg = args;
		var clean = args[0][2].asString;
		"Got sync msg, replacing my document".postln;
		args.postln;


		Document.current.string_(clean,0,-1);
	}

	sendMsg_livecode {arg ...args;
		var position = args[0][1];
		var removeNum = args[0][2];
		var string = args[0][3].asString;


		string = string.replace("\r","");

		args.postln;
		net.sendMsg('/livecode', name, position, removeNum, string);
		// ("SendMsg || livecode || " ++ name ++ " || "++ position ++ " || " ++ removeNum ++ " || " ++ string).postln;
	}

	receivedMsg_livecode{|time, message|
		var timestamp = time;
		var msg = message;

		var position = msg[2].asInt;
		var removeNum = msg[3].asInt;
		var string = msg[4].asString;

		("MSG : " ++ msg).postln;
		("TIME : " ++ timestamp).postln;

		doc.string_(string, position, removeNum);
		// ("ReceivedMsg || " ++ sender ++ " || " ++ timestamp ++ " || " ++ position ++ " || " ++ removeNum ++ " || " ++ string).postln;
	}

	printYou { ("You || account " ++ name ++ " || ip " ++ net.ip ++ " || port " ++ net.port).postln; }
}
