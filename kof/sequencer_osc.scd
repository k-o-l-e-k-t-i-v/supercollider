
p.push();
thisProcess.openUDPPort(10000);

(
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; Synth.new(\a,[\sus,msg[1]])}, "/a");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; Synth.new(\b,[\sus,msg[1]])}, "/b");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; Synth.new(\c,[\sus,msg[1]])}, "/c");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; Synth.new(\d,[\sus,msg[1]])}, "/d");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; Synth.new(\e,[\sus,msg[1]])}, "/e");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; Synth.new(\f,[\sus,msg[1]])}, "/f");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; Synth.new(\g,[\sus,msg[1]])}, "/g");
OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; Synth.new(\h,[\sus,msg[1]])}, "/h");
)

s.latency=0.2;

(

SynthDef(\a,{|freq=50,sus=0.75|
	var env = {EnvGen.ar(Env.new([0,1,0],[0.02,~sus.kr]),doneAction:2)};
	var sig = SinOsc.ar(freq!2,env**~slope.kr*8pi);
	sig = sig * env;
    sig = Splay.ar(sig,0.9,1);
	Out.ar(0,sig);

}).add;

SynthDef(\b,{|freq=50,sus=0.5|
	var env = {EnvGen.ar(Env.new([0,1,0],[0.02,~sus.kr]),doneAction:2)};
	var sig = SinOsc.ar(freq!2+(env**~slope.kr*100),env**(~slope.kr/2)*8pi);
    sig = sig + BrownNoise.ar(1!2*(env**~slope.kr));
	sig = sig * env;
    sig = Splay.ar(sig,0.9,1);
	Out.ar(0,sig);

}).add;



SynthDef(\c,{|freq=100,sus=1.5|
	var env = {EnvGen.ar(Env.new([0,1,0],[0.02,~sus.kr]),doneAction:2)};
	var sig = LFSaw.ar(~freq.kr,env*2pi)*2pi;
	sig = Perlin3.ar(sig[0]*~mod.kr,sig[1].sin,sig[2].cos);
	sig = sig * env;
    sig = Splay.ar(sig,0.9,1);
	Out.ar(0,sig);

}).add;

SynthDef(\d,{|freq=50,att=0.01,dec=0.03,sus=0.001,rel=0.3|
	var env = {EnvGen.ar(Env.new([0,1,0],[0.02,~sus.kr]),doneAction:2)};
	var sig = WhiteNoise.ar(env**~slope.kr/2);
	sig = HPF.ar(sig,5000);
    sig = Splay.ar(sig,0.9,1);
	Out.ar(0,sig);

}).add;


SynthDef(\e,{|freq=50,sus=0.5|
	var env = {EnvGen.ar(Env.new([0,1,0],[~sus.kr,~sus.kr*4]),doneAction:2)};
	var sig = LFSaw.ar(~mel.kr+(1/160/(1..12)));
	sig = sig * env;
    sig = Splay.ar(sig,0.9,1);
	Out.ar(0,sig);

}).add;


SynthDef(\f,{|freq=50,sus=0.5|
	var env = {EnvGen.ar(Env.new([0,1,0],[0.02,~sus.kr]),doneAction:2)};
	var sig = LFSaw.ar(~mel.kr+(1/160/(1..12)));
	sig = sig * env;
    sig = Splay.ar(sig,0.9,1);
	Out.ar(0,sig);

}).add;


SynthDef(\g,{|freq=50,sus=0.5|
	var env = {EnvGen.ar(Env.new([0,1,0],[0.02,~sus.kr]),doneAction:2)};
	var sig = LFSaw.ar(~mel.kr+(1/160/(1..12)));
	sig = sig * env;
    sig = Splay.ar(sig,0.9,1);
	Out.ar(0,sig);

}).add;


SynthDef(\h,{|freq=50,sus=0.5|
	var env = {EnvGen.ar(Env.new([0,1,0],[0.02,~sus.kr]),doneAction:2)};
	var sig=   LFSaw.ar(~mel.kr+(1/160/(1..12)));
	sig = sig * env;
    sig = Splay.ar(sig,0.9,1);
	Out.ar(0,sig);

}).add;



)


p.push();


(
~mel.mold(3);
~mel={Duty.kr(16/[1,2,3]/1,0,Dseq([60,65,60,63,60,67,60,72],inf).midicps)/2};
~slope={LFNoise2.kr(1/60).range(10,80)};
~mod={LFNoise2.kr(1/60).range(1,4)};
~freq.mold(3);
~freq={LFNoise2.kr(1/30!3).exprange(25.001,15000)};
~sus.mold(3);
~sus={LFNoise2.kr(1/60!3).exprange(0.001,8)};
)

OSCFunc.trace(true);
