// History, as it was on Fri Jun 12 19:30:26 2015.

[
[ 0, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig * Pulse.ar(2),m.kr(0,1)*15000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 35.375470616, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig * Pulse.ar(2),m.kr(0,1)*15000);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 54.070386543, 'me', "thisProcess.stop;" ],
[ 64.816792539, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig * Pulse.ar(2),m.kr(0,1)*15000).softclip;
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 74.178606805, 'me', "thisProcess.stop;" ],
[ 90.668409381, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig * Pulse.ar(2),m.kr(0,1)*15000).softclip;
  sig = LeakDC.ar(sig);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 95.952543133, 'me', "thisProcess.stop;" ],
[ 99.745423098, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig * Pulse.ar(2),m.kr(0,1)*15000).softclip;
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 106.465027463, 'me', "thisProcess.stop;" ],
[ 122.214801844, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig *Pulse.ar(2) ,m.kr(0,1)*15000+50).softclip;
  sig = Limiter.ar(sig);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 139.972038093, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2);
  sig = BPF.ar(sig *Pulse.ar(2) ,m.kr(0,1)*15000+50).softclip;
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 166.973039494, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]);
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 209.037608043, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) ++ WhiteNoise.ar(0.2);
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 215.402771116, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) ++ WhiteNoise.ar(0.4);
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 223.643144557, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) ++ WhiteNoise.ar(0.6);
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 238.627113014, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) ++ WhiteNoise.ar(0.6);
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = Greyhole.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 291.370836992, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) ++ WhiteNoise.ar(0.6);
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = CombN.ar(sig,0.25,1/200,8)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 299.654883862, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) ++ WhiteNoise.ar(0.6);
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = CombN.ar(sig,0.25,1/200,8)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 306.210146483, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) ++ WhiteNoise.ar(0.6);
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = CombN.ar(sig,0.25,1/20,8)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 363.632373158, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) + WhiteNoise.ar(LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = CombN.ar(sig,0.25,1/20,8)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 389.765535139, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) + WhiteNoise.ar(LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = CombL.ar(sig,0.25,1/20,8)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 406.801589337, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) + WhiteNoise.ar(LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = CombC.ar(sig,0.25,1/20,8)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 420.041579369, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) + WhiteNoise.ar(LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = CombN.ar(sig,0.25,1/20,8)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 427.442011458, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) + WhiteNoise.ar(LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  sig = CombN.ar(sig,2,1/20,8)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 439.295523054, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) + WhiteNoise.ar(LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = CombN.ar(sig,2,1/20,8)/4+sig;
  sig = BPF.ar(sig * Pulse.ar(2/fib(4)) ,m.kr(0,1) * 15000+50).softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 480.780245671, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) + WhiteNoise.ar(LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = CombN.ar(sig,2,1/20,8)/4+sig;
  sig = BPF.ar(sig * Pulse.ar([1,2,3,4]) ,m.kr(0,1) * 15000+50).softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 509.543629533, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) + WhiteNoise.ar(LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = CombN.ar(sig,2,1/20,8)/4+sig;
  sig = BPF.ar(sig * Pulse.ar([1,2,3,4]) ,Lag.kr(m.kr(0,1),[1,2,4,8]) * 15000+50).softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 537.218236486, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) + WhiteNoise.ar(LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = CombN.ar(sig,2,1/20,8)/4+sig;
  sig = BPF.ar(sig * Pulse.ar([1,2,3,4]) ,Lag.kr(m.kr(0,1),[1,2,4,8]) * 19000+50).softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~amp,postVol:true);
~amp.play;
);" ],
[ 544.931397265, 'me', "(
~amp.quant=2;
~amp.fadeTime=2;
~amp={
  var sig = LFSaw.ar(50!2 * [1,1,1.5,2]) + WhiteNoise.ar(LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = CombN.ar(sig,2,1/20,8)/4+sig;
  sig = BPF.ar(sig * Pulse.ar([1,2,3,4]) ,Lag.kr(m.kr(0,1),[0,2,4,8]) * 19000+50).softclip;
  Splay.ar(sig.fl