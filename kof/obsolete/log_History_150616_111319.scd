// History, as it was on Tue Jun 16 11:13:19 2015.

[
[ 0, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(50!2);
  sig = CombN.ar(sig,1,SinOsc.ar(1).range(0.001,0.04),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 13.844130251, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(50!2);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4).range(0.001,0.04),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 16.812579737, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(50!2);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).range(0.001,0.04),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 25.37533801, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(50!2);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).range(0.001,0.08),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 32.440943971, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = SinOsc.ar(50!2);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).range(0.001,0.08),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 51.968910976, 'me', "(
~lol.fadeTime=5;
~lol={
  var sig = SinOsc.ar(50!2,mul:0.5);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).range(0.001,0.08),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 55.80131899, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = SinOsc.ar(72!2,mul:0.5);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).range(0.001,0.08),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 60.010194895, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = SinOsc.ar(75!2,mul:0.5);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).range(0.001,0.08),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 67.869086766, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).range(0.001,0.08),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 82.276435295, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).range(0.001,0.08),1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 94.669925031, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).range(0.00001,0.08),1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 99.573675776, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).exprange(0.00001,0.08),1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 106.213000856, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5);
  sig = CombN.ar(sig,1,SinOsc.ar(4/fib(8)).exprange(0.00001,0.08),1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 119.215747167, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(4/fib(8)).exprange(0.00001,0.08),1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 124.233901071, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(4/fib(8)).exprange(0.00001,0.08),1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 141.025844796, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(4/fib(8)).exprange(0.00001,0.08),1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 149.68663226, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(4/fib(8)).exprange(0.00001,0.08),1)/2 + sig;
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 162.987609509, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(4/fib(8)).exprange(0.00001,0.08),1)/2 + sig;
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 165.374574095, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).exprange(0.00001,0.08),1)/2 + sig;
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 169.373214533, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).exprange(0.00001,0.8),1)/2 + sig;
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 180.046297996, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 189.808523722, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(1/4/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 194.27136885, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(4/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 196.357899156, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(16/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 199.814884504, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(8/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 204.167129355, 'me', "(
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(1/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 216.244114427, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = LFSaw.ar(75!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(1/2/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 277.594023328, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = WhiteNoise.ar(0.1!2,mul:0.5)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(1/2/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 280.065278762, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = WhiteNoise.ar(0.1!2)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombN.ar(sig,1,SinOsc.ar(1/2/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 295.068478069, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = WhiteNoise.ar(0.1!2)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = CombL.ar(sig,1,SinOsc.ar(1/2/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 311.767563183, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(1) * SinOsc.ar(67);
  sig = CombL.ar(sig,1,SinOsc.ar(1/2/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 319.272112188, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67);
  sig = CombL.ar(sig,1,SinOsc.ar(1/2/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 326.68754011, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67,mul:0.2);
  sig = CombL.ar(sig,1,SinOsc.ar(1/2/fib(8)).exprange(0.80001,0.000008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 338.080337988, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67,mul:0.2);
  sig = CombL.ar(sig,1,SinOsc.ar(1/2/fib(8)).exprange(0.80001,0.008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 341.863929807, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67,mul:0.2);
  sig = CombL.ar(sig,1,SinOsc.ar(1/2/fib(8)).exprange(0.080001,0.008),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 349.243799777, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67,mul:0.2);
  sig = CombL.ar(sig,1,SinOsc.ar(1/2/fib(8)).exprange(0.25,0.5),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 367.323086563, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67,mul:0.2);
  sig = CombL.ar(sig,1,SinOsc.ar(2).exprange(0.25,0.5),1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 383.504024171, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67,mul:0.2);
  sig = CombL.ar(sig,1,0.125,1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 388.568341717, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67,mul:0.2);
  sig = CombN.ar(sig,1,0.125,1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 398.636094115, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67,mul:0.2);
  sig = CombN.ar(sig,1,0.125/2,1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 401.363932266, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67,mul:0.2);
  sig = CombN.ar(sig,1,0.125/2,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 410.84125331, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67,mul:0.2);
  sig = CombN.ar(sig,1,0.125/4,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 416.671777334, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67,mul:0.2);
  sig = CombN.ar(sig,1,0.125/8,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 422.108339014, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67,mul:0.4);
  sig = CombN.ar(sig,1,0.125/8,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 432.80884397, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(4) * SinOsc.ar(67+(1..8),mul:0.4);
  sig = CombN.ar(sig,1,0.125/8,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 460.673457111, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(8) * SinOsc.ar(67+(1..8),mul:0.4);
  sig = CombN.ar(sig,1,0.125/8,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 470.232437915, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(2) * SinOsc.ar(67+(1..8),mul:0.4);
  sig = CombN.ar(sig,1,0.125/8,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 477.164270581, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]) * SinOsc.ar(67+(1..8),mul:0.4);
  sig = CombN.ar(sig,1,0.125/8,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 506.454721401, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(2).range(0,4)) * SinOsc.ar(67+(1..8),mul:0.4);
  sig = CombN.ar(sig,1,0.125/8,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 520.839689131, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,4)) * SinOsc.ar(67+(1..8),mul:0.4);
  sig = CombN.ar(sig,1,0.125/8,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 537.773599255, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,4)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1,0.125/8,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 548.450428921, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,4)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1,0.125/4,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 554.379526402, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,4)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1,0.25,2)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 558.377448569, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,4)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1,0.25,1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 561.175179563, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,4)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,0.25,0.25,1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 570.68927896, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,4)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1/16,1/16,1)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 579.539318121, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,4)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1/16,1/16,4)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 585.316833639, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,4)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1/16,1/32,4)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 593.178956701, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,1.5)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1/16,1/32,4)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 598.422272529, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,1.5)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1/4,1/4,4)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 608.297696762, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,1.5)) * LFSaw.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1/4,1/4,4)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 625.370326935, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]+LFPulse.ar(1).range(0,1.5)) * LFSaw.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 637.523677073, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]*LFPulse.ar(1).range(0,1.5)) * LFSaw.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 643.575752773, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]*LFPulse.ar(1).range(1,2)) * LFSaw.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 650.734063108, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]*LFPulse.ar(1/4).range(1,2)) * LFSaw.ar(72+((1..8)/10),mul:0.4);
  sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 656.737292753, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]*LFPulse.ar(1/4).range(1,2)) * LFSaw.ar(72+((1..8)/10),mul:0.4);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 673.052347369, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]*LFPulse.ar(1/4).range(1,2)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 688.83413875, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]*LFPulse.ar(1/4).range(1,2)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[10,11,12])/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 690.736620099, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]*LFPulse.ar(1/4).range(1,2)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[10,11,12])/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 718.141092792, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]*LFPulse.ar(1/4).range(1,2)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[10,11,12])/2+sig;
  sig = LPF.ar(sig,400);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 738.27971989, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]*LFPulse.ar(1/4).range(1,2)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[10,11,12])/2+sig;
  sig = LPF.ar(sig,400);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 750.138254883, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]*LFPulse.ar(1/4).range(1,2)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[10,11,120])/2+sig;
  sig = LPF.ar(sig,400);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 753.985362187, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]*LFPulse.ar(1/4).range(1,2)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[10,120])/2+sig;
  sig = LPF.ar(sig,400);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 756.868834674, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]*LFPulse.ar(1/4).range(1,2)) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[100,120])/2+sig;
  sig = LPF.ar(sig,400);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 767.42506698, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar([1,2,3,4]) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[100,110])/2+sig;
  sig = LPF.ar(sig,400);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 773.879189617, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(2) * SinOsc.ar(72+((1..8)/10),mul:0.4);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[100,110])/2+sig;
  sig = LPF.ar(sig,400);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 779.777622246, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(2) * SinOsc.ar(72+((1..8)/100),mul:0.4);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[100,110])/2+sig;
  sig = LPF.ar(sig,400);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 786.323381035, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(2) * SinOsc.ar(72+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[100,110])/2+sig;
  sig = LPF.ar(sig,400);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 794.6160271, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(2) * SinOsc.ar(72+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[100,110])/2+sig;
  sig = LPF.ar(sig,800);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 800.809945685, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(2) * SinOsc.ar(72+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[10,11])/2+sig;
  sig = LPF.ar(sig,800);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 808.125382695, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(2/[1,2,4,8]) * SinOsc.ar(72+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[10,11])/2+sig;
  sig = LPF.ar(sig,800);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 821.036652731, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var sig = Pulse.ar(2/[1,2,4,8]) * SinOsc.ar(72+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,800);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 854.253527709, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var bck;
  var sig = Pulse.ar(2/[1,2,4,8]) * SinOsc.ar(72+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,800);
  sig = CompanderD.ar(sig+bck/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 871.94677039, 'me', "(
~lol.fadeTime=5;
~lol={
  var bck;
  var sig = Pulse.ar(2/[1,2,4,8]) * SinOsc.ar(72+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,800)+bck;
  sig = CompanderD.ar(sig+bck/2,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 876.701380471, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var bck;
  var sig = Pulse.ar(2/[1,2,4,8]) * SinOsc.ar(72+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,800)+bck;
  sig = CompanderD.ar(sig+bck/3,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 883.975886862, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var bck;
  var sig = Pulse.ar(2/[1,2,4,8]) * SinOsc.ar(72+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,800)+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 892.552493699, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var bck;
  var sig = Pulse.ar(4/[1,2,4,8]) * SinOsc.ar(72+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,800)+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 908.245359773, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var bck;
  var sig = Pulse.ar(4/[1,2,4,8]) * SinOsc.ar(92+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,800)+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 921.2104333, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var bck;
  var sig = Pulse.ar(4/[1,2,4,8]) * SinOsc.ar(92+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,8000)+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 922.564008244, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var bck;
  var sig = Pulse.ar(4/[1,2,4,8]) * SinOsc.ar(92+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,8000)/2+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 932.053734405, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var bck;
  var sig = Pulse.ar(4/[1,2,4,8]) * SinOsc.ar(92+((1..8)/100),mul:0.5);
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,1800)/2+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 965.183862483, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var imp = Pulse.ar(4/[1,2,4,8]);
  var bck;
  var sig = SinOsc.ar(92+((1..8)/100+(imp*100)),mul:0.5) * imp;
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,1800)/2+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 968.688698827, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var imp = Pulse.ar(4/[1,2,4,8]);
  var bck;
  var sig = SinOsc.ar(92+((1..8)/100+(imp*10)),mul:0.5) * imp;
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,1800)/2+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 981.437073772, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var imp = Pulse.ar(4/[1,2,4,8]);
  var bck;
  var sig = SinOsc.ar(65+((1..8)/100+(imp*10)),mul:0.5) * imp;
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,1800)/2+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 987.217919722, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var imp = Pulse.ar(4/[1,2,4,8]);
  var bck;
  var sig = SinOsc.ar(65+((1..8)+(imp*10)),mul:0.5) * imp;
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,1800)/2+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 999.168482254, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var imp = Pulse.ar(4/[1,2,4,8]);
  var bck;
  var sig = SinOsc.ar(65+((imp*(1..8))),mul:0.5) * imp;
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,1800)/2+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 1005.632143742, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var imp = Pulse.ar(4/[1,2,4,8]);
  var bck;
  var sig = SinOsc.ar(65+((imp**(1..8))),mul:0.5) * imp;
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,1800)/2+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 1009.625543538, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var imp = Pulse.ar(4/[1,2,4,8]);
  var bck;
  var sig = SinOsc.ar(65+((imp*(1..8))),mul:0.5) * imp;
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,1800)/2+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 1021.981860898, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var imp = Pulse.ar(2/[1,2,4,8]);
  var bck;
  var sig = SinOsc.ar(65+((imp*(1..8))),mul:0.5) * imp;
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,1800)/2+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 1039.746822587, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var imp = Pulse.ar(2/[1,2,4,8]);
  var bck;
  var sig = SinOsc.ar(65+((imp*(1..8))),mul:0.5) * imp;
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  //sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,1800)/2+bck;
  sig = CompanderD.ar(sig+bck/4,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lol,postVol:true);
~lol.play;
);" ],
[ 1053.741851164, 'me', "(
~lol.quant=2;
~lol.fadeTime=5;
~lol={
  var imp = Pulse.ar(4/[1,2,4,8]);
  var bck;
  var sig = SinOsc.ar(65+((imp*(1..8))),mul:0.5) * imp;
  //sig = CombN.ar(sig,1,1/8,4)/2 + sig;
  bck = sig;
  //sig = GVerb.ar(sig,[3,2])/2+sig;
  sig = LPF.ar(sig,1800)/2+bck;
  sig = CompanderD.ar(sig+bc