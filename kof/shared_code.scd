(


/////////// UNCOMMENT HERE //////////////////////////

c = Collective(\kof,\livecoding,[\alex,"25.164.56.183",\joach,"25.0.209.252"]).start;
//c = Collective(\alex,\livecoding,[\kof,"25.164.28.14",\joach,"25.0.209.252"]).start;
//c = Collective(\joach,\livecoding,[\alex,"25.164.56.183",\kof,"25.164.28.14"]).start;



//d.close;
x = Participation(c).start;
d = Document.new("livecoding.scd","//welcome to shared session\n\n");

x.addResponder('/shared', { |r,t,msg|
	d.insertText(msg[3]+"",msg[1].asInt);
});



(
d.textChangedAction = {|one,two,three,four,five|
	[two,three,four].postln;


	/////////// UNCOMMENT HERE //////////////////////////

	// c.sendToName(\kof,"isc",[two,three,four]);
	c.sendToName(\alex,"isc",[two,three,four]);
	c.sendToName(\joach,"isc",[two,three,four]);

};
);

d.onClose = { x.stop };

)
