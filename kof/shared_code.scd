(

//// your name here ///////////
var name = \kof;   // \alex
///////////////////////////////

c = Collective(name,\livecoding,[\alex,"25.164.56.183",\joach,"25.0.209.252",\kof,"25.164.28.14"]).start;

if(d!==nil){
	d.close;
};


x = Participation(c).start;
d = Document.new("livecoding.scd","//welcome to shared session\n\n");

x.addResponder(\shared, { |r,t,msg|
	if((msg[0]++"").contains(name.asString)==false){
		d.insertText(msg[3]+"",msg[1].asInt);
	}{"denying loopback".postln;};
});



(
d.textChangedAction = {|one,two,three,four,five|
	c.sendToEach(\shared,two,three,four);
};
);

d.onClose = { x.stop };

)



c.sendToName(\kof,"aisc",[\shared,1,"a",'a']);