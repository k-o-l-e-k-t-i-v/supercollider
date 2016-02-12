


// plink synth ///////////////////////////////////////

(
~plink.quant=2;
~plink.fadeTime=2;
~plink={
  var sig = [] ++ BrownNoise.ar(0.25) ++ PinkNoise.ar(0.25) ++ LFSaw.ar(4000);
  sig= CombN.ar(sig,1,LFSaw.ar(1/8/fib(8)).exprange(1.01,0.0001).round(0.0002),0.5);
  sig = sig * Pulse.ar(2);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(44.001,2000));
  sig = HPF.ar(sig,44);
  sig = Greyhole.ar(sig,1,0,4)/8+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~plink,postVol:true);
~plink.play;
);
~plink.stop(7);


History.end;
