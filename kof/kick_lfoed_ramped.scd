



(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);

// lfos synth ///////////////////////////////////////

(
~lfos.quant=1;
~lfos.fadeTime=0.02;
~lfos={
  var imp = Impulse.ar(1/2,(0..7)++0.5/8);
  var env = EnvGen.ar(Env([0,1,0],[0.0002,0.75],[3,-3]),imp);
  var freenv = EnvGen.ar(Env([1,1300/[1,2,4,8],90],[0.003,0.009],[2,-3]),imp);
  var filenv = EnvGen.ar(Env([44,10000,44],[0.006,1.05],[2,-3]),imp);
  var noisenv = EnvGen.ar(Env([0,1,0],[0.0004,0.05],[3,-3]),imp);
  
  var freq = (freenv);
  var sig = SinOsc.ar(freq + SinOsc.ar(11).range(-4,40)) * env;
  sig = sig + (BrownNoise.ar(noisenv));
  sig = Resonz.ar(sig,filenv + SinOsc.ar(12).range(-8,80));
  sig = GVerb.ar(sig,30,3,0.96,0.95,145);
  sig = sig + CompanderD.ar(Ramp.ar(sig,LFSaw.ar(1/fib(4)).exprange(0.00002,0.002)),4/3,1/2,1/2,0.002,0.002);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lfos,postVol:true);
~lfos.play;
);
~lfos.stop(7);
~lfos.clear;
