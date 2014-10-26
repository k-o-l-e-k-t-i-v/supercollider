// 1. set client
(
s = Server.remote(\remote , NetAddr("94.112.205.204",  57110 ) );
s.options.maxLogins = 10;
s.initTree;
f = {Group.new(s.defaultGroup)};
ServerTree.add(f);

s.sendBundle(["/g_dumpTree", 0, 0]);
s.queryAllNodes;

Server.local = s;
Server.default = s;
Server.internal = s;

s.sendBundle(["/register",1]);
s.sendBundle(["/notify",1]);
s.sendBundle(["/done"]);
s.sendBundle(["/sync",1]);


s.makeWindow;
)



// 2. test
(
Ndef(\tik).quant = 2.0;
Ndef(\tik).fadeTime = 1.0;

Ndef(\tik,{
	~dust = Dust.ar([1,1]/4);
	~decay = Decay.ar(~dust);
	Splay.ar(
	Ringz.ar(
		~dust,880+LFNoise0.kr(1/8).range(0,5000).round(880),2,mul:0.5)
)}).play;
)
Ndef(\tik).stop;

// 3. release
s.freeAll;


// 4. (optional) monitor / mix Ndefs
NdefMixer(s);