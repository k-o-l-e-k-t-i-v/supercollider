Kolektiv2 {
	classvar name;
	classvar net;
	var server, clock;
	var doc, cursorIndex, lineStartIndex, lineEndIndex;
	var sendEvents;
	var blockFirstExecute_Flag;

	*new{ |userName| ^super.new.init(userName); }

	init{ |userName|
		name = userName;
		sendEvents = ();
		blockFirstExecute_Flag = true;
		net = NetAddr("10.0.0.254", NetAddr.langPort);

		this.start;
		this.print;

		this.initReceiveMsg;
		this.initSendMsg;

		sendEvents.join;

		History.clear;
		History.start;
	}

	print {
		// CHECKPRINT
		"NAME || %".format(name).postln;
		"NET || %".format(net).postln;
	}

	start{
		History.forwardFunc = { |code|
			if(blockFirstExecute_Flag)
			{
				"Start setup code cached (blockFirstEval_Flag)".postln;
				blockFirstExecute_Flag = false;
			}
			{
				("SendEvents.execute : " ++ code.asString).postln;
			};

			sendEvents.execute(code);
		};
	}

	startSharedDocument{
		doc = Document.current;

		doc.textChangedAction = {arg ...args;
			var index = args[1];

			// cursorIndex = this.getCursorIndex;
			// this.getLineIndex(cursorIndex);

			// CHECKPRINT
			("TextChangedAction : " ++ args).postln;
			("index : " ++ index).postln;
			// ("KeyDownAction : " ++ args).postln;
			// "\n".postln;
			// ("CursorIndex : " ++ cursorIndex).postln;
			// ("LineStartIndex : " ++ lineStartIndex).postln;
			// ("LineEndIndex : " ++ lineEndIndex).postln;
			// ("CursorLineTxt : " ++ this.getCursorLineTxt).postln;

			sendEvents.change(index);

		};

		History.forwardFunc = { |code|
			/*
			if(blockFirstExecute_Flag)
			{
			"Start setup code cached (blockFirstEval_Flag)".postln;
			blockFirstExecute_Flag = false;
			},
			{
			("SendEvents.execute : " ++ code.asString).postln;
			};
			*/
			sendEvents.execute(code);
		};
	}

	getCursorLineTxt { ^doc.rangeText(lineStartIndex,lineEndIndex-lineStartIndex) }

	isOtherMsg{|msg| if(msg[1].asString != name.asString) {^true}{^false};	} // msg[1] == sender

	initReceiveMsg{
		OSCdef.newMatching(\reciveMsg_join, {|msg, time, addr, recvPort|
			if(this.isOtherMsg(msg)) {this.receivedMsg_join(msg)}
		}, '/user/join', net );
		OSCdef.newMatching(\reciveMsg_sync, {|msg, time, addr, recvPort|
			if(this.isOtherMsg(msg)) {this.receivedMsg_sync(msg)}
		}, '/user/sync', net );

		OSCdef.newMatching(\reciveMsg_change, {|msg, time, addr, recvPort|
			// if(this.isOtherMsg(msg)) {this.receivedMsg_livecode(time, msg)} {"myChange OSCdef" }, '/code/change', net);
			"myChange OSCdef".postln; msg.postln; }, '/code/change', net);

		OSCdef.newMatching(\reciveMsg_execute, {|msg, time, addr, recvPort|
			msg.postln;

			if(this.isOtherMsg(msg[1]))
			{
				(msg[1] ++ " OSCdef").postln;
				msg[2].interpret;
			}
			{
				"myExecute OSCdef".postln;
			}

		}, '/code/execute', net);
	}

	initSendMsg{
		sendEvents.join = { net.sendMsg('/user/join', name, ("Player : " ++ name).postln;) };
		// sendEvents.sync = { net.sendMsg('/user/sync/task', name, Document.current.text.asString) };
		// sendEvents.sync = { net.sendMsg('/user/active/task', name, Document.current.text.asString) };
		// sendEvents.sync = { net.sendMsg('/user/active/answ', name, Document.current.text.asString) };

		sendEvents.change = { |index| net.sendMsg('/code/change', name, doc.text) };

		sendEvents.execute = { |code| net.sendMsg('/code/execute', name, code) }



		// sendEventMsg.change = { net.sendMsg('/code/change', name,
		// Document.current.textChangedAction = {arg ...args; this.sendMsg_livecode(args) };
		// History.forwardFunc = { |code| this.sendMsg_execute(code) };
	}

	getCursorIndex { ^doc.selectionStart }

	getLineIndex { |cursorIndex|
		var flag_CurrentLine = false;
		var lineStart, lineEnd;
		var endOfLines = doc.text.findAll("\n");
		var noLine = 0;

		while ( { flag_CurrentLine == false },
			{
				lineEnd = endOfLines[noLine];
				lineStart = endOfLines[noLine-1];

				if(lineStart.isNil) {lineStart = (-1)};
				if(lineEnd.isNil) {lineEnd = doc.text.size};

				if( lineEnd >= cursorIndex ) { flag_CurrentLine = true };
				noLine = noLine + 1;
			}
		);

		lineStartIndex = lineStart+1;
		lineEndIndex = lineEnd;
	}
	/*
	initSendMsg{
	this.sendMsg_join;
	doc.textChangedAction = {arg ...args; this.sendMsg_livecode(args) };
	History.forwardFunc = { |code| this.sendMsg_execute(code) };
	}
	*/

	/*
	makeServer{
	server = Server.new(\KolektivServer , NetAddr("192.168.43.68",  57110 )  );
	server.options.protocol = \udp;
	// s.options.maxLogins = 10; // coment out this line if causing error
	server.options.initialNodeID = 1000;
	server.options.zeroConf = false;
	server.queryAllNodes;

	server.initTree;
	// f = {Group.new(server.defaultGroup)};
	ServerTree.add({Group.new(server.defaultGroup)});

	server.sendBundle(["/g_dumpTree", 0, 0]);
	server.queryAllNodes;

	Server.local = server;
	Server.default = server;
	Server.internal = server;

	server.sendBundle(0.1,[\sync,1]);
	server.sendBundle(0.2,[\notify,1]);

	server.makeWindow;
	}
	makeClock{
	clock = TempoClock.new(1).permanent_(true);
	}
	*/
}

