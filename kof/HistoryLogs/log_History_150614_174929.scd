// History, as it was on Sun Jun 14 17:49:29 2015.

[
[ 0, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = LFSaw.ar(50!2);
  sig = LPF.ar(sig,LFSaw.ar(4).exprange(10.001,1000));
  Splay.ar(sig.flat,0.25,0.5);
};
~impressum.play;
);" ],
[ 13.161408943, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = LFSaw.ar(50!2);
  sig = LPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000));
  Splay.ar(sig.flat,0.25,0.5);
};
~impressum.play;
);" ],
[ 26.163162565, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = LFSaw.ar(50!2);
  sig = LPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[1,1,1,10]));
  Splay.ar(sig.flat,0.25,0.5);
};
~impressum.play;
);" ],
[ 33.653242234, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = LFSaw.ar(50!2);
  sig = LPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[1,1,20,10]));
  Splay.ar(sig.flat,0.25,0.5);
};
~impressum.play;
);" ],
[ 41.915073788, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = LFSaw.ar(50!2);
  sig = LPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10]));
  Splay.ar(sig.flat,0.25,0.5);
};
~impressum.play;
);" ],
[ 54.013751098, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = LFSaw.ar(50*[1,1,2,4]);
  sig = LPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10]));
  Splay.ar(sig.flat,0.25,0.5);
};
~impressum.play;
);" ],
[ 63.719770108, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = SinOsc.ar(50*[1,1,2,4]);
  sig = LPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10]));
  Splay.ar(sig.flat,0.25,0.5);
};
~impressum.play;
);" ],
[ 68.247885518, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = SinOsc.ar(50*[1,1,2,4]);
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10]));
  Splay.ar(sig.flat,0.25,0.5);
};
~impressum.play;
);" ],
[ 75.519347817, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar(50*[1,1,2,4]);
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10]));
  Splay.ar(sig.flat,0.25,0.5);
};
~impressum.play;
);" ],
[ 88.407437156, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar(50*[1,1,2,4]);
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,100*[4,1,20,10]));
  Splay.ar(sig.flat,0.25,0.5);
};
~impressum.play;
);" ],
[ 102.858188679, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar(50*[1,1,2,4]);
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
~impressum.play;
);" ],
[ 120.741689814, 'me', "(
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
  Splay.ar(sig,0.25,0.5);
};
~asd.play;
);" ],
[ 131.85591628, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar(50*[1,1,2,4]);
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar([1,2,3,4]);

  Splay.ar(sig.flat,0.25,0.25);
};
~impressum.play;
);" ],
[ 135.672104862, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar(50*[1,1,2,4]*10);
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar([1,2,3,4]);

  Splay.ar(sig.flat,0.25,0.25);
};
~impressum.play;
);" ],
[ 151.662852752, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar(50*[1,1,2,4]*10);
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar([1,2,3,4]).softclip;

  Splay.ar(sig.flat,0.25,0.25);
};
~impressum.play;
);" ],
[ 167.250041004, 'me', "(
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
  Splay.ar(sig,0.25,0.5);
};
~asd.play;
);" ],
[ 178.23070871, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar(432*[1,1,1.5,2]);
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar([1,2,3,4]).softclip;

  Splay.ar(sig.flat,0.25,0.25);
};
~impressum.play;
);" ],
[ 195.843962924, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar([60,63,65,72].midicps/(pi*[1,1,1.5,2]));
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar([1,2,3,4]).softclip;

  Splay.ar(sig.flat,0.25,0.25);
};
~impressum.play;
);" ],
[ 203.860927244, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar([60,63,65,72].midicps*2/(pi*[1,1,1.5,2]));
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar([1,2,3,4]).softclip;

  Splay.ar(sig.flat,0.25,0.25);
};
~impressum.play;
);" ],
[ 209.347908728, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar([60,63,65,72].midicps*4/(pi*[1,1,1.5,2]));
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar([1,2,3,4]).softclip;

  Splay.ar(sig.flat,0.25,0.25);
};
~impressum.play;
);" ],
[ 230.994792639, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar([60,63,65,72].midicps*4/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,10) );
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar([1,2,3,4]).softclip;

  Splay.ar(sig.flat,0.25,0.25);
};
~impressum.play;
);" ],
[ 237.865012943, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar([60,63,65,72].midicps*8/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,10) );
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar([1,2,3,4]).softclip;

  Splay.ar(sig.flat,0.25,0.25);
};
~impressum.play;
);" ],
[ 243.414051934, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = Pulse.ar([60,63,65,72].midicps*8/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,10) );
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(1/[1,2,3,4]).softclip;

  Splay.ar(sig.flat,0.25,0.25);
};
~impressum.play;
);" ],
[ 259.273420251, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*8/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,10) );
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(1/[1,2,3,4]).softclip;

  Splay.ar(sig.flat,0.25,0.25);
};
~impressum.play;
);" ],
[ 272.422559427, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*4/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,10) );
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(2/[1,2,3,4]).softclip;

  Splay.ar(sig.flat,0.25,0.25);
};
~impressum.play;
);" ],
[ 287.716070532, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*4/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,10) );
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(2/[1,2,3,4]).softclip;

  Splay.ar(sig.flat.distort,0.25,0.25);
};
~impressum.play;
);" ],
[ 292.503606586, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*4/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,10) );
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(2/[1,2,3,4]).softclip;

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 300.962264786, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[2,4,8,10]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.5);
};
~asd.play;
);" ],
[ 309.176712805, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[2,4,8,10]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.5);
};
~asd.play;
);" ],
[ 314.276960907, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[2,4,8,10]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/4,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.5);
};
~asd.play;
);" ],
[ 325.918813191, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,10) );
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(2/[1,2,3,4]).softclip;

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 329.432783812, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,10) );
  sig = RLPF.ar(sig,LFSaw.ar([1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(4/[1,2,3,4]).softclip;

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 341.226856082, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,10) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(4/[1,2,3,4]).softclip;

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 361.270798093, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(4/[1,2,3,4]).softclip;

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 372.097468395, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.5/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(4/[1,2,3,4]).softclip;

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 383.189474491, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(4/[1,2,3,4]).softclip;

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 390.45083294, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.25/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(4/[1,2,3,4]).softclip;

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 395.973419275, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.125/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * Pulse.ar(4/[1,2,3,4]).softclip;

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 416.458546978, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.125/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 431.825790963, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.125/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 436.847101338, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.125/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 440.713764971, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.125/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 453.180374048, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.125/(pi*[1,1,1.25,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 456.922545781, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.25/(pi*[1,1,1.25,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 462.092809579, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.5/(pi*[1,1,1.25,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 464.212716944, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.5/(pi*[1,1,1.5,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 469.74284307, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.5/(pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 472.481789637, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*4*1.5/(pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 479.29071376, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*4*1.75/(pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 482.25346477, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*4*1.75/(2pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 484.685180816, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*4*1.5/(2pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 491.339155045, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*4*1.5/(1.5pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 496.315484261, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*4*1.5/(0.5pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 498.798806697, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*4*1.5/(0.25pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 501.841219189, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1.5/(0.25pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 504.02041594, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2*1/(0.25pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 509.373544617, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2/(0.25pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 511.391186414, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2/(0.125pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 520.580157016, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2/(0.125pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 528.726344498, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2/(0.125pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(2,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 532.736325183, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2/(0.125pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),Impulse.ar(2,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 536.008936695, 'me', "(
~impressum.quant=2;
~impressum.fadeTime=5;
~impressum={
  var sig = VarSaw.ar([60,63,65,72].midicps*2/(0.125pi*[1,1,2])+SinOsc.kr(1/(1..8)).range(0,4) );
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,3,4]).exprange(10.001,1000*[4,1,20,10])) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[-3,3]),Impulse.ar(2,(0..3)/4));

  Splay.ar(sig.flat.distort,0.25,0.5);
};
~impressum.play;
);" ],
[ 545.698653312, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[2,4,8,100]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/4,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.5);
};
~asd.play;
);" ],
[ 549.445285471, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[2,40,80,100]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/4,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.5);
};
~asd.play;
);" ],
[ 551.078666474, 'me', "(
~asd.quant=2;
~asd.fadeTime=5;
~asd={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[20,40,80,100]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/4,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.5);
};
~asd.pl