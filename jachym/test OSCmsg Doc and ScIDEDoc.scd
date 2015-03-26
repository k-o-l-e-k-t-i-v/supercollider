// SC 3.7.0alpha win

p.pop;

(
var net;
var userA,userB;
var recA,recB;

userA = Document.new("userA","");
userB = Document.new("userB","");
net = NetAddr("127.0.0.1", 57120);

userA.textChangedAction = { arg ...args;
	var position = args[1];
	var removeNum = args[2];
	var string = args[3];
	var userName = "userA";
	net.sendMsg('/livecodeAB',userName,string,position,removeNum); //nove oznaceni headeru pro kazdy smer
	("SendMsg from " ++ userName ++ " || " ++ string ++ " || " ++ position).postln;
};

userB.textChangedAction = { arg ...args;
	var position = args[1];
	var removeNum = args[2];
	var string = args[3];
	var userName = "userB";
	net.sendMsg('/livecodeBA',userName,string,position,removeNum); //nove oznaceni headeru pro kazdy smer
	("SendMsg from " ++ userName ++ " || " ++ string ++ " || " ++ position).postln;
};

recA = OSCresponder(
	net , // Listen to all IP addresses
	'/livecodeBA',
	{arg ...args;
		var timestamp = args[0].asFloat;
		var msg = args[2];
		var sender = msg[1].asString;
		var char = msg[2].asString;
		var index = msg[3].asInt;
		var removeNum = msg[4].asInt;

		("Received on userA form"+sender+"char:"+char+"index:"+index).postln;
		userA.string_(char,index,removeNum);
	}
);
recA.add;

recB = OSCresponder(
	net , // Listen to all IP addresses
	'/livecodeAB',
	{arg ...args;
		var timestamp = args[0].asFloat;
		var msg = args[2];
		var sender = msg[1].asString;
		var char = msg[2].asString;
		var index = msg[3].asInt;
		var removeNum = msg[4].asInt;

		("Received on userA form"+sender+"char:"+char+"index:"+index).postln;
		userA.string_(char,index,removeNum);
	}
);
recB.add;
)

