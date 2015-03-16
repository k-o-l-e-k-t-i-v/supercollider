(

//// your name here ///////////
var name = \kof;   // \alex
///////////////////////////////

c=nil;
x=nil;

if(d!==nil){
	d.close;
};

History.clear;
History.start;

c = Collective(name,\livecoding,[\alex,"25.164.56.183",\joach,"25.0.209.252",\joach2,"25.54.28.51",\kof,"25.164.28.14"]).start;

x = Participation(c).start;
d = Document.new("livecoding.scd","//welcome to shared session\n\n");

// sending

d.textChangedAction = {|one,two,three,four,five|
	c.sendToEach(\shared,two,three,four);
};

History.forwardFunc = { |code|
		c.sendToEach(\exec,name,code);
};


//receiving

x.addResponder(\shared, { |r,t,msg|
	("ok, recieved msg: "++msg).postln;
	if((msg[0]++"").contains(name.asString)==false){
		d.insertText(msg[3]+"",msg[1].asInt);
	}{("ok, filtering out your own sends: "++name).postln;};
});

x.addResponder(\exec, { |r,t,msg|
	var code = msg[msg.size-1];
	("exec:"+code).postln;
	if((msg[0]++"").contains(name.asString)==false){
		code.interpret;
		History.enter(code,msg[0]);
	}
});

d.onClose = { x.stop; History.end; };

)
