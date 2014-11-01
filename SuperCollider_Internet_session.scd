////////////////////////////////////////////////
// 1. set client                              //
////////////////////////////////////////////////

(
s = Server.new(\remote , NetAddr("94.112.205.204",  57110 ) );
s.options.protocol = \udp;
s.options.maxLogins = 10; // coment out this line if causing error
s.options.initialNodeID = 1000;
s.options.zeroConf = false;
s.queryAllNodes;

s.initTree;
f = {Group.new(s.defaultGroup)};
ServerTree.add(f);

s.sendBundle(["/g_dumpTree", 0, 0]);
s.queryAllNodes;

Server.local = s;
Server.default = s;
Server.internal = s;

s.sendBundle(0.1,[\sync,1]);
s.sendBundle(0.2,[\notify,1]);

s.makeWindow;
)


////////////////////////////////////////////////
// 2. open stream http://giss.tv:8000/kof.mp3 //
////////////////////////////////////////////////

////////////////////////////////////////////////
// 3. test                                    //
////////////////////////////////////////////////
(
Ndef(\tik).quant = 2.0;
Ndef(\tik).fadeTime = 1.0;

Ndef(\tik,{
	~dust = Dust.ar([1,1]/4);
	~decay = Decay.ar(~dust);
	Splay.ar(
		Ringz.ar(
			~dust,220+LFNoise0.kr(1/8).range(0,2000).round(880),2,mul:0.5)
)}).play;
)
Ndef(\tik).stop;

////////////////////////////////////////////////
// 4.a release gently                          //
////////////////////////////////////////////////

Ndef(\tik).stop(1);

////////////////////////////////////////////////
// 4.b kill it                                //
////////////////////////////////////////////////

Ndef(\tik).clear;

////////////////////////////////////////////////
// 5. (optional) monitor / mix Ndefs          //
////////////////////////////////////////////////

NdefMixer(s);


/* 6. if you have any problems (uncontrollable sounds etc.)
s.freeAll;
kills all synths (so use /w care)

also it is good to keep volume up to 0.5 if there are more people playing

live communication: https://webchat.freenode.net/
		    channel: #kolektiv
*/

