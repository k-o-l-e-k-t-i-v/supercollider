s.boot();
p=ProxySpace.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = (SinOsc.ar([47.5,50],Pulse.ar([4,3])) * Pulse.ar(4)) + (LFSaw.ar(5000*mod,mul:0.1) * Pulse.ar(3));
  sig = CombN.ar(sig,1/2,1/2,1)/4 + sig;
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = GVerb.ar(sig,60,3)/16 + sig;
  Splay.ar(sig,0.15,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
