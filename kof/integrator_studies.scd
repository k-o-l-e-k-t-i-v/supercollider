


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var ran = 1;
  var f = [60,64,69].midicps;
  var phase = SinOsc.ar(~tempo).range(0.1,0.5);
  var width = LFSaw.ar(1/160*~tempo).range(0.1,0.5);
  var sig = Integrator.ar( LFPulse.ar(f,phase,width), LFSaw.ar(~tempo/4/[1/3,1/4,1/5]).range(0.001,0.999) ) * ran;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = LeakDC.ar(sig);
  sig = sig * Pulse.ar(~tempo/[1,2,3,4]);
  sig = Limiter.ar(sig);
  //sig = Clip.ar(sig,0.99);
  Splay.ar(sig,0.2,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


LFPulse.help
Integrator.help
