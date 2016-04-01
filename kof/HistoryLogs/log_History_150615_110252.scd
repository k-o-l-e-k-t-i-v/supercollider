// History, as it was on Mon Jun 15 11:02:52 2015.

[
[ 0, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 16.014710587, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 23.607364678, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(2).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 27.790983124, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar([2,3]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 37.805820205, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(72!2);
  sig = sig * LFSaw.ar([2,3]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 92.429562293, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(72!2) * ToggleFF.ar(Dust.ar(LFSaw.ar(1/4).exprange(0.001,4)));
  sig = sig * LFSaw.ar([2,3]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 117.542091886, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(120) * ToggleFF.ar(Dust.ar(LFSaw.ar(1/4).exprange(0.001,4)));
  sig = sig * LFSaw.ar([2,3]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 178.076983355, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(90 + (ToggleFF.ar(Impulse.ar(1))*90) );
  sig = sig * LFSaw.ar([2,3]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 197.122022975, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(90 + (ToggleFF.ar(Impulse.ar(1/4))*90) );
  sig = sig * LFSaw.ar([2,3]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 209.492611209, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(90 + (ToggleFF.ar(Impulse.ar(1/4))*45) );
  sig = sig * LFSaw.ar([2,3]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 213.723800582, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(90 + (ToggleFF.ar(Impulse.ar(1/4))*[45,90]) );
  sig = sig * LFSaw.ar([2,3]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 224.475489847, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(90 + (ToggleFF.ar(Impulse.ar(1/4))*[45,90,180]) );
  sig = sig * LFSaw.ar([2,3]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 236.19345162, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(90 + (ToggleFF.ar(Impulse.ar(1/4/fib(3)))*[45,90,180]) );
  sig = sig * LFSaw.ar([2,3]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 526.289538401, 'me', "(
~ladsp.quant=2;
~ladsp.fadeTime=5;
~ladsp={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~ladsp.play;
);" ],
[ 529.779019485, 'me', "(
~ladsp.quant=2;
~ladsp.fadeTime=5;
~ladsp={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.225);
};
~ladsp.play;
);" ],
[ 531.938875915, 'me', "(
~ladsp.quant=2;
~ladsp.fadeTime=5;
~ladsp={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
~ladsp.play;
);" ],
[ 535.885689946, 'me', "(
~ladsp.quant=2;
~ladsp.fadeTime=5;
~ladsp={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.125);
};
~ladsp.play;
);" ],
[ 541.961085441, 'me', "(
~ladsp.quant=2;
~ladsp.fadeTime=5;
~ladsp={
  var sig = LFSaw.ar(50+(1..8));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.125);
};
~ladsp.play;
);" ],
[ 567.743135263, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~asd.play;
);" ],
[ 577.43383078, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~asd.play;
);" ],
[ 593.988893142, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~asd.play;
);" ],
[ 608.042737623, 'me', "(
~ladsp.quant=2;
~ladsp.fadeTime=5;
~ladsp={
  var sig = LFSaw.ar(50+(1..8));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.125);
};
~ladsp.play;
);" ],
[ 624.319907272, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(90 + (ToggleFF.ar(Impulse.ar(1/4/fib(3)))*[45,90,180]) );
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 633.428161681, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(90 + (ToggleFF.ar(Impulse.ar(1/4/fib(3)))*[45,90,180]) );
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 671.248353497, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(90 + (ToggleFF.ar(Impulse.ar(1/4/fib(3)))*[45,90,180]) );
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 678.632841808, 'me', "(
~ladsp.quant=2;
~ladsp.fadeTime=5;
~ladsp={
  var sig = LFSaw.ar(50+(1..8));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.125);
};
~ladsp.play;
);" ],
[ 684.472007897, 'me', "(
~ladsp.quant=2;
~ladsp.fadeTime=5;
~ladsp={
  var sig = LFSaw.ar(50+(1..8)*[1,2,4,8]);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.125);
};
~ladsp.play;
);" ],
[ 720.673713919, 'me', "(
~quad.quant=2;
~quad.fadeTime=5;
~quad={
  var sig = SinOsc.ar(90 + (ToggleFF.ar(Impulse.ar(1/4/fib(3)))*[45,90,180,180*1.5]) );
  sig = sig * LFSaw.ar(1/4/fib(4)).exprange(0.001,1) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
~quad.play;
);" ],
[ 729.173543424, 'me', "(
~ladsp.quant=2;
~ladsp.fadeTime=5;
~ladsp={
  var sig = SinOsc.ar(50+(1..8)*[1,2,4,8]);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.125);
};
~ladsp.play;
);" ],
[ 732.04031292, 'me', "(
~ladsp.quant=2;
~ladsp.fadeTime=5;
~ladsp={
  var sig = SinOsc.ar(72+(1..8)*[1,2,4,8]);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.125);
};
~ladsp.play;
);" ],
[ 802.19586027, 'me', "~asd.stop(7);" ],
[ 804.47460985, 'me', "~ladsp.stop(7);" ],
[ 805.965006744, 'me', "~quad.stop(7);  " ],
];