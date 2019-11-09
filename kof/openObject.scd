
p.push();
thisProcess.openUDPPort(57120);
OpenObject.start;
OpenObject.openInterpreter;


(
~tempo={135/120};
~slope={LFNoise1.kr(~tempo/60).range(10,40)};
~mod = {Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf))};
~slope={LFNoise1.kr(~tempo/4).range(1,90)};
)

(

SynthDef(\a,{|freq=33,sus=0.5|
	var env = {EnvGen.ar(Env.new([0,1,0],[0.002,sus]),doneAction:2)};
	var sig = SinOsc.ar(freq!2,env**~slope.kr*8pi);
    sig = sig + (Pulse.ar(freq!2+(env**80.1291*freq/~mod.kr))*env/8.0);
    sig = sig + BrownNoise.ar(0.5**~slope.kr*env);
	sig = sig * env;
    sig = Splay.ar(sig,0,0.85);
	Out.ar(0,sig);

}).add;

SynthDef(\b,{|freq=33,sus=0.0395|
	var env = {EnvGen.ar(Env.new([0,1,0],[0.002,sus]),doneAction:2)};
	var sig = WhiteNoise.ar(1!2);
    sig = HPF.ar(sig,10000*(env**~slope.kr*2));
	sig = sig * env;
    sig = Splay.ar(sig,0,0.5);
	Out.ar(0,sig);
}).add;

SynthDef(\c,{|freq=33,sus=0.25|
	var env = {EnvGen.ar(Env.new([0,1,0],[0.02,sus]),doneAction:2)};
    var sig = LFSaw.ar([env,env*4,150/~mod])*2pi;
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2]/2pi+env);
	sig =LeakDC.ar(sig);
    sig = sig * env;
    sig = Splay.ar(sig,0.19,0.25);
	Out.ar(0,sig);
}).add;


)

StageLimiter.activate(2)
