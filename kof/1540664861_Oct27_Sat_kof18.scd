


p.push();
p.bpm(121);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(50!2) * Pulse.ar(~tempo*2);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
SynthDef(\kick,{|a=0.02,d=0.5,f=40|
  var env = EnvGen.ar(Env([0,1,0],[a,d]),doneAction:2);
    var sig = SinOsc.ar(f);
    sig = sig * env;
    Out.ar(0,sig);
}).store;
)
