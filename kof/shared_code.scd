(

c = Collective(\peer,\livecoding,[\kof,"127.0.0.1"]).start;

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