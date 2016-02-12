// History, as it was on Mon Jun 15 12:10:51 2015.

[
[ 0, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(90!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 17.988144961, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~filter.play;
);" ],
[ 37.578893946, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~filter.play;
);" ],
[ 52.995234484, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(90!2);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 68.2027193, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(90!2);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 73.798705597, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(90!2);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 105.319335248, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(90!2);
  sig = sig * LFSaw.ar(2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 115.463037211, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(90!2);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 122.830738423, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(90!2);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 129.589775897, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.02);
};
~filter.play;
);" ],
[ 135.562146499, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.12);
};
~filter.play;
);" ],
[ 144.463847661, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(72!2);
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 150.611227843, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(100+(1..8));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 157.17079344, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(110+(1..8));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 162.718449797, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(120+(1..8));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 177.137534432, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(120+(1..8));
  sig = sig * LFSaw.ar(1/[2,4]/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 200.173000546, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(120+(1..8));
  sig = sig * LFSaw.ar(1/[2,4]/fib(8)).exprange(0.001,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 222.207333879, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100+(1..4));
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.12);
};
~filter.play;
);" ],
[ 233.35797113, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = SinOsc.ar(120+(1..8));
  sig = sig * LFSaw.ar(2/[2,4]/fib(8)).exprange(0.001,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 266.720968987, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = LFSaw.ar(120+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50);
  sig = sig * LFSaw.ar(2/[2,4]/fib(8)).exprange(0.001,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 295.72726032, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = LFSaw.ar(120+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(1/2).exprange(0.001,1));
  sig = sig * LFSaw.ar(2/[2,4]/fib(8)).exprange(0.001,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 317.784887166, 'me', "thisProcess.stop;" ],
[ 334.131627165, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = LFSaw.ar(120+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(1/2).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(1/4).exprange(100.001,1000));
  sig = sig * LFSaw.ar(2/[2,4]/fib(8)).exprange(0.001,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 344.938363168, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = LFSaw.ar(120+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(1/2).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4).exprange(100.001,1000));
  sig = sig * LFSaw.ar(2/[2,4]/fib(8)).exprange(0.001,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 348.077876014, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = LFSaw.ar(120+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4).exprange(100.001,1000));
  sig = sig * LFSaw.ar(2/[2,4]/fib(8)).exprange(0.001,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 354.517485204, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = LFSaw.ar(120+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4).exprange(100.001,1000));
  sig = sig * LFSaw.ar(2/[2,4]/fib(8)).exprange(0.001,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 360.295843047, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = LFSaw.ar(120+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,1000));
  sig = sig * LFSaw.ar(2/[2,4]/fib(8)).exprange(0.001,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 366.321160244, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = LFSaw.ar(120+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(2/[2,4]/fib(8)).exprange(0.001,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 370.500790373, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = LFSaw.ar(120+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/[2,4]/fib(8)).exprange(0.001,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 372.86301056, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = LFSaw.ar(120+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 387.762655722, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = LFSaw.ar(120+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 409.702957288, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10x0+(1..4));
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.12);
};
~filter.play;
);" ],
[ 412.024472987, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10+(1..4));
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.12);
};
~filter.play;
);" ],
[ 421.325587559, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10+(1..4));
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~filter.play;
);" ],
[ 427.492466069, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10+(1..4));
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.025);
};
~filter.play;
);" ],
[ 443.60271631, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = VarSaw.ar(120+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 450.302955642, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = VarSaw.ar(90+(1..8));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 454.120200332, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var sig = VarSaw.ar(90+((1..8)/10));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 460.213595418, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10+(1..4));
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~filter.play;
);" ],
[ 472.59523029, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10+(1..4));
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.5,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~filter.play;
);" ],
[ 474.632059465, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10+(1..4));
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.5,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~filter.play;
);" ],
[ 512.500060954, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var imp = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*100));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 521.937693129, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var imp = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*1000));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 530.491810173, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*1000));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 533.221060131, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*1000));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 539.685532899, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.05],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*1000));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 542.680228239, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.05],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*1000));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 555.637624407, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.05],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*250));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 558.457856219, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.015],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*250));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 564.5945025, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.015],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 572.971435526, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.005],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 586.468378553, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10+(1..4));
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.5,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.0025);
};
~filter.play;
);" ],
[ 601.178742107, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.005],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * imp;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 610.965011923, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.15],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * imp;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 626.393122984, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.15],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 631.453883242, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.015],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 638.875450293, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.015],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*250));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 640.60158968, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.025],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*250));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 647.19743035, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.025],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*250));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 648.231486654, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.025],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(90+((1..8)/10)+(imp*250));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 655.693582075, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.025],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/10)+(imp*250));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 658.041833054, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.025],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 666.216734284, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.025],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 669.29924699, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.025],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 676.834027729, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.025],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 687.115100392, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.025],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 688.557501502, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 693.843770475, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.125],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 698.322476687, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.0125],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 708.327343273, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.0025],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*2500));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 712.043484853, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.0125],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 715.516624284, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 720.554585887, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.0125],[-3,3]),Impulse.ar(2,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 728.974729054, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.0125],[-3,3]),Impulse.ar(2,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*150));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 732.366762388, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.00125],[-3,3]),Impulse.ar(2,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*150));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 737.652151896, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.052,0.00125],[-3,3]),Impulse.ar(2,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*150));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 741.717368056, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.00125],[-3,3]),Impulse.ar(2,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*150));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 758.636429876, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.00125],[-3,3]),Impulse.ar(2,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*150));
  sig = BPF.ar(sig,imp*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 767.187066833, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.00125],[-3,3]),Impulse.ar(2,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*150));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 777.875182517, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(2,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.00125],[-3,3]),Impulse.ar(2,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*150));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,LFSaw.ar(2/fib(8)).exprange(0.001,1)*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 784.658174063, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(2,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.00125],[-3,3]),Impulse.ar(2,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*150));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 796.364280532, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(2,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.00125],[-3,3]),Impulse.ar(2,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*150));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 803.107344944, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(2,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.00125],[-3,3]),Impulse.ar(2,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*1500));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 804.573178011, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(2,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.0125],[-3,3]),Impulse.ar(2,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*1500));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 812.798304792, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*1500));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 822.904672203, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 834.905210055, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 838.026317869, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1) * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 848.277557389, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 854.036697061, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig ** env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 867.800365933, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.0052,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig ** env * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 878.522756372, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.52,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig ** env * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 881.822539262, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.052,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig ** env * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 884.617157454, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.052,0.125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig ** env * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 887.418105596, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig ** env * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 891.055489505, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*250));
  sig = BPF.ar(sig,env*10000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig ** env * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 904.638493776, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*2500));
  sig = BPF.ar(sig,env*1000+50) + Resonz.ar(sig,env*10000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig ** env * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 907.141292204, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*2500));
  sig = BPF.ar(sig,env*1000+50) + Resonz.ar(sig,env*1000+50) + LPF.ar(sig,env.exprange(100.001,4000));
  sig = sig ** env * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 911.261776033, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*2500));
  sig = BPF.ar(sig,env*1000+50) + Resonz.ar(sig,env*1000+50) + LPF.ar(sig,env.exprange(100.001,400));
  sig = sig ** env * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 914.64575433, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*2500));
  sig = BPF.ar(sig,env*1000+50) + Resonz.ar(sig,env*1000+50) + LPF.ar(sig,env.exprange(1000.001,40));
  sig = sig ** env * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 928.518786835, 'me', "(
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(Env([0,1,0],[0.02,0.0125],[-3,3]),Impulse.ar(1,(0..3)/4));
  var sig = VarSaw.ar(72+((1..8)/100)+(imp*2500));
  sig = BPF.ar(sig,env*1000+50) + Resonz.ar(sig,env*1000+50) + LPF.ar(sig,env.exprange(1000.001,40));
  sig = sig ** env * env;
  //sig = LeakDC.ar(sig);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~asd,postVol:true);
~asd.play;
);" ],
[ 932.38391695, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10+(1..4));
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.5,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.025);
};
~filter.play;
);" ],
[ 939.498564147, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10+(1..4));
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.5,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~filter.play;
);" ],
[ 949.883573351, 'me', "(
~filter.quant=2;
~filter.fadeTime=5;
~filter={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10+(1..4));
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.5,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.025);
};
~filter.play;
);" ],
[ 953.746133177, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var imp = EnvGen.ar(