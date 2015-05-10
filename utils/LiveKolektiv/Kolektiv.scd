Kolektiv {
	classvar name;
	var net;
	var server, clock;
	var sendEvents;

	*new{ |userName|
		^super.new.init(userName);
	}

	init{ |userName|
		name = userName;

		// OSCdef.newMatching(\reciveMsg_join, {|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_join(msg)} }, '/user/join', net);

		sendEvents = ();
	}

	isOtherMsg{|msg| if(msg[1].asString != name.asString) {^true}{^false};	} // msg[1] == sender

	initReceiveMsg{
		OSCdef.newMatching(\reciveMsg_join, {|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_join(msg)} }, '/user/join', net);
		OSCdef.newMatching(\reciveMsg_sync, {|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_sync(msg)} }, '/user/sync', net);

		OSCdef.newMatching(\reciveMsg_change, {|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_livecode(time, msg)} }, '/code/change', net);
		OSCdef.newMatching(\reciveMsg_execute, {|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_execute(msg)} }, '/code/execute', net);

		// oscJoin = OSCFunc({|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_join(msg)} }, '/join');
		// oscSync = OSCFunc({|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_sync(msg)} }, '/sync');
		// oscText = OSCFunc({|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_livecode(time, msg)} }, '/livecode');
		// oscExec = OSCFunc({|msg, time, addr, recvPort| if(this.isOtherMsg(msg)) {this.receivedMsg_execute(msg)} }, '/executecode');
	}

	initSendMsg{
		sendEvents.join = { net.sendMsg('/user/join', name) };
		sendEvents.sync = { net.sendMsg('/user/sync/task', name, Document.current.text.asString) };
		sendEvents.sync = { net.sendMsg('/user/active/task', name, Document.current.text.asString) };
		sendEvents.sync = { net.sendMsg('/user/active/answ', name, Document.current.text.asString) };

		// sendEventMsg.change = { net.sendMsg('/code/change', name,
		// Document.current.textChangedAction = {arg ...args; this.sendMsg_livecode(args) };
		// History.forwardFunc = { |code| this.sendMsg_execute(code) };
	}

}

