// History, as it was on Sat Jun  6 17:49:57 2015.

[
[ 0, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50!2) * LFSaw.ar(4).exprange(0.001,1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 20.663553118, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50!2) * LFSaw.ar(4).exprange(0.001,1);
  sig = sig + (sig * Pulse.ar(1));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 38.84538258, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50!2++5000) * LFSaw.ar(4).exprange(0.001,1);
  sig = sig + (sig * Pulse.ar([0,0,1]));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 51.814506368, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50!2++500) * LFSaw.ar(4).exprange(0.001,1);
  sig = sig + (sig * Pulse.ar([0,0,1]));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 55.687013114, 'me', "thisProcess.stop;" ],
[ 68.023279035, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([]++[50,51]++500) * LFSaw.ar(4).exprange(0.001,1);
  sig = sig + (sig * Pulse.ar([0,0,1]));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 77.223081872, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([]++[50,51]++5000) * LFSaw.ar(4).exprange(0.001,1);
  sig = sig + (sig * Pulse.ar([0,0,1]));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 113.18711102, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([]++[50,51]++5000);
  sig = (sig *LFSaw.ar(4).exprange(0.001,1) )+ (sig * Pulse.ar([0,0,1]));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 124.88792122, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([]++[50,51]++5000);
  sig = (sig *LFSaw.ar(4).exprange(0.001,1) )+ (sig * Pulse.ar(1/4));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 143.764901189, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([]++[50,51]++5000);
  sig = (sig * LFSaw.ar([4,1]).exprange(0.001,1) )+ (sig * Pulse.ar(1/4));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 159.413317335, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([]++[50,51]++5000);
  sig = (sig * LFSaw.ar([4,1]).exprange(0.001,1) )+ (sig * Pulse.ar(1/4).softclip);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 178.859844633, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,51,5000]);
  sig = (sig * LFSaw.ar([4,1,0]).exprange(0.001,1) )+ (sig * Pulse.ar(1/4).softclip);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 190.479078771, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,51,5000]);
  sig = (sig * LFSaw.ar(1/[4,1,0]).exprange(0.001,1) )+ (sig * Pulse.ar(1/4).softclip);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 196.28424101, 'me', "thisProcess.stop;" ],
[ 196.875071598, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,51,5000]);
  sig = (sig * LFSaw.ar(1/[4,1,1]).exprange(0.001,1) )+ (sig * Pulse.ar(1/4).softclip);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 210.656209295, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,51,5000]);
  sig = (sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1) )+ (sig * Pulse.ar(1/4).softclip);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 223.560435691, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,51,5000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400 )+ (sig * Pulse.ar(1/4).softclip);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 232.207071342, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,51,5000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400 )+ HPF.ar(sig * Pulse.ar(1/4).softclip,400);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 236.713206259, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400 )+ HPF.ar(sig * Pulse.ar(1/4).softclip,400);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 243.399449565, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400 )+ HPF.ar(sig * Pulse.ar(1/4).softclip,400);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 295.288163141, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400 )+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/4,4,CoinGate.ar(0.5,Impulse.ar(1)))).softclip,400);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
);" ],
[ 307.205079739, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400 )+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/4,4,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 318.473258985, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400 )+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/8,16,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 332.810382154, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400 )+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/8,16,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.5);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 342.607667884, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/8,16,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.5);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 377.162925979, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/8,16,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.5);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 392.327420207, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/8,16,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.25);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 398.819331322, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/8,16,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.15);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 406.14886981, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000,2500]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/8,16,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.15);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 412.396881358, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,75,5000,2500]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/8,16,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.15);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 422.034304138, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000,2500]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/8,16,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.15);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 428.246522811, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar([50,5000,15000]);
  sig = LPF.ar(sig * LFSaw.ar(2/[4,1,1]).exprange(0.001,1),400,mul:0.5)+ HPF.ar(sig * Pulse.ar(TExpRand.ar(1/8,16,CoinGate.ar(0.15,Impulse.ar(8)))).softclip,400,mul:0.15);
  sig = GVerb.ar(sig,10,mul:0.1) + sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.01,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
];