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

d.keyDownAction = {
	c.sendToEach('/shared', Document.current.string);
};

d.onClose = { x.stop };

)



d = Document.new("livecoding","")
(
d.string = "";
d.string = "test2";
)

HistoryGui.new