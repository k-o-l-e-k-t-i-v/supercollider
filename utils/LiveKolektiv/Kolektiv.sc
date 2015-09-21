Kolektiv {
	classvar ver = 0.074;
	classvar doc;
	classvar isOpenDoc;

	classvar instance;
	var <name, net, group;
	var <events;

	var <proxyspace, <clock, <tempo;
	var isMyCmdPeriod = true;

	accounts{
		^[
			\kof -> "10.8.0.2",
			\joach -> "10.8.0.3",
			\alex -> "10.8.0.6",
			\tester -> "10.8.0.4"
		];
	}

	*new{ |name| ^super.newCopyArgs(name).init; }

	*free {
		instance.isNil.if({
			"You arn not log in to Kolektiv session".postln;
		},{
			"You leaving Kolektiv session".format(name).warn;
			CmdPeriod.remove(instance);
			instance.events.exit;
			OSCdef.freeAll;
			History.end;
			History.clear;
			instance = nil;
		})
	}

	*players { instance.events.join; }

	*version { instance.print; ^ver; }

	*print { instance.isNil.if( { "You arn not log in to Kolektiv session".postln; },{	instance.print; })
	}

	*historySave {
		var dir = (Kolektiv.filenameSymbol.asString.dirname +/+ "History").standardizePath;
		var file = "KolektivHistory_%.scd".format(Date.localtime.stamp);
		var fileTemp = "KolektivHistory_temp.scd";
		History.end;
		History.saveCS(dir +/+ file);
		History.saveCS(dir +/+ fileTemp);
	}

	*historyReplay {
		var dir = (Kolektiv.filenameSymbol.asString.dirname +/+ "History").standardizePath;
		var fileTemp = "KolektivHistory_temp.scd";
		History.clear;
		History.loadCS(dir +/+ fileTemp);
		History.play;
	}

	init {
		instance.isNil.if({
			instance = this;
			CmdPeriod.add(this);

			(NetAddr.langPort != 57120).if({
				"Kolektiv not booting on port 57120 [current boot port %]".format(NetAddr.langPort).warn;
				instance = nil;
			}, {
				"Kolektiv shared document [ver %]".format(ver).postln;

				Server.local.options.memSize = 65536*80;
				Server.internal.options.memSize = 65536*80;

				Server.local.waitForBoot({

					// clock = TempoBusClock.new;
					// clock.permanent = true;
					// clock.tempo = 120/60;

					net = Dictionary.new;
					group = Dictionary.new;

					// thisProcess.openUDPPort(8080);

					this.accounts.do({ |profil|
						(name.asString != profil.key.asString).if({

							var id = profil.value.asString.replace(".","");
							var profilGroup = Group.basicNew(Server.local, id.asInteger);
							group.put(
								profil.key.asSymbol,
								Server.local.sendBundle(nil, profilGroup.newMsg;);
							);

							net.put(
								profil.key.asSymbol,
								NetAddr(profil.value.asString, NetAddr.langPort)
								// NetAddr(profil.value.asString, 8080)
							);
						});
					});

					isOpenDoc = false;

					this.initHistory;
					this.initReceiveMsg;
					this.initSendMsg;

					events.join;
					// events.clockTime(clock.beats);
					// ShutDown.add({ this.free; });
				}
				);
			});
		}, {
			"Exist running instance of Kolektiv(%). Use at first .free to exit".format(instance.name).warn;
		});
	}

	print {

		// CHECKPRINT
		"\nNAME || %".format(name).postln;
		// "Proxy : %".format(proxyspace).postln;
		// "Clock : %".format(clock).postln;
		// "Tempo : %".format(clock.tempo).postln;
		// "Beats : %".format(clock.beats).postln;
		// events.clockTime(clock.beats);
		net.keys.do({|key|
			"Others || name: %, ip : % ".format(key, net.at(key)).postln;
		});
		OSCdef.allFuncProxies.do({|temp| temp.do({|osc|	osc.postln;	});	});
	}

	cmdPeriod {
		isMyCmdPeriod.if( { events.cmdPeriod; } , { isMyCmdPeriod = true; "CMD+. free all players synth".warn; } );
	}

	initSendMsg {
		events = ();

		events.join = {|event| net.keysValuesDo {|key, target|
			target.sendMsg('/user/join', name.asSymbol);
		}};
		events.alive = {|event, target, clockTime|
			net.at(target.asSymbol).sendMsg('/user/alive', name.asSymbol, clockTime);
		};
		events.exit = {|event| net.keysValuesDo {|key, target|
			target.sendMsg('/user/exit', name.asSymbol);
		}};


		events.cmdPeriod = {|event| net.keysValuesDo {|key, target|
			target.sendMsg('/code/cmdPeriod', name);
		}};
		events.execute = {|event, code|	net.keysValuesDo {|key, target|
			target.sendMsg('/code/execute', name, code);
		}};
		events.change = { |event, cursorIndex, deleteIndex, changedTxt, docTxt| net.keysValuesDo {|key, target|
			target.sendMsg('/code/change', name, cursorIndex, deleteIndex, changedTxt, docTxt);
		}};


		events.clockTime = {|event, clockTime| net.keysValuesDo {|key, target|
			target.sendMsg('/clock/latency', name.asSymbol, clockTime);
		}};
		events.clockTimeAnswer = {|event, target, clockTime|
			net.at(target.asSymbol).sendMsg('/clock/latencyAnswer', name.asSymbol, clockTime);
		};
	}

	initReceiveMsg {

		OSCdef.newMatching(\msg_join, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			"Player % has joined to session".format(sender).warn;

			events.alive(sender.asSymbol);
			// events.alive(sender.asSymbol, clock.beats);

		}, '/user/join', nil).permanent_(true);

		OSCdef.newMatching(\msg_alive, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			// var senderClock = msg[2];
			"Player % is also prepared".format(sender).warn;
			// clock.beats_(senderClock);

		}, '/user/alive', nil).permanent_(true);

		OSCdef.newMatching(\msg_exit, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			"Player % exit session".format(sender).warn;

		}, '/user/exit', nil).permanent_(true);

		/*
		OSCdef.newMatching(\msg_clockLatency, {|msg, time, addr, recvPort|
		var msgType = msg[0];
		var sender = msg[1];
		var senderClock = msg[2].asFloat;
		"Player % check letency [%]".format(sender, (clock.beats.asFloat - senderClock)).postln;

		events.clockTimeAnswer(sender, clock.beats);
		}, '/clock/latency', nil).permanent_(true);

		OSCdef.newMatching(\msg_clockLatencyAnswer, {|msg, time, addr, recvPort|
		var msgType = msg[0];
		var sender = msg[1];
		var senderClock = msg[2].asFloat;
		"Answer on latency check from % : %".format(sender, (clock.beats.asFloat - senderClock)).postln;

		}, '/clock/latencyAnswer', nil).permanent_(true);
		*/

		OSCdef.newMatching(\msg_kill, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			"Player % call cmdPeriod".format(sender).warn;
			isMyCmdPeriod = false;
			CmdPeriod.run;
		}, '/code/cmdPeriod', nil).permanent_(true);

		OSCdef.newMatching(\msg_change, {|msg, time, addr, recvPort|

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
				{ doc.selectRange(currentCursorIndex + changedTxt.asString.size); }
				{ doc.selectRange(currentCursorIndex); };
			} {
				if(currentCursorIndex > insertCursorIndex)
				{ doc.selectRange(currentCursorIndex - deleteIndex); }
				{ doc.selectRange(currentCursorIndex); };
			};

		}, '/code/change', nil).permanent_(true);

		OSCdef.newMatching(\msg_execute, {|msg, time, addr, recvPort|
			var msgType = msg[0];
			var sender = msg[1];
			var code = msg[2];
			if(code.asString.find("Kolektiv").isNil)
			{
				code = this.blockCode(code);
				// this.putNodeToGroup;
				"\n\nCodeExecute from %\n%".format(sender,  code).postln;
				thisProcess.interpreter.interpret(code.asString);
				History.enter(code.asString, sender.asSymbol);
			};
		}, '/code/execute', nil).permanent_(true);
	}
	putNodeToGroup{
		Server.local.nextNodeID.postln;
	}

	blockCode {|code|

		".plot".matchRegexp(code.asString).if({ code = code.asString.replace(".plot",""); });
		^code;

		/*
		(
		var code = "Kolektiv(aaa)";
		var txt = "Kolektiv*";
		var find = txt.matchRegexp(code).postln;

		var answ;
		find.if({ answ = code.replace(".plot",""); });
		answ.postln;
		)*/
	}

	initHistory {

		History.localOff;
		History.clear;
		History.start;
		History.forwardFunc = { |code|
			History.enter(code.asString, name.asSymbol);
			events.execute(code.asString);
		};
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

					events.change(cursorIndex, deleteIndex, changedTxt, doc.text);
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

}
