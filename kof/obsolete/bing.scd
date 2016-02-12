


// lalal synth ///////////////////////////////////////

(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = CombN.ar(sig,1/LFSaw.ar(4).exprange(4.001,100),1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(440.001,2000).round(440),0.02) * Pulse.ar(4);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);
~lalal.stop(7);
