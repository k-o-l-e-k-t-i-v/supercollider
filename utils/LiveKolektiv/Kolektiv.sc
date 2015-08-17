Kolektiv {
	classvar <version = 0.02;

	classvar name;
	var net;
	var doc;
	var sendEvents;

	*directConnect{|userName, targetIPs| ^super.new.init(userName, targetIPs, false); }

	init{ |userName, targetIP, broadcastBool|
		"Kolektiv shared document [ver %]".format(version).postln;

		Server.local.waitForBoot({
			name = userName;

			net = List.newClear;
			if(targetIP.notNil) {
				targetIP.do({ |ip|
					net.add(
						NetAddr(ip.asString, NetAddr.langPort)
					);
				});
			};

			sendEvents = ();

			this.print;

			net.do({|target|
				this.initReceiveMsg(target);
				this.initSendMsg(target);
			});

			sendEvents.join(name);
			this.initDocument;
			this.initHistory;
		});
	}

	initDocument{
		doc = Document.new("Kolektiv sharedDoc");

		doc.textChangedAction = {arg ...args;

			var cursorIndex = args[1];
			var deleteIndex = args[2];
			var changedTxt = args[3];

			sendEvents.change(cursorIndex, deleteIndex, changedTxt, doc.text);
		};
	}

	initHistory{
		History.clear;
		History.start;

		History.forwardFunc = { |code|
			net.do({|target| sendEvents.execute(code);	});
		};
	}

	print {
		// CHECKPRINT
		"NAME || %".format(name).postln;
		"Other || IP : % ".format(net.asArray).postln;
	}

	initSendMsg{|targetNet|
		sendEvents.join = { |event, userName| targetNet.sendMsg('/user/join', userName); };

		sendEvents.change = { |event, cursorIndex, deleteIndex, changedTxt, docTxt|
			targetNet.sendMsg('/code/change', name, cursorIndex, deleteIndex, changedTxt, docTxt);
		};

		sendEvents.execute = {|event, code|	targetNet.sendMsg('/code/execute', name, code);	};
	}

	initReceiveMsg{|targetNet|
		OSCdef.newMatching(\reciveMsg_join, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			"\n - ReciveMsg : %, %".format(msgType, sender).postln;

		}, '/user/join', targetNet );

		OSCdef.newMatching(\reciveMsg_change, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			var insertCursorIndex = msg[2];
			var deleteIndex = msg[3];
			var changedTxt = msg[4];
			var code = msg[5];

			var currentCursorIndex = doc.selectionStart;

			// "ReciveMsg % from % : %, %, %, \n".format(msgType, sender, insertCursorIndex, deleteIndex, changedTxt).postln;

			doc.text = code.asString;

			// set cursor to back correct position
			if (deleteIndex <= 0)
			{
				if(currentCursorIndex >= insertCursorIndex)
				{
					doc.selectRange(currentCursorIndex + changedTxt.asString.size);
				} {
					doc.selectRange(currentCursorIndex);
				};
			} {
				if(currentCursorIndex > insertCursorIndex)
				{
					doc.selectRange(currentCursorIndex - deleteIndex);
				} {
					doc.selectRange(currentCursorIndex);
				};
			};

		}, '/code/change', targetNet);

		OSCdef.newMatching(\reciveMsg_execute, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			var code = msg[2];

			"\n\t - ReciveMsg : %, %, \n\t|%|".format(msgType, sender,  code).postln;

			thisProcess.interpreter.interpret(code.asString);

		}, '/code/execute', targetNet);
	}
}

