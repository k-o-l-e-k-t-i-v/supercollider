s.boot();

p=ProxySpace.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar([47.5,50]) * Pulse.ar(4) + LFSaw.ar([44,50,47.5]);
  sig = CombN.ar(sig * SinOsc.ar([30,40]),1/2,1/2,1)/16+sig;
  sig = LFPulse.ar(24/3);
  Splay.ar(sig,0.05,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


s.scope
