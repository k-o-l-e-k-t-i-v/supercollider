n = NetAddr("10.8.0.14", NetAddr.langPort); // cilova IP, moje IP neni potreba

(
OSCdef.newMatching(\reciveMsg_join, {|msg, time, addr, recvPort|
	var msgType = msg[0];
	var sender = msg[1];
	var code = msg[2];
	"\n\t - ReciveMsg : %, %, %".format(msgType, sender, code).postln;

}, '/user/test', n );
)

n.sendMsg('/user/test', "joach", "tohle je test string");

