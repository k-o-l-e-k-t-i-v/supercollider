Kolektiv {
	classvar ver = 0.061;

	classvar name;
	classvar net;
	classvar doc;
	classvar sendEvents;

	classvar isOpenDoc;

	*new{ |userName| ^super.new.init(userName); }

	*free {
		"Player % leave session".format(name).warn;
		OSCdef.freeAll;
		History.end;
	}

	*version { super.new.print; ^ver; }

	*print { super.new.print; }

	init { |userName|

		History.started.if(
			{
				"Kolektiv document already running".postln;

			}, {


				"Kolektiv shared document [ver %]".format(ver).postln;

				Server.local.options.memSize = 65536*4;
				Server.internal.options.memSize = 65536*4;

				Server.local.waitForBoot({

					name = userName;
					net = Dictionary.new;

					if(name.asString != "kof") { net.put(\kof,  NetAddr("10.8.0.2", NetAddr.langPort)) };
					if(name.asString != "joach") { net.put(\joach,  NetAddr("10.8.0.3", NetAddr.langPort)) };
					if(name.asString != "alex") { net.put(\alex,  NetAddr("10.8.0.6", NetAddr.langPort)) };
					if(name.asString != "tester") { net.put(\tester,  NetAddr("10.8.0.4", NetAddr.langPort)) };

					sendEvents = ();

					isOpenDoc = false;

					net.keys.do({|target|
						this.initReceiveMsg(target, net.at(target));
						net.at(target).sendMsg('/user/join', name.asSymbol);
					});

					this.initHistory;
				});
			};
		);
	}

	print {

		// CHECKPRINT
		"n\NAME || %".format(name).postln;
		net.keys.do({|key|
			"Others || name: %, ip : % ".format(key, net.at(key)).postln;
		});
		OSCdef.allFuncProxies.do({|temp| temp.do({|osc|	osc.postln;	});	});
	}

	/*
	initSendMsg { |targetNet|
	sendEvents.change = { |event, cursorIndex, deleteIndex, changedTxt, docTxt|
	targetNet.sendMsg('/code/change', name, cursorIndex, deleteIndex, changedTxt, docTxt);
	};

	sendEvents.execute = {|event, code|	targetNet.sendMsg('/code/execute', name, code);	};
	}
	*/

	initReceiveMsg { |targetName, targetNet|

		OSCdef.newMatching("\\reciveMsg_join_%".format(targetName).asSymbol, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			"Player % has joined to session".format(sender).warn;

			net.at(sender).sendMsg('/user/alive', name.asSymbol);

		}, '/user/join', targetNet).oneShot.permanent_(true);

		OSCdef.newMatching("\\reciveMsg_alive_%".format(targetName).asSymbol, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			"Player % is also prepared".format(sender).warn;

		}, '/user/alive', targetNet).oneShot.permanent_(true);

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

		}, '/code/change', targetNet).permanent_(true);

		OSCdef.newMatching("\\reciveMsg_execute_%".format(targetName).asSymbol, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			var code = msg[2];
			if(code.asString.find("Kolektiv").isNil)
			{
				{
					"\n\nCodeExecute from %\n%".format(sender,  code).postln;
					thisProcess.interpreter.interpret(code.asString);
				};
			};
		}, '/code/execute', targetNet).permanent_(true);
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

		History.start;
		History.forwardFunc = { |code|
			net.keys.do({|target|
				net.at(target).sendMsg('/code/execute', name, code.asString; );
			});
		};
	}
}
