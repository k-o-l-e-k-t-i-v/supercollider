// History, as it was on Wed Jun 10 08:25:13 2015.

[
[ 0, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(432*LFPulse.ar([1,1]).range(pi,2pi));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 3.529228148, 'me', "thisProcess.stop;" ],
[ 31.165523028, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(432*LFSaw.ar(1/4).range(pi,2pi));
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 35.083328012, 'me', "thisProcess.stop;" ],
[ 42.643890217, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(432*LFSaw.ar(1/8).range(pi,8pi));
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 47.531366098, 'me', "thisProcess.stop;" ],
[ 54.504837351, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(432*LFSaw.ar(1/8).range(pi,1.25pi));
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 59.661261269, 'me', "thisProcess.stop;" ],
[ 76.831261699, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(432*LFSaw.ar(1/8).range(pi,1.25pi) + Pulse.ar(1/8).range(0,1000));
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 111.768280577, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/16;
  var sig = LFSaw.ar(432*LFSaw.ar(tempo).range(pi,1.25pi) + Pulse.ar(tempo).range(0,10000).squared);
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 115.036254152, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/16;
  var sig = LFSaw.ar(43.2*LFSaw.ar(tempo).range(pi,1.25pi) + Pulse.ar(tempo).range(0,10000).squared);
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 122.728546256, 'me', "thisProcess.stop;" ],
[ 123.199609628, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/16;
  var sig = LFSaw.ar(43.2*LFSaw.ar(tempo).range(pi,1.25pi) + Pulse.ar(tempo).range(0,10000).squared);
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 129.406366759, 'me', "thisProcess.stop;" ],
[ 129.871459604, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/16;
  var sig = LFSaw.ar(43.2*LFSaw.ar(tempo).range(pi,1.25pi) + Pulse.ar(tempo).range(0,10000));
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 142.907454481, 'me', "thisProcess.stop;" ],
[ 143.320985083, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/16;
  var sig = LFSaw.ar(43.2*LFSaw.ar(tempo/fib(8)).range(pi,1.25pi) + Pulse.ar(tempo).range(0,10000));
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 161.433135933, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/16;
  var sig = LFSaw.ar(43.2*LFSaw.ar(tempo/fib(8)).range(pi,1.25pi) + Pulse.ar(tempo).range(0,1000),mul:0.1);
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 177.28719367, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/16;
  var sig = LFSaw.ar(43.2 + Pulse.ar(tempo).range(0,1000),mul:0.1);
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 194.185334467, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 4/fib(8);
  var sig = LFSaw.ar(43.2 + Pulse.ar(tempo).range(0,1000),mul:0.1);
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 203.158948505, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 4/fib(8);
  var sig = LFSaw.ar(43.2 + Pulse.ar(tempo).range(0,100),mul:0.1);
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 210.988045129, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 4/fib(8);
  var sig = LFSaw.ar(43.2 + Pulse.ar(tempo).range(0,4000),mul:0.1);
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 217.82624183, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 4/fib(8);
  var sig = LFSaw.ar(43.2 + Pulse.ar(tempo).range(0,400),mul:0.2);
  sig = sig!2;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 220.025582614, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 4/fib(8);
  var sig = LFSaw.ar(43.2 + Pulse.ar(tempo).range(0,400),mul:0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 228.494491283, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/4/fib(8);
  var sig = LFSaw.ar(43.2 + Pulse.ar(tempo).range(0,400),mul:0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 242.28051888, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/4/fib(8);
  var sig = LFSaw.ar(43.2 + Pulse.ar(tempo).exprange(0.01,400),mul:0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 248.892872666, 'me', "thisProcess.stop;" ],
[ 249.343373272, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/4/fib(8);
  var sig = LFSaw.ar(43.2 + Pulse.ar(tempo).exprange(1.01,40),mul:0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 253.73197111, 'me', "thisProcess.stop;" ],
[ 268.761513592, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/4/fib(8);
  var sig = LFSaw.ar(43.2 + Pulse.ar(tempo).exprange(1.01,40),mul:0.2);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 272.157815257, 'me', "thisProcess.stop;" ],
[ 325.024715833, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/4/fib(8);
  var sig = LFSaw.ar(43.2 + (43.2 * Pulse.ar(tempo)),mul:0.2);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 334.069879281, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/4/fib(8);
  var sig = LFSaw.ar(43.2 + (43.2 * Pulse.ar(tempo)),mul:0.2);
  sig = LeakDC.ar(sig) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 345.121781685, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 4/fib(8);
  var sig = LFSaw.ar(43.2 + (43.2 * Pulse.ar(tempo)),mul:0.2);
  sig = LeakDC.ar(sig) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 349.97282554, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 4/fib(8);
  var sig = LFSaw.ar(43.2 + (432 * Pulse.ar(tempo)),mul:0.2);
  sig = LeakDC.ar(sig) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 360.02018162, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/fib(8);
  var sig = LFSaw.ar(43.2 + (432 * Pulse.ar(tempo)),mul:0.2);
  sig = LeakDC.ar(sig) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 367.173583329, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/2/fib(8);
  var sig = LFSaw.ar(43.2 + (432 * Pulse.ar(tempo)),mul:0.2);
  sig = LeakDC.ar(sig) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 388.523027197, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/2/fib(8);
  var sig = LFSaw.ar(43.2 + (432 * Pulse.ar(tempo)),mul:0.2);
  sig = sig * Pulse.ar(4);
  sig = GVerb.ar(sig,10,mul:0.1)+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 392.111810022, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/2/fib(8);
  var sig = LFSaw.ar(43.2 + (432 * Pulse.ar(tempo)),mul:0.2);
  sig = sig * Pulse.ar(4);
  sig = GVerb.ar(sig,10,mul:0.1)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 394.171317416, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var tempo = 1/2/fib(8);
  var sig = LFSaw.ar(43.2 + (432 * Pulse.ar(te