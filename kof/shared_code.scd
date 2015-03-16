(

//// your name here ///////////
var name = \kof;   // \alex
///////////////////////////////

c=nil;
x=nil;

if(d!==nil){
	d.close;
};


c = Collective(name,\livecoding,[\joach2,"25.54.28.51",\joach,"25.0.209.252",\alex,"25.164.56.183",\kof,"25.164.28.14"]).start;

c.autoCollect;

x = Participation(c).start;
d = Document.new("livecoding.scd","//welcome to shared session\n\n");

// sending
/*
d.textChangedAction = {arg ...args;
	args.postln;
	// [one,two,three,four,five].postln;
	c.sendToEach(\shared,name,args[args.size-3],args[args.size-1]);
};
*/

d.keyDownAction = {arg ...args;
	("key down + "++args).postln;
	// [one,two,three,four,five].postln;
	if(args[args.size-3].asInt!==65533){
	c.sendToEach(\shared,name,args[args.size-5],args[args.size-1]);
	}
};

History.forwardFunc = { |code|
	c.sendToEach(\exec,name,code);
};


//receiving

x.addResponder(\shared, { |r,t,msg|
	("recieved: "++msg).postln;
	// tahle podminka nefungovala; string.contains -> joach.contains(joach2) = TRUE ---> chyba
	if(msg[msg.size-3].asString != name.asString){
		("if passed"+msg[msg.size-3]).postln;
		d.insertText(msg[msg.size-1].asString,msg[msg.size-2].asInt+1);
	}{("ok, filtering out your own sends: "++msg[msg.size-3]).postln;};
});

/*
x.addResponder(\exec, { |r,t,msg|
	var code = msg[msg.size-1];
	("exec:"+code).postln;
	if((msg[0]++"").contains(name.asString)==false){
		code.interpret;
		History.enter(code,msg[0]);
	}
});


History.clear;
History.start;
*/

d.onClose = { x.stop; History.end; };

)
