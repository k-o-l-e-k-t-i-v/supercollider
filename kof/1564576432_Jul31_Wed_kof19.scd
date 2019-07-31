

thisProcess.openUDPPort(10000);

(
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; Synth.new(\a,[\sus,msg[1]])}, "/a");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; Synth.new(\b,[\sus,msg[1]])}, "/b");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; Synth.new(\c,[\sus,msg[1]])}, "/c");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; Synth.new(\d,[\sus,msg[1]])}, "/d");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; }, "/e");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; }, "/f");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; }, "/g");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; }, "/h");
)

s.latency=0.2;

(

SynthDef(\a,{|freq=50,sus=0.75|
	var env = EnvGen.ar(Env.new([0,1,0],[0.02,sus]),doneAction:2);
	var sig = SinOsc.ar(freq!2,env**~slope.kr*8pi);
	sig = sig * env;
	Out.ar(0,sig);

}).add;


SynthDef(\b,{|freq=50,att=0.01,dec=0.03,sus=0.001,rel=0.3|
	var env = EnvGen.ar(Env.new([0,1,0],[0.02,sus]),doneAction:2);
	var sig = WhiteNoise.ar(env**~slope.kr/2);
	sig = HPF.ar(sig,5000);
	Out.ar(0,sig);

}).add;


SynthDef(\c,{|freq=100,sus=1.5|
	var env = EnvGen.ar(Env.new([0,1,0],[0.02,sus]),doneAction:2);
	var sig = LFSaw.ar([]++~freq.kr++[50,75],env*2pi)*2pi;
	sig = Perlin3.ar(sig[0]*~mod.kr,sig[1].sin,sig[2].cos);
	sig = sig * env;
	Out.ar(0,sig);

}).add;


SynthDef(\d,{|freq=8000,sus=0.01|
	var env = EnvGen.ar(Env.new([0,1,0],[0.02,sus]),doneAction:2);
	var sig = SinOsc.ar(freq!2,env*2pi);
	sig = sig * env;
	Out.ar(0,sig);

}).add;



)


p.push();


(

~slope={LFNoise1.kr(1/60).range(10,80)};
~mod={LFNoise1.kr(1/60).range(1,4)};
~freq={LFNoise1.kr(1/15!3).range(25,1500).round(25)};
~sus={LFNoise1.kr(1/15!3).range(0.001,4)};
)

OSCFunc.trace(true);
