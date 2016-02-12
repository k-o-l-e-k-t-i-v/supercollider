// History, as it was on Fri Jun 19 13:18:26 2015.

[
[ 0, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50!2+SinOsc.kr(11).range(0,40));
  sig = LPF.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 13.08323678, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50!2+SinOsc.kr(11).range(0,40));
  sig = LPF.ar(sig,200);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 15.858594244, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50!2+SinOsc.kr(11).range(0,40));
  sig = LPF.ar(sig,800);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 36.755340662, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50!2+SinOsc.kr(11).range(0,40));
  sig = LPF.ar(sig,800) * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 45.322284923, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50!2+SinOsc.kr(11).range(0,40));
  sig = LPF.ar(sig,800) * Pulse.ar(2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 49.072554211, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50!2+SinOsc.kr(11).range(0,40));
  sig = LPF.ar(sig,800) * Pulse.ar([1,2,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 51.751687436, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50!2+SinOsc.kr(11).range(0,40));
  sig = LPF.ar(sig,800) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 63.382855978, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50+SinOsc.kr(11+[1,2,3,4]).range(0,40));
  sig = LPF.ar(sig,800) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 72.387871347, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50+SinOsc.kr(4+[1,2,3,4]).range(0,40));
  sig = LPF.ar(sig,800) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 88.385601948, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50+SinOsc.kr(8+[1,2,3,4]).range(0,40));
  sig = LPF.ar(sig,800) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 93.629591257, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50+SinOsc.kr(8+[1,2,3,4]).range(0,40));
  sig = LPF.ar(sig,800) * Pulse.ar([1,2,3,4]/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 99.613642316, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50+SinOsc.kr(8+[1,2,3,4]).range(0,40));
  sig = LPF.ar(sig,800) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 114.82538892, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50+SinOsc.kr(8+[1,2,3,4]).range(0,40));
  sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 128.639270777, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50+SinOsc.kr(8+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar(1/4).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 136.501677422, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50+SinOsc.kr(8+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar(1).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 141.184770066, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50+SinOsc.kr(8+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar([1,2,4,8]).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 154.166144681, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(50+SinOsc.kr(8+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar([1,2,4,8]).exprange(40.001,10000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 158.856240635, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(100+SinOsc.kr(8+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar([1,2,4,8]).exprange(40.001,10000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 164.806288972, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(1000+SinOsc.kr(8+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar([1,2,4,8]).exprange(40.001,10000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 170.040320094, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(100+SinOsc.kr(8+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar([1,2,4,8]).exprange(40.001,10000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 175.067623131, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(72+SinOsc.kr(8+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar([1,2,4,8]).exprange(40.001,10000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 183.254584404, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(72+SinOsc.kr(2+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar([1,2,4,8]).exprange(40.001,10000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 188.835638542, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(72+SinOsc.kr(2+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar(4).exprange(40.001,10000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 196.001535609, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(72+SinOsc.kr(2+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar(1).exprange(40.001,10000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 201.728586304, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(72+SinOsc.kr(2+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 210.429102583, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(72+SinOsc.kr(2+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 226.566459278, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(72+SinOsc.kr(2+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 242.615690488, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(72+SinOsc.kr(2+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar(44).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 247.032682372, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(72+SinOsc.kr(2+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 250.818862045, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(72+SinOsc.kr([1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 257.827611358, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(72+SinOsc.kr(11+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 260.731217653, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(720+SinOsc.kr(11+[1,2,3,4]).range(0,40));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 269.242550059, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(720+SinOsc.kr(11+[1,2,3,4]).range(0,4000));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 276.205849336, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(72+SinOsc.kr(11+[1,2,3,4]).range(0,4000));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 279.060153264, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,4000));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 284.777500128, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,1000));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 290.988897885, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,1000));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,1000)) * Pulse.ar([1,2,3,4]);
  sig = GVerb.ar(sig,10)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 309.619655222, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,1000));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,1000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,10)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 320.462212458, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,100));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,1000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,10)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 326.842989893, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,100));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,10)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 333.468924921, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,100));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,10)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 338.199916258, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,100));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,10)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 339.859591123, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,100));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 343.711245901, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,100));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 346.558870334, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,100));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 358.621545242, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.5);
};
~fil.play;
);" ],
[ 367.300729432, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,100));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,100)/2+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 369.726168601, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(40+SinOsc.kr(11+[1,2,3,4]).range(0,100));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 388.618830652, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar(60.midicps*2/0.5pi+SinOsc.kr(11+[1,2,3,4]).range(0,4));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 400.106590444, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67].midicps*2/0.5pi+SinOsc.kr(11+[1,2,3,4]).range(0,4));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 405.841857577, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67].midicps*1.5/0.5pi+SinOsc.kr(11+[1,2,3,4]).range(0,4));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * LFSaw.ar([1,2,3,4]).range(0,1);
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 412.793880818, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 428.177184059, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67].midicps*1.5/0.5pi+SinOsc.kr(11+[1,2,3,4]).range(0,4));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 444.405719293, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67,72].midicps*1.5/0.5pi+SinOsc.kr(11+[1,2,3,4]).range(0,4));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 453.127683181, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67,72].midicps*1.25/0.5pi+SinOsc.kr(11+[1,2,3,4]).range(0,4));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 458.531759845, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67,72].midicps*1/0.5pi+SinOsc.kr(11+[1,2,3,4]).range(0,4));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 469.201180309, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67,72].midicps*1/0.25pi+SinOsc.kr(11+[1,2,3,4]).range(0,12));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 478.212391011, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67,72].midicps*1/0.25pi+SinOsc.kr(1+[1,2,3,4]).range(0,12));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 488.116009414, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67,72].midicps*1/0.25pi+SinOsc.kr(1+[1,2,3,4]).range(0,2));
  sig = RLPF.ar(sig,LFSaw.ar(44/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 496.723424414, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67,72].midicps*1/0.25pi+SinOsc.kr(1+[1,2,3,4]).range(0,2));
  sig = RLPF.ar(sig,LFSaw.ar(14/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 497.58669658, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67,72].midicps*1/0.25pi+SinOsc.kr(1+[1,2,3,4]).range(0,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 510.472477084, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67,72].midicps*1/0.25pi+SinOsc.kr(1+[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 513.448592966, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67,72].midicps*1/0.25pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 516.917570172, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = LFSaw.ar([60,65,67,72].midicps*1/0.5pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 546.320901977, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = Pluck.ar([60,65,67,72].midicps*1/0.5pi+SinOsc.kr(1/[1,2,3,4]).range(0,5),EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4)));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 549.611864468, 'me', "thisProcess.stop;" ],
