s.boot();

p=ProxySpace.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar([932,720,600,400]) * Pulse.ar(4) + LFSaw.ar([44,50,47.5]);
  sig = CombN.ar(sig * SinOsc.ar([632,1024]),1/2,1/2,1)/4+sig;
  sig = LFPulse.ar(24/3) * sig;
  Splay.ar(sig,0.05,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


s.scope
