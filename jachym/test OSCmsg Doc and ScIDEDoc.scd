// SC 3.7.0alpha win

(
~userA = Document.new("userA","");
~ideDocA = ScIDEDocument.findByQUuid(~userA.quuid);
~userB = Document.new("userB","");
~ideDocB = ScIDEDocument.findByQUuid(~userB.quuid);
~net = NetAddr("127.0.0.1", 57120);

~ideDocA.textChangedAction = { arg ...args;
	var string = args[3];
	var position = args[1];
	var userName = "userA";
	~net.sendMsg('/livecodeAB',userName,string,position); //nove oznaceni headeru pro kazdy smer
	("SendMsg from " ++ userName ++ " || " ++ string ++ " || " ++ position).postln;
};
~ideDocB.textChangedAction = { arg ...args;
	var string = args[3];
	var position = args[1];
	var userName = "userB";
	~net.sendMsg('/livecodeBA',userName,string,position); //nove oznaceni headeru pro kazdy smer
	("SendMsg from " ++ userName ++ " || " ++ string ++ " || " ++ position).postln;
};

~recA = OSCresponder(
	~net , // Listen to all IP addresses
	'/livecodeBA',
	{arg ...args;
		var timestamp = args[0].asFloat;
		var msg = args[2];
		var sender = msg[1].asString;
		var char = msg[2].asString;
		var index = msg[3].asInt;
		("Received on userA form"+sender+"char:"+char+"index:"+index).postln;
		~ideDocA.insertText(char,index);
	}
);
~recA.add;

~recB = OSCresponder(
	~net , // Listen to all IP addresses
	'/livecodeAB',
	{arg ...args;
		var timestamp = args[0].asFloat;
		var msg = args[2];
		var sender = msg[1].asString;
		var char = msg[2].asString;
		var index = msg[3].asInt;
		("Received on userB form"+sender+"char:"+char+"index:"+index).postln;
		~ideDocB.insertText(char,index);
	}
);
~recB.add;
)

