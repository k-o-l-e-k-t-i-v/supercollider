(
c = Collective(\kof,\livecoding,[\alex,"25.164.56.183",\joach,"25.0.209.252"]).start;
//c = Collective(\alex,\livecoding,[\kof,"25.164.28.14",\joach,"25.0.209.252"]).start;
//c = Collective(\joach,\livecoding,[\alex,"25.164.56.183",\kof,"25.164.28.14"]).start;


x = Participation(c).start;
d = Document.new("livecoding.scd","//welocme to shared session\n\n");


x.addResponder('/shared', { |r,t,msg|
	var str = msg[msg.size-1];
	//msg.postln;
	defer { d.text=str.asString }
});

d.keyDownAction = {arg ...args;
	if(args[3]!==65533,{
		//postln("ok "++args[3]);
	c.sendToEach('/shared', Document.current.string);
	},{
		//postln("not ok "++args[3]);
	});
};

d.onClose = { x.stop };

)