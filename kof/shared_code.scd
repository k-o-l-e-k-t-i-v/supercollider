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

d.textChangedAction = {|one,two,three,four,five|
	[one,two,three,four,five].postln;
	c.sendToEach(\shared,name,two,four);
};

History.forwardFunc = { |code|
	c.sendToEach(\exec,name,code);
};


//receiving

x.addResponder(\shared, { |r,t,msg|
	("msg[0] : " ++ msg[0].asString).postln;
	("msg[1] : " ++ msg[1].asString).postln;                       ("msg[2] : " ++ msg[2].asString).postln;
	("msg[3] : " ++ msg[3].asString).postln;
	if((msg[msg.size-3].asString).contains(name.asString)==false){


		"if passed ".postln;
		d.insertText(msg[msg.size-1].asString,msg[msg.size-2].asInt);
	}{("ok, filtering out your own sends: "++msg[msg.size-3]).postln;};
});


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

d.onClose = { x.stop; History.end; };

)
