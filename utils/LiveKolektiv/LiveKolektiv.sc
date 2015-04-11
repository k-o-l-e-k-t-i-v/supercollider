Kolektiv {

	classvar name, net, proxy, quuid;
	classvar oscJoin, oscSync, oscText, oscExec;
	classvar doc;
	classvar debugBool;

	var blockFirstEval_Flag;

	*new{ |userName|
		^super.new.init(userName);
	}

	*switchDebugBool{ if(debugBool) {debugBool = false} { debugBool = true }; }

	*printDoc {
		/*
		doc = Document.findByQUuid(Document.current.quuid);

		ScIDE.setCurrentDocumentByQUuid(Document.current.quuid);
		ScIDE.setDocumentTextMirrorEnabled(Document.current.quuid,true);
		ScIDE.getTextByQUuid(Document.current.quuid.ascii);
		ScIDE.setEditablebyQUuid(Document.current.quuid.ascii,true);
		// txt = Document.current.string(0,-1).asString;

		// txt = doc.text.asString;
		// txt = Document.current.string(0,-1).asString;

		ScIDE.setCurrentDocumentByQUuid(Document.current.quuid);
		*/
		doc = Document.current;
		("\nSize of doc.text || " ++ doc.text.size).postln;
		("\nDOC.text || " ++ doc.text).postln;
	}

	init{|userName|
		CmdPeriod.run;
		Server.killAll;

		CmdPeriod.add(this);
		name = userName;
		proxy = ProxySpace.push(Server.default);
		NetAddr.broadcastFlag_(flag: true);
		// net = NetAddr("25.255.255.255", NetAddr.langPort);
		net = NetAddr("10.0.0.255", NetAddr.langPort);

		History.clear;
		History.start;

		blockFirstEval_Flag = true;
		debugBool = true;

		Document.current.text="";
		doc = Document.current;
		quuid = doc.quuid;
		("Current doc QUUID || " ++ quuid.asString).postln;

		this.initSendMsg;
		this.initReceiveMsg;

		doc.onClose = {
			oscJoin.free; oscSync.free; oscText.free; oscExec.free;
			History.end;
			net.disconnect;
			proxy.pop;
		};

		this.printYou;
		("Check if are you boot on port 57120.").warn;
		("If not, close this document, kill all servers and connect again \n").postln;
	}

	initReceiveMsg{
		oscJoin = OSCFunc({|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_join(msg)} }, '/join');
		oscSync = OSCFunc({|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_sync(msg)} }, '/sync');
		oscText = OSCFunc({|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_livecode(time, msg)} }, '/livecode');
		oscExec = OSCFunc({|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_execute(msg)} }, '/executecode');
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
		if(blockFirstEval_Flag){
			if(debugBool){ "Start setup code cached (blockFirstEval_Flag)".postln; };
			blockFirstEval_Flag = false;
		}{
			net.sendMsg('/executecode', name, code);
			if(debugBool){ ("Send_ExecuteMsg || executecode || " ++ name ++ " || " ++ code ).postln; };
		};
	}

	receivedMsg_execute{|msg|
		var sender = msg[1].asString;
		var code = msg[2].asString;
		msg.postln;

		// added for some basic level of security
		code = code.replace("unixCmd", "!unixCmd!").replace("File", "!File!").replace("Pipe", "!Pipe!");

		if(debugBool){ ("Received_ExecuteMsg || " ++ sender ++ " || " ++ code).warn };
		code.interpret;
	}

	sendMsg_join{
		("Dont write anyhing to the code").warn;
		("Start when all players will be connected to shared document, synchronizationMsg dont work").postln;
		net.sendMsg('/join', name);
	}

	receivedMsg_join{|msg|
		var sender = msg[1].asString;
		this.sendMsg_sync;
		("Recived_JoinMsg || " ++ sender ++ " || join to shared document").warn;
	}

	sendMsg_sync{

		var txt;
		doc = Document.current;
		txt = doc.text.asString;
		/*
		doc = Document.findByQUuid(Document.current.quuid);

		ScIDE.setCurrentDocumentByQUuid(Document.current.quuid);
		ScIDE.setDocumentTextMirrorEnabled(Document.current.quuid,true);
		ScIDE.getTextByQUuid(Document.current.quuid.ascii);
		ScIDE.setEditablebyQUuid(Document.current.quuid.ascii,true);
		txt = Document.current.string(0,-1).asString;

		// txt = doc.text.asString;
		// txt = Document.current.string(0,-1).asString;
		// txt = txt.replace("\r","");
		*/

		if(debugBool){ ("Send_SyncMsg || answer to recived joinMsg, sending my doc.text) || " ++ txt).postln; };
		net.sendMsg('/sync', name, txt.asString);
	}

	receivedMsg_sync{arg ...args;
		var msg = args;
		var sender = args[0][1].asString;
		var txt = args[0][2].asString;

		doc = Document.current;
		doc.string_(txt,0,-1);
		("Received_SyncMsg || " ++ sender ++ " || is connected").warn;
	}

	sendMsg_livecode {arg ...args;
		var sendTime = thisThread.seconds;
		var position = args[0][1];
		var removeNum = args[0][2];
		var string = args[0][3].asString;
		// string = string.replace("\r","");

		net.sendMsg('/livecode', name, sendTime, position, removeNum, string);
		if(debugBool){ ("Send_codeMsg || " ++ name ++ " || " ++ sendTime ++ " || " ++ position ++ " || " ++ removeNum ++ " || " ++ string).postln; };
	}

	receivedMsg_livecode{|time, message|
		var timestamp = time;
		var msg = message;

		var sender = msg[1].asString;
		var sendTime = msg[2].asString;
		var position = msg[3].asInt;
		var removeNum = msg[4].asInt;
		var string = msg[5].asString;
		var offset = thisThread.seconds - msg[2];

		doc.string_(string, position, removeNum);
		if(debugBool){ ("Received_codeMsg || " ++ sender ++ " || " ++ position ++ " || " ++ removeNum ++ " || " ++ string).postln; };
		if(debugBool){ (" -- infoTIME || rec: " ++ timestamp ++ " || send: " ++ sendTime ++ " || offset: " ++ offset).postln; };
	}

	printYou { ("\nYou || account " ++ name ++ " || ip " ++ net.ip ++ " || port " ++ net.port ++ "\n").postln; }
}