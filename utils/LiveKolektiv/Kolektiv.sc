Kolektiv {
	classvar <version = 0.01;

	classvar name;
	var net;
	var doc;
	var sendEvents;

	*directConnect{|userName, targetIPs| ^super.new.init(userName, targetIPs); }

	init{ |userName, targetIP|
		"Kolektiv shared document [ver %] - check if you using port 57120".format(version);

		Server.local.waitForBoot({
			name = userName;
			sendEvents = ();

			net = List.newClear;
			if(targetIP.notNil) {
				targetIP.do({ |ip| net.add(NetAddr(ip.asString, NetAddr.langPort));	});
			};

			this.print;

			net.do({|target|
				this.initReceiveMsg(target);
				this.initSendMsg(target);
			});

			sendEvents.join;
			this.initDocument;
			this.initHistory;
		});
	}

	print {
		// CHECKPRINT
		"NAME || %".format(name).postln;
		"Other || IP : % ".format(net.asArray).postln;
	}

	initDocument{
		doc = Document.new("Kolektiv sharedDoc");
		doc.textChangedAction = { arg ...args; sendEvents.change(doc.string(0, doc.string.size)); };
	}

	initHistory{
		History.clear;
		History.start;

		History.forwardFunc = { |code|
			net.do({|targetNet|
				targetNet.sendMsg('/code/execute', name, code);
			});
		};
	}

	initSendMsg{|targetNet|
		sendEvents.join = { targetNet.sendMsg('/user/join', name);};
		sendEvents.change = { |index| targetNet.sendMsg('/code/change', name, doc.text); };
	}

	initReceiveMsg{|targetNet|
		OSCdef.newMatching(\reciveMsg_join, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			var code = msg[2];

			("\nReciveMsg : %, %".format(msgType, sender)).warn;

		}, '/user/join', targetNet );

		OSCdef.newMatching(\reciveMsg_change, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			var code = msg[2];

			doc.text_(code);

		}, '/code/change', targetNet);

		OSCdef.newMatching(\reciveMsg_execute, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			var code = msg[2];

			thisProcess.interpreter.interpret(code.asString);

		}, '/code/execute', targetNet);
	}
}

