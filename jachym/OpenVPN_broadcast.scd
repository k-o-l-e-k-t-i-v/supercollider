n = NetAddr("127.0.0.1", NetAddr.langPort);

(
var name = \joach;
NetAddr.broadcastFlag = true;

OSCdef.newMatching(\reciveMsg, {|msg, time, addr, recvPort|
	var msgType = msg[0];
	var sender = msg[1];
	var code = msg[2];

	"\n\t - myName : %".format(name).postln;
	"\n\t - sender : %".format(sender).postln;
	"\n\t - code : %".format(code).postln;

	if(sender.asString != name.asString)
	{
		"\n\t - ReciveMsg : %, %, %".format(msgType, sender, code).postln;
	} {
		"\n\t - MyMsg : %, %, %".format(msgType, sender, code).postln;
	};

}, '/user/test', n );


)

n.sendMsg('/user/test', \joach, "tohle je test string");
n.sendMsg('/user/test', \kof, "tohle je test string");

OSCdef.allFuncProxies;
OSCdef(\reciveMsg).disable;
OSCdef(\reciveMsg).enable;

