s.boot;

p=ProxySpace.push(s)
// one synth ///////////////////////////////////////

~tempo = {2}
(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var mel = Duty.kr(4/~tempo,0,Dseq([1,5/4,4/3,7/4,2],inf));
  var sig = SinOsc.ar([50,60]*mel,Pulse.ar(4/[1,2,3,4])) * Pulse.ar(4/[1,2,3,4]);
  sig = CombN.ar(sig,1,1,4)/8 + sig;
  sig = GVerb.ar(sig,[9,10],3)/8 + sig;
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
