// SC 3.7.0alpha win

(
~userA = Document.new("userA","");
~ideDocA = ScIDEDocument.findByQUuid(~userA.quuid);
~userB = Document.new("userB","");
~ideDocB = ScIDEDocument.findByQUuid(~userB.quuid);

~userA_isMyChange = false;
~ideDocA.keyUpAction = {arg ...args;
	// args.postln;
	// if(args[3].asInt<10000){
	~userA_isMyChange = true;
	// }
};
~ideDocA.textChangedAction = { arg ...args;
	("\nuserA_isMyChange || " ++ ~userA_isMyChange).postln;
	if(~userA_isMyChange)
	{
		var string = args[3];
		var position = args[1];
		var userName = "userA";
		var n = NetAddr("127.0.0.2", 57120);
		// n.ip;
		n.sendMsg('/livecode',userName,string,position);
		("SendMsg from " ++ userName ++ " || " ++ string ++ " || " ++ position).postln;
		~userA_isMyChange = false;
	};
};

~userB_isMyChange = false;
~ideDocB.keyUpAction = {arg ...args;
	// args.postln;
	// if(args[3].asInt<10000){
	~userB_isMyChange = true;
	// }
};
~ideDocB.textChangedAction = { arg ...args;
	("\nuserB_isMyChange || " ++ ~userB_isMyChange).postln;
	if(~userB_isMyChange)
	{
		var string = args[3];
		var position = args[1];
		var userName = "userB";
		var n = NetAddr("127.0.0.1", 57120);
		// n.ip;
		n.sendMsg('/livecode',userName,string,position);
		("SendMsg from " ++ userName ++ " || " ++ string ++ " || " ++ position).postln;
		~userB_isMyChange = false;
	};
};

~recA = OSCresponder(
	NetAddr("127.0.0.1", 57120) , // Listen to all IP addresses
	'/livecode',
	{arg ...args;
		var timestamp = args[0].asFloat;
		var msg = args[2];
		var sender = msg[1].asString;
		var char = msg[2].asString;
		var index = msg[3].asInt;
		// args.postln;
		("Received on userA form"+sender+"char:"+char+"index:"+index).postln;
		~ideDocA.insertText(char,index);
		~userA_isMyChange = false;
	}
);
~recA.add;

~recB = OSCresponder(
	NetAddr("127.0.0.2", 57120) , // Listen to all IP addresses
	'/livecode',
	{arg ...args;
		var timestamp = args[0].asFloat;
		var msg = args[2];
		var sender = msg[1].asString;
		var char = msg[2].asString;
		var index = msg[3].asInt;
		// args.postln;
		("Received on userB form"+sender+"char:"+char+"index:"+index).postln;
		~ideDocB.insertText(char,index);
		~userB_isMyChange = false;
	}
);
~recB.add;
)

