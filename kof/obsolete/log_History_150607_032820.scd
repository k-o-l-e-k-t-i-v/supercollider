// History, as it was on Sun Jun  7 03:28:20 2015.

[
[ 0, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50!2) * LFSaw.ar(1/4/fib(21)).exprange(0.001,0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 11.362369677, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50+(1..21)) * LFSaw.ar(1/4/fib(21)).exprange(0.001,0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 14.21931195, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50+(0..21)) * LFSaw.ar(1/4/fib(21)).exprange(0.001,0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 26.898831074, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50+(0..21)) * LFSaw.ar(1/4/fib(21)).exprange(0.001,0.4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 33.052113779, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50+(0..21)) * LFSaw.ar(1/4/fib(21)).exprange(0.01,0.4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 35.54601712, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50+(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 56.668317112, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50+(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.4);
  sig = CombN.ar(sig,1/24,1/25,2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 72.109409894, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50+(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.4);
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 92.786898496, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50+(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.4);
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = Normalizer.ar(sig);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 114.424452796, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50+(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.4);
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 154.733905875, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50+(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.4);
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(1/4!21));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 169.559573171, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50+(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.4);
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(1/4!21));
  sig = FreeVerb.ar(sig,0.133);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 182.40388397, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.4);
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(1/4!21));
  sig = FreeVerb.ar(sig,0.133);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 216.347280658, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(1/4!21));
  sig = FreeVerb.ar(sig,0.133);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 224.114723789, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(1/4!21));
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 235.531770838, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(1!21));
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 237.319193811, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(4!21));
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 248.089153761, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(80!21));
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 255.499610789, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(16!21));
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 263.171053321, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(16!21));
  sig = CombN.ar(sig,1/24,1/25,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 279.179206483, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(16!21));
  sig = CombN.ar(sig,1/4,1/2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 297.307250336, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(16!21));
  sig = CombN.ar(sig,1/4,1/4.01,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 304.327675892, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(16!21));
  sig = CombN.ar(sig,1/4,1/4.02,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 307.998462754, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(16!21));
  sig = CombN.ar(sig,1/4,1/4.0002,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 323.327773461, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(16!21));
  sig = CombN.ar(sig,1/4,1/4.0002*(1..21),32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 338.44348464, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(16!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 347.177487754, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,21000/(1..21),mul:LFDNoise1.ar(16!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 354.569670778, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,12000/(1..21),mul:LFDNoise1.ar(16!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 358.950138219, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,1200/(1..21),mul:LFDNoise1.ar(16!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 362.284570151, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,1200/(1..21),mul:LFDNoise1.ar(4!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 365.443626722, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(50*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,1200/(1..21),mul:LFDNoise1.ar(4!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 368.693811067, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(43*(0..21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,1200/(1..21),mul:LFDNoise1.ar(4!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 377.67069318, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(43*(_*1.5!21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,1200/(1..21),mul:LFDNoise1.ar(4!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 387.543431723, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(43*(_*1.5!21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,12000/(1..21),mul:LFDNoise1.ar(4!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 399.049360163, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(43*(_*1.5!21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,12000/(1..21),mul:LFDNoise1.ar(4!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 490.480049262, 'me', "(
~dut.quant=2;
~dut.fadeTime=2;
~dut={
  var sig = SinOsc.ar(75!2);
  sig = sig * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.015);
};
m.addMix(~dut,postVol:true);
~dut.play;
);" ],
[ 497.120344785, 'me', "(
~dut.quant=2;
~dut.fadeTime=2;
~dut={
  var sig = SinOsc.ar(75!2);
  sig = sig * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~dut,postVol:true);
~dut.play;
);" ],
[ 505.195821322, 'me', "(
~dut.quant=2;
~dut.fadeTime=2;
~dut={
  var sig = SinOsc.ar(75!2);
  sig = sig * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.045);
};
m.addMix(~dut,postVol:true);
~dut.play;
);" ],
[ 524.853811149, 'me', "(
~ddut.quant=2;
~ddut.fadeTime=2;
~ddut={
  var sig = LFSaw.ar(50!2);
  sig = sig * Pulse.ar(2);
  Splay.ar(sig.flat,0.25,0.05);
};
m.addMix(~ddut,postVol:true);
~ddut.play;
);" ],
[ 538.604821956, 'me', "(
~dut.quant=2;
~dut.fadeTime=2;
~dut={
  var sig = SinOsc.ar(7500!2);
  sig = sig * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.045);
};
m.addMix(~dut,postVol:true);
~dut.play;
);" ],
[ 543.507482093, 'me', "(
~ddut.quant=2;
~ddut.fadeTime=2;
~ddut={
  var sig = LFSaw.ar(50!2);
  sig = sig * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.05);
};
m.addMix(~ddut,postVol:true);
~ddut.play;
);" ],
[ 547.524746298, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(430*(_*1.5!21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,12000/(1..21),mul:LFDNoise1.ar(4!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 550.90466512, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(430*(_*1.25!21)) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,12000/(1..21),mul:LFDNoise1.ar(4!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 560.357477074, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(4.3*(_*1.25!21)+43) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,12000/(1..21),mul:LFDNoise1.ar(4!21));
  sig = CombN.ar(sig,1/4,1/4.2,32);
  sig = Normalizer.ar(sig) * LFSaw.ar(4/fib(21)).exprange(0.001,1);
  sig = FreeVerb.ar(sig,0.133,10);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~sawa,postVol:true);
~sawa.play;
);" ],
[ 566.332526575, 'me', "(
~sawa.quant=2;
~sawa.fadeTime=2;
~sawa={
  var sig = LFSaw.ar(4.3*(_*1.25!21)+430) * LFSaw.ar(4/fib(21)).exprange(0.01,0.75);
  sig = BPF.ar(sig,12000/(1..21),mul:LFDNoise1.ar(4!21));
  sig = CombN.ar(sig,1