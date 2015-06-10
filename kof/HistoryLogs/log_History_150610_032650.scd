// History, as it was on Wed Jun 10 03:26:50 2015.

[
[ 0, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(50!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 37.141027013, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(1!2).exprange(11.1,1200));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 45.977133328, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(8!2).exprange(11.1,1200));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 71.85409525, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1200*(1..8)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 83.159992457, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1200*(1..8)),mul:1/(1..8));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 88.040120143, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 95.26949132, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 162.001580444, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,[1,2,4,8]*220);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 173.786060101, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,[1,2,4,8]*2200);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 178.645173965, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,[1,2,4,8]*220);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 190.347257357, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,[1,2,4,8]*LFSaw.ar(1/4/fib(16)).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 200.002573564, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,[1,2,4,8]*LFSaw.ar(1/4/fib(16)).exprange(0.001,1)*11111);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 209.988866719, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(16)).exprange(0.001,1)*11111);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 217.395794215, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(16)).exprange(0.001,1)*1111);
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 251.757516185, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(16)).exprange(0.001,1)*1111);
  sig = GVerb.ar(sig,100,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 261.672838136, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(16)).exprange(0.001,1)*1111);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 265.211638583, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(16)).exprange(0.001,1)*1111);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 268.342738987, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!2).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*1111);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 278.583152086, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(16!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*1111);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 282.837823165, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*1111);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 294.210857366, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*111);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 311.832983554, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,120));
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 316.80917562, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,1200));
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 319.591171454, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,12000));
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 356.772101881, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,12000));
  sig = CombN.ar(sig,1/2,1/2,16,mul:0.7);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 371.245548168, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,12000));
  sig = CombN.ar(sig,1/4,1/4,16,mul:0.7);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 385.539551553, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,12000));
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(1/4).exprange(0.001,1),16,mul:0.7);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 392.172752468, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,12000));
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4).exprange(0.001,1),16,mul:0.7);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 404.609806898, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,12000));
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,1),16,mul:0.7);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 418.993583981, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,12000));
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 436.029907789, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,12000)) * Pulse.ar(4).softclip;
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 447.960765783, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,12000)) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,100,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 457.322642219, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,12000)) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 467.665229957, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,22000)) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 482.986325539, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,22000)) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 493.084419543, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(10.001,20000)) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 498.208250202, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(10.001,20000),0.1) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 508.236587005, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(10.001,20000),0.2) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 514.939530895, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise1.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(10.001,20000),0.2) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 520.151890076, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(10.001,20000),0.2) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 534.23746867, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(10.001,20000).round(220),0.2) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 540.761446977, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(10.001,20000).round(100),0.2) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 546.995629041, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(1000.001,20000).round(110),0.2) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 547.875150512, 'me', "thisProcess.stop;" ],
[ 548.314254216, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(1000.001,20000).round(110),0.2) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 556.918089036, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(1000.001,20000).round(440),0.2) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 559.718851632, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,20000).round(440),0.2) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 566.803617883, 'me', "thisProcess.stop;" ],
[ 567.118117805, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(440.001,20000).round(440),0.2) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 619.630333999, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(440.001,20000).round(440),0.2) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 628.713946548, 'me', "thisProcess.stop;" ],
[ 629.2182006, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/16/fib(8)).exprange(440.001,20000).round(440),0.2) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 636.444563492, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/16/fib(8)).exprange(440.001,20000).round(440),0.02) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 643.325424894, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/16/fib(8)).exprange(440.001,2000).round(440),0.02) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 652.120048247, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1/4!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(440.001,2000).round(440),0.02) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 655.866351027, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(440.001,2000).round(440),0.02) * Pulse.ar(4);
  sig = CombN.ar(sig,1/4,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 660.089233864, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=2;
~lalal={
  var sig = LFSaw.ar(LFDNoise0.ar(1!8).exprange(11.1,1000*(1..8)),mul:1/(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(440.001,2000).round(440),0.02) * Pulse.ar(4);
  sig = CombN.ar(sig,1/44,1/4+LFSaw.ar(4/fib(8)).exprange(0.001,0.2),16,mul:0.7);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  Splay.ar(sig.flat,0