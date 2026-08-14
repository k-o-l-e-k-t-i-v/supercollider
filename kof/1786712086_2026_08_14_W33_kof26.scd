s.boot;

p=ProxySpace.push(s)
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar([50,60],Pulse.ar(4/[1,2,3,4])) * Pulse.ar(4/[1,2,3,4]);
  sig = CombN.ar(sig,1,1,4)/8+sig;
  sig = GVerb.ar(sig,9,3)/8 + sig;
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
