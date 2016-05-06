




// sw synth ///////////////////////////////////////

(
~sw.ar(2);
~sw.quant=2;
~sw.fadeTime=0.2;
~sw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,(1..8),~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  SinOsc.ar(SinOsc.ar(49/[1,2,3,4]).range(50,1500/[1,1.3333,2,1.5]),mul:0.1),
  Pulse.ar(50),
  LFSaw.ar(1500/[1,2,1.33333,1.5],mul:0.1),
  Formant.ar(500,500/[1,1.333,1.5,2],1500/[1,2,4,8]),
  LFNoise2.ar(1500!2),
  SinOsc.ar(500/[1,2,1.33333,1.5],mul:0.1),
  Pulse.ar(4),
  LFNoise2.ar(15000/[1,2,4,8]),
  VarSaw.ar(50!2),
  LFSaw.ar(15000/[1,2,1.3333,1.5],mul:0.1)
  ];
  sig = SelectX.ar(LFTri.ar(1.01/40/(1..8))*sig.size,sig);
  sig = sig * (LFTri.ar(1/4/(1..8))**4);
  //sig = sig * env;
  Splay.ar(sig,0.05,0.5);
};
~sw.play;
);
~sw.stop(4);
~sw.clear;
~sw.pause;
~sw.resume;
