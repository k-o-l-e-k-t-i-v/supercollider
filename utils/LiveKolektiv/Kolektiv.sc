Kolektiv {
	classvar ver = 0.03;

	classvar name;
	classvar net;
	classvar doc;
	classvar sendEvents;

	classvar isOpenDoc;

	*new{ |userName| ^super.new.init(userName); }

	*version { super.new.print; ^ver; }

	*print { super.new.print; }

	*connect { |ip| super.new.tryConnect(ip); }

	*document {
		super.new.initDocument(false);
		super.new.initHistory;
	}

	*sharedDocument {
		super.new.initDocument(true);
		super.new.initHistory;
	}

	print {

		// CHECKPRINT
		"NAME || %".format(name).postln;
		net.keys.do({|key|
			"Others || name: %, ip : % ".format(key, net.at(key)).postln;
		});

	}

	init { |userName|

		"Kolektiv shared document [ver %]".format(ver).postln;

		Server.local.waitForBoot({
			name = userName;
			net = Dictionary.new;

			sendEvents = ();

			isOpenDoc = false;
		});
	}

	tryConnect { |ip|

		var tempNet = NetAddr(ip.asString, NetAddr.langPort);
		tempNet.sendMsg('/user/join', name.asSymbol);
		tempNet.sendMsg('/user/reconnect', name.asSymbol);

		"Waiting for confirm of connection from ip % ...".format(ip).warn;

		OSCdef.newMatching(\answerMsg_join, {|msg, time, addr, recvPort|
			tempNet.sendMsg('/user/join', name.asSymbol);
			this.initNet(msg, addr);
		}, '/user/join', tempNet).oneShot;

	}

	initNet	{ |msg, addr|

		var msgType = msg[0];
		var sender = msg[1];
		var ip = addr.ip;

		net.put(sender.asSymbol, NetAddr(ip.asString, NetAddr.langPort) );

		net.keys.do({|target|
			this.initReceiveMsg(target, net.at(target));
			this.initSendMsg(net.at(target));
		});

		"Open connection with ip % |%|".format(ip, sender).warn;

	}

	initSendMsg { |targetNet|

		sendEvents.join = { |event, userName| targetNet.sendMsg('/user/join', userName);};

		sendEvents.change = { |event, cursorIndex, deleteIndex, changedTxt, docTxt|
			targetNet.sendMsg('/code/change', name, cursorIndex, deleteIndex, changedTxt, docTxt);
		};

		sendEvents.execute = {|event, code|	targetNet.sendMsg('/code/execute', name, code);	};

	}

	initReceiveMsg { |targetName, targetNet|

		OSCdef.newMatching("reciveMsg_reconnect-%".format(targetName).asSymbol, {|msg, time, addr, recvPort|
			// "Open connection with ip % |%|".format(targetNet.ip, targetName).warn;
			sendEvents.join(name);
		}, '/user/reconnect', targetNet);

		OSCdef.newMatching("\\reciveMsg_change_%".format(targetName).asSymbol, {|msg, time, addr, recvPort|

			var msgType = msg[0];
			var sender = msg[1];
			var insertCursorIndex = msg[2];
			var deleteIndex = msg[3];
			var changedTxt = msg[4];
			var code = msg[5];

			var currentCursorIndex = doc.selectionStart;

			doc.text = code.asString;

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

		OSCdef.newMatching("\\reciveMsg_execute_%".format(targetName).asSymbol, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			var code = msg[2];

			"\n\nCodeExecute from %\n%".format(sender,  code).postln;

			thisProcess.interpreter.interpret(code.asString);
		}, '/code/execute', targetNet);

	}

	initDocument { |isShared|

		if(isOpenDoc != true)
		{
			if(isShared)
			{
				doc = Document.new("Kolektiv sharedDoc");

				doc.textChangedAction = {arg ...args;

					var cursorIndex = args[1];
					var deleteIndex = args[2];
					var changedTxt = args[3];

					sendEvents.change(cursorIndex, deleteIndex, changedTxt, doc.text);
				};
			} {
				doc = Document.new("KolektivDoc %".format(name));
			};

			isOpenDoc = true;
		} {
			"KolektivDoc has opened already".postln;
		};

		doc.onClose = { isOpenDoc = false };

	}

	initHistory {

		History.clear;
		History.start;

		History.forwardFunc = { |code|
			if(doc.isFront)
			{
				sendEvents.execute(code);
			}
		};

	}

}