[ 558.724086268, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,65,67,72].midicps*1/0.5pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 571.952162408, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,65,67,72].midicps*1/0.5pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 577.198668831, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,65,67,72].midicps*1/0.5pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 599.120555917, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,65,67,72].midicps*2/pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 611.374824404, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,63,67,72].midicps*2/pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 617.822448742, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,63,65,72].midicps*2/pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 627.137870175, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,63,65,69].midicps*2/pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 637.991460988, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,63,65,67].midicps*2/pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 644.251408098, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,67].midicps*2/pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 647.228512965, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*2/pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 659.826886542, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*2/pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 671.73487342, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*2/pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 677.958581874, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*2/0.5pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 687.183376741, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*2/0.25pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 698.872652578, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*2/[0.5,0.25,1,2]*pi+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 707.053152278, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*2/([0.5,0.25,1,2]*pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 721.49298679, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1.5/([0.5,0.25,1,2]*pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 733.595845261, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1.25/([0.5,0.25,1,2]*pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 740.436905143, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*2/([0.5,0.25,1,2]*pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 744.907391961, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*2/([0.5,0.25,1,2]*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 752.483634828, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1.5/([0.5,0.25,1,2]*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 760.623718892, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1.5/([0.5,0.25,1,2]*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 769.366074155, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1.5/([0.5,0.25,1,2]*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(4/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 775.500348865, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1.5/([0.5,0.25,1,2]*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 793.588863374, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1.25/([0.5,0.25,1,2]*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 798.269555166, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*2/([0.5,0.25,1,2]*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 803.344470107, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1/([0.5,0.25,1,2]*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 810.386077986, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1/([0.5,0.25,1,2].scramble*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 821.171347718, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1/([0.5,0.25,1,2].scramble*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 832.4348009, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1/([0.5,0.25,1,2].scramble*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 841.20843344, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1/([0.5,0.25,1,2].scramble*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar([1,1/2],(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 858.231199543, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1/([0.5,0.25,1,2].scramble*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,[1,2,4]],[3,-3]),Impulse.ar([1,1/2,1/4],(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 872.583203634, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1/([0.5,0.25,1,2].scramble*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,[1,2,4]],[3,-3]),Impulse.ar([1,1/2,1/4]*2,(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 882.163255119, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([61,63,65,48].midicps*1/([0.5,0.25,1,2].scramble*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,[1,2,4]],[3,-3]),Impulse.ar([1,1/2,1/4],(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 888.964266759, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,63,65,48].midicps*1/([0.5,0.25,1,2].scramble*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,[1,2,4]],[3,-3]),Impulse.ar([1,1/2,1/4],(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 894.806989405, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,67,65,48].midicps*1/([0.5,0.25,1,2].scramble*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,[1,2,4]],[3,-3]),Impulse.ar([1,1/2,1/4],(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 898.021492141, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,67,69,48].midicps*1/([0.5,0.25,1,2].scramble*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,[1,2,4]],[3,-3]),Impulse.ar([1,1/2,1/4],(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 901.602421472, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,67,72,48].midicps*1/([0.5,0.25,1,2].scramble*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,[1,2,4]],[3,-3]),Impulse.ar([1,1/2,1/4],(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 909.25526754, 'me', "(
~lame.quant=2;
~lame.fadeTime=5;
~lame={
  var sig = VarSaw.ar([60,67,72,48,48+7].midicps*1/([0.5,0.25,1,2].scramble*0.5pi)+SinOsc.kr(1/[1,2,3,4]).range(0,5));
  sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(40.001,10000)) * EnvGen.ar(Env([0,1,0],[0.002,[1,2,4]],[3,-3]),Impulse.ar([1,1/2,1/4],(0..3)/4));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~lame,postVol:true);
~lame.play;
);" ],
[ 928.87640352, 'me', "~lame.stop(7);" ],
[ 930.092636816, 'me', "~fil.stop(7);" ],
[ 947.52072765, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2)*Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 950.424705008, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 961.481452268, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2)*Pulse.ar(1);
  sig = LPF.ar(sig,400);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 973.491682262, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2)*Pulse.ar(1);
  sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*5000+80);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 987.55546114, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2)*Pulse.ar(4);
  sig = LPF.ar(sig,LFSaw.ar(4).exprange(0.001,1)*5000+80);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 994.240943755, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2)*Pulse.ar(4);
  sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*5000+80);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 999.603151491, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.2!2)*Pulse.ar(4);
  sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*5000+80);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1011.224446675, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.2!2)*Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*5000+80);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1016.806259042, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.2!2)*Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*5000+80);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1032.827303135, 'me', "~fil.stop(7);" ],
[ 1045.497496571, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.2!2)*Pulse.ar(4/fib(8));
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*15000+80);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1239.729264492, 'me', "(
  ~squeaks.quant=2;
  ~squeaks.fadeTime=5;
  ~squeaks={
    var sig = LFSaw.ar([1000,200,50,4000]);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(111/(i+1)/fib(8)