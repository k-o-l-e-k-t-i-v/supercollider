s.boot();
p=ProxySpace.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(50!2,Pulse.ar([4,3])) * Pulse.ar(4);
  sig = CombN.ar(sig,1/2,1/2,1)/4 + sig;
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.15,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
