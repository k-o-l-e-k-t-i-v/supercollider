// History, as it was on Fri Jun 12 19:42:20 2015.

[
[ 0, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var sig = LFSaw.ar(50+((1..8)/10));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 9.754710307, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var sig = LFSaw.ar(50+((1..8)/2));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 13.776855351, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var sig = LFSaw.ar(50+((1..8)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 20.861913437, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var sig = LFSaw.ar(50+((1..8)/400));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 26.636563624, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var sig = LFSaw.ar(50+((1..8)/4000));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 29.449705412, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var sig = LFSaw.ar(50+((1..8)/400));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 36.503880497, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var sig = LFSaw.ar(60+((1..8)/400));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 108.121707333, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(4,0,Dseq(36.midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 115.644011374, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(4,0,Dseq(48.midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 122.375143514, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(4,0,Dseq(60.midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 147.315085498, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 170.370236348, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 200.552097849, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = Resonz.ar(sig,m.kr(0,1)*15000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 237.597607055, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = Resonz.ar(sig,m.kr(0,1)*15000+50);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 282.203684963, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = Resonz.ar(sig,m.kr(0,1)*15000+50) + LPF.ar(sig,m.kr(0,2)*15000+51);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 303.100395317, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = Resonz.ar(sig,m.kr(0,1)*15000+50) + RLPF.ar(sig,m.kr(0,2)*15000+51);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 312.01268433, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = Resonz.ar(sig,m.kr(0,1)*15000+50) + RLPF.ar(sig,m.kr(0,2)*15000+51);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 326.942269513, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = Resonz.ar(sig,m.kr(0,1)*15000+50) + RLPF.ar(sig,m.kr(0,2)*15000+51);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4/fib(4));
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 387.833534631, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = Resonz.ar(sig,m.kr(0,1)*15000+50) + RLPF.ar(sig,m.kr(0,2)*15000+51);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4/fib(4));
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 536.399346098, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = Resonz.ar(sig,m.kr(0,1)*15000+50) + RLPF.ar(sig,m.kr(0,2)*15000+51);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4/fib(4));
  sig = Greyhole.ar(sig)/4+sig;
  sig = PitchShift.ar(sig,m.kr(0,3)*2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 547.377366603, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = Resonz.ar(sig,m.kr(0,1)*15000+50) + RLPF.ar(sig,m.kr(0,2)*15000+51);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4/fib(4));
  sig = PitchShift.ar(sig,m.kr(0,3)*2);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 603.515988439, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/400));
  sig = Resonz.ar(sig,m.kr(0,1)*15000+50) + RLPF.ar(sig,m.kr(0,2)*15000+51);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4/fib(4));
  sig = PitchShift.ar(sig,m.kr(0,3)*2);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 623.310021107, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/4000));
  sig = Resonz.ar(sig,m.kr(0,1)*15000+50) + RLPF.ar(sig,m.kr(0,2)*15000+51);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4/fib(4));
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~damn,postVol:true);
~damn.play;
);" ],
[ 632.237512684, 'me', "(
~damn.quant=2;
~damn.fadeTime=2;
~damn={
  var mod = Duty.kr(1/4,0,Dseq([60,72,67,65].midicps / ([1,2,1.5,1.25]*pi),inf));//
  var sig = LFSaw.ar(mod+((1..8)/40));
  sig = Resonz.ar(sig,m.kr(0,1)*15000+50) + RLPF.ar(sig,m.kr(0,2)*15000+51);
  sig = sig * LFSaw.ar(1/4