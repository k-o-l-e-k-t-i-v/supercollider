



p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var env = Pulse.ar(4);
  var sig = SinOsc.ar(50.01);
  sig = Perlin3.ar(sig,LFSaw.ar(1/16/(1..32)),env) * CombN.ar(env,4/50,LFNoise2.ar(1/32!32)**8+1/50,1);
  sig = SinOsc.ar(1/16,sig*2pi) * env;
  sig = Normalizer.ar(sig);
  sig = LPF.ar(sig,16000);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
