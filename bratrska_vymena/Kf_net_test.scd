// client
(
s = Server.remote(\remote , NetAddr("94.112.205.204",  57110 ) );
s.initTree;
f = {Group.new(s.defaultGroup)};
ServerTree.add(f);

s.serverRunning;                       //returns false
s.sendMsg("/g_dumpTree", 0, 0);   //only return name of server
s.notify = true;
s.queryAllNodes ;

Server.local = s;
Server.default = s;
Server.internal = s;


s.sendMsg(["/register",1]);
s.sendMsg(["/notify",1]);
s.sendMsg(["/done"]);
s.sendMsg(["/sync",1]);
s.sendMsg(["/dumpOSC",1]);

s.makeWindow;
)

// test
(
Ndef(\tik).quant = 2.0;
Ndef(\tik).fadeTime = 1.0;

Ndef(\tik,{	Splay.ar(
		Ringz.ar(Impulse.ar(1),440,0.1)
)}).play;
)

//release
s.freeAll;