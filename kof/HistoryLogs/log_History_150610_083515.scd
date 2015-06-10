// History, as it was on Wed Jun 10 08:35:15 2015.

[
[ 0, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 29.094283744, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/20,1/30,4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 58.328608124, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,LFDNoise1.ar(4!8),1/30,4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 71.208790579, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,LFDNoise1.ar(4!8).range(0.002,0.2),1/30,4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 79.333998207, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,LFDNoise1.ar(4!8).range(0.002,0.2),1,4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 90.759836322, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(4!8).range(0.002,0.2),4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 99.986749762, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(4).range(0.002,0.2),4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 116.045235418, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(8).exprange(0.002,0.2),4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 131.606321863, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16!2).exprange(0.002,0.2),4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 134.478229949, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16!2).exprange(0.0002,0.2),4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 138.666370537, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16!2).exprange(0.0002,0.2),16);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 144.439259457, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16!2).exprange(0.0002,0.2),16);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 149.761311277, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16!2).exprange(0.0002,0.2),1);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 159.07675056, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100)) * Pulse.ar(4);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16!2).exprange(0.0002,0.2),1);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 178.582051928, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16!2).exprange(0.0002,0.2),1);
  sig= sig * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 197.039332864, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16!2).exprange(0.0002,0.2),1);
  sig= sig * Pulse.ar(4);
  sig = GVerb.ar(sig,10,mul:0.1)+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 210.689067229, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16!2).exprange(0.0002,0.2),1);
  sig= sig * Pulse.ar(4);
  sig = GVerb.ar(sig,[10,11],mul:0.1)+sig;

  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 220.284598923, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16!2).exprange(0.0002,0.2),1);
  sig= sig * Pulse.ar(4);
  sig = GVerb.ar(sig,[10,11],mul:0.2)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 237.044498668, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.0002,0.2),1);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[10,11],mul:0.2)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 256.275695341, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.02,0.2),1);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[10,11],mul:0.2)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 259.781890509, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.02,1),1);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[10,11],mul:0.2)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 267.395209541, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,1),1);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[10,11],mul:0.2)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 270.890949658, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.00002,1),1);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[10,11],mul:0.2)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 274.766068876, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.0002,1),1);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[10,11],mul:0.2)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 278.642141136, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.0002,0.1),1);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[10,11],mul:0.2)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 283.236717298, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),1);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[10,11],mul:0.2)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 283.964206611, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.02,0.1),1);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[10,11],mul:0.2)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 297.360907443, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.02,0.1),1);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[10,11],mul:0.1)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 304.273134084, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.02,0.1),1);
  sig= sig * Pulse.ar(1/fib(8));
  sig = GVerb.ar(sig,[10,11],mul:0.1)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 307.269433153, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.02,0.1),1);
  sig= sig * Pulse.ar(1/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 320.413036277, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.02,0.1),1);
  sig= sig * Pulse.ar(1/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 327.685990864, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.02,0.1),1);
  sig= sig * Pulse.ar(5/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 329.104912668, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.02,0.1),1);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 340.1468606, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.02,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 350.902563478, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100));
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 367.696774514, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100)) ++ WhiteNoise.ar(0.1);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 378.479784281, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100)) ++ WhiteNoise.ar(0.1) ++ SinOsc.ar(4000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 390.63526703, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..8)/100)) ++ WhiteNoise.ar(0.1) ++ SinOsc.ar([4000,2000,8000]);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 403.859394229, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/100)) ++ WhiteNoise.ar(0.1) ++ SinOsc.ar([4000,2000,8000]);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 408.749762145, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/10)) ++ WhiteNoise.ar(0.1) ++ SinOsc.ar([4000,2000,8000]);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 417.537604174, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/10)) ++ WhiteNoise.ar(0.2) ++ SinOsc.ar([4000,2000,8000]);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 427.553442612, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/10)) ++ HPF.ar(WhiteNoise.ar(0.2),4000) ++ SinOsc.ar([4000,2000,8000]);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 429.596685074, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/10)) ++ HPF.ar(WhiteNoise.ar(0.4),4000) ++ SinOsc.ar([4000,2000,8000]);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 441.594893228, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/10)) ++ HPF.ar(WhiteNoise.ar(0.4),4000) ++ Blip.ar([4000,2000,8000],4);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 446.604913081, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/10)) ++ HPF.ar(WhiteNoise.ar(0.4),4000) ++ Blip.ar([4000,2000,800],4);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 456.943595586, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/10)) ++ HPF.ar(WhiteNoise.ar(0.4),4000) + Blip.ar([4000,2000,800],4);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 465.133756048, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/10)) ++ HPF.ar(WhiteNoise.ar(0.4),4000) + Blip.ar([400,2000,800],4);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 469.427136305, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/10)) ++ HPF.ar(WhiteNoise.ar(0.4),4000) + Blip.ar([400,2000,800]*Pulse.ar(4),4);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 482.693627786, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/10)) ++ HPF.ar(WhiteNoise.ar(0.4),4000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 486.511641229, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/10)) ++ HPF.ar(WhiteNoise.ar(0.4),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 492.151388738, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..4)/10)) ++ HPF.ar(WhiteNoise.ar(0.8),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 504.347277405, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 508.944339135, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.1),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 520.614379447, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(16/fib(8)).exprange(0.002,0.01),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 530.365731722, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1/fib(8)).exprange(0.002,0.01),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 555.060166319, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1/4/fib(8)).exprange(0.002,0.01),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 561.796327788, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.002,0.01),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 574.53186135, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.002,0.01).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 581.305861041, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.01).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 584.322852664, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.04).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 590.974387272, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.4).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 598.1341414, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[100,110],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 617.167430008, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[3,4,5,6],mul:0.1)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 624.71953971, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[3,4,5,6],mul:0.01)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 631.605211997, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[3,4,5,6],mul:0.04)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 652.072725165, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[3,4,5,6]*2,mul:0.04)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 662.444877036, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[3,4,5,6]*LFSaw.ar(1/4).exprange(1.001,10),mul:0.04)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 670.062318689, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[3,4,5,6]*LFSaw.ar(1/4).exprange(1.001,5),mul:0.04)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 673.890883564, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[3,4,5,6]*LFSaw.ar(1/4).exprange(1.001,4),mul:0.04)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 681.906367994, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = GVerb.ar(sig,[3,4,5,6],mul:0.04)+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 701.129307202, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1) * GVerb.ar(sig,[3,4,5,6],mul:0.04))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 714.081995891, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1) * GVerb.ar(sig,[10,11],mul:0.1))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 725.590572752, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 734.577323347, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(4) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 744.315247619, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(4/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 754.52662352, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 769.770166166, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000) ++ SinOsc.ar(220,mul:0.1);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 773.285771253, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000) ++ SinOsc.ar(220,mul:0.2);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 776.172348208, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000) ++ SinOsc.ar(220,mul:0.4);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 781.47000015, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000) ++ SinOsc.ar(220);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 787.668289677, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000) ++ SinOsc.ar(220*1.5);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 792.076225433, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000) ++ SinOsc.ar(220*1.25);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 801.335202019, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000) ++ SinOsc.ar(2200*1.25);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 812.310223614, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000) ++ SinOsc.ar(2200*[1.5,1.25]);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 825.318535925, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1]);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 832.421972032, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1],mul:0.2);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 836.300644167, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.8!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 846.159082698, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8));
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 862.913509066, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.095);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 867.626744977, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 887.603989444, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 895.324060912, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 904.537596214, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 913.399364819, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 945.829550439, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/4).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 958.22512466, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/4).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.002,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 967.634826014, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/4).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.002,0.08).round(0.02),8);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 974.173928786, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/4).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),8);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 977.905188079, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/4).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),16);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 981.260836393, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/4).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 986.907153029, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(4).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 996.298093532, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1067.884103338, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,2,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1082.051240877, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1089.387397019, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1099.429150738, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1101.328001771, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),1400) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1109.274839839, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ BPF.ar(WhiteNoise.ar(0.2!2),500,2) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1110.262577117, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ BPF.ar(WhiteNoise.ar(0.2!2),5000,2) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1125.879590989, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ BPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(1/4).exprange(0.001,1)*4000,2) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1135.358206593, 'me', "(
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ BPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(1/4).exprange(0.1,2)*4000,2) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1143.330665946, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ BPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(0.1,2)*4000,2) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1151.701044457, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ BPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(44).exprange(0.1,2)*4000,2) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1156.023948389, 'me', "(
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ BPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(44).exprange(0.1,2)*4000,0.2) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1163.627124403, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ BPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(44).exprange(0.1,2)*4000) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1166.987421707, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ BPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(44).exprange(0.01,2)*4000) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1172.821759428, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ BPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(1/4).exprange(0.01,2)*4000) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1349.405987319, 'me', "(
Ndef(\\a).fadeTime = 4;
Ndef(\\a).quant = 2;

Ndef(\\a,{
	var octave,tune,base,d1,d2,f,sig,detune;
	octave = Duty.kr(32,0,Dseq([0,2,1]*12,inf));
	tune = Duty.kr(16,0,Dseq([1,2,1.5,1.25,0.75],inf));
	base = Duty.kr(4,0,Dseq(([39,34,42,35]+octave).midicps/(tune*pi),inf));
	d1 = Duty.kr(1/4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	d2 = Duty.kr(4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	f = base * (d1*2) * d2;

	detune = SinOsc.ar([4,5,6,7]).range(-2,2);


	sig = LFSaw.ar(f+detune,mul:0.15) * Decay.ar(Impulse.ar(4/fib(8)),(1..8)/6);
	sig = Resonz.ar(sig,LFTri.ar(1/44/fib(8)).range(f*4,f/4));
	sig = AllpassN.ar(sig.distort!4,0.25,0.25,32);
	sig = CompanderD.ar(sig,0.5,1,1/6,0.002,0.02);
	sig = Vibrato.ar(sig,[4,5,6,7],0.2);
	sig = FreeVerb.ar(sig,0.133,2);

	Splay.ar(
		sig.distort.softclip
,0.1,0.2)}).play;
)" ],
[ 1355.765525441, 'me', "(
Ndef(\\a).fadeTime = 4;
Ndef(\\a).quant = 2;

Ndef(\\a,{
	var octave,tune,base,d1,d2,f,sig,detune;
	octave = Duty.kr(32,0,Dseq([0,2,1]*12,inf));
	tune = Duty.kr(16,0,Dseq([1,2,1.5,1.25,0.75],inf));
	base = Duty.kr(4,0,Dseq(([39,34,42,35]+octave).midicps/(tune*pi),inf));
	d1 = Duty.kr(1/4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	d2 = Duty.kr(4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	f = base * (d1*2) * d2;

	detune = SinOsc.ar([4,5,6,7]).range(-2,2);


	sig = LFSaw.ar(f+detune,mul:0.15) * Decay.ar(Impulse.ar(4/fib(8)),(1..8)/6);
	sig = Resonz.ar(sig,LFTri.ar(1/44/fib(8)).range(f*4,f/4));
	sig = AllpassN.ar(sig.distort!4,0.25,0.25,32);
	sig = CompanderD.ar(sig,0.5,1,1/6,0.002,0.02);
	sig = Vibrato.ar(sig,[4,5,6,7],0.2);
	sig = FreeVerb.ar(sig,0.133,2);

	Splay.ar(
		sig.distort.softclip.flat
,0.1,0.2)}).play;
)" ],
[ 1362.45284859, 'me', "(
Ndef(\\a).fadeTime = 4;
Ndef(\\a).quant = 2;

Ndef(\\a,{
	var octave,tune,base,d1,d2,f,sig,detune;
	octave = Duty.kr(32,0,Dseq([0,2,1]*12,inf));
	tune = Duty.kr(16,0,Dseq([1,2,1.5,1.25,0.75],inf));
	base = Duty.kr(4,0,Dseq(([39,34,42,35]+octave).midicps/(tune*pi),inf));
	d1 = Duty.kr(1/4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	d2 = Duty.kr(4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	f = base * (d1*2) * d2;

	detune = SinOsc.ar([4,5,6,7]).range(-2,2);


	sig = LFSaw.ar(f+detune,mul:0.15) * Decay.ar(Impulse.ar(4/fib(8)),(1..8)/6);
	sig = Resonz.ar(sig,LFTri.ar(1/44/fib(8)).range(f*4,f/4));
	sig = AllpassN.ar(sig.distort!4,0.25,0.25,32);
	sig = CompanderD.ar(sig,0.5,1,1/6,0.002,0.02);
	sig = Vibrato.ar(sig,[4,5,6,7],0.2);
	sig = FreeVerb.ar(sig,0.133,2);

	Splay.ar(
		sig.distort.softclip.flat
,0.1,0.4)}).play;
)" ],
[ 1369.314831092, 'me', "(
Ndef(\\a).fadeTime = 4;
Ndef(\\a).quant = 2;

Ndef(\\a,{
	var octave,tune,base,d1,d2,f,sig,detune;
	octave = Duty.kr(32,0,Dseq([0,2,1]*12,inf));
	tune = Duty.kr(16,0,Dseq([1,2,1.5,1.25,0.75],inf));
	base = Duty.kr(4,0,Dseq(([39,34,42,35]+octave).midicps/(tune*pi),inf));
	d1 = Duty.kr(1/4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	d2 = Duty.kr(4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	f = base * (d1*2) * d2;

	detune = SinOsc.ar([4,5,6,7]).range(-2,2);


	sig = LFSaw.ar(f+detune,mul:0.15) * Decay.ar(Impulse.ar(4/fib(8)),(1..8)/6);
	sig = Resonz.ar(sig,LFTri.ar(1/44/fib(8)).range(f*4,f/4));
	sig = AllpassN.ar(sig.distort!4,0.25,0.25,32);
	sig = CompanderD.ar(sig,0.5,1,1/6,0.002,0.02);
	sig = Vibrato.ar(sig,[4,5,6,7],0.2);
	sig = FreeVerb.ar(sig,0.133,2);

	Splay.ar(
		sig.distort.softclip.flat
,0.1,0.7)}).play;
)" ],
[ 1382.830431674, 'me', "(
Ndef(\\a).fadeTime = 4;
Ndef(\\a).quant = 2;

Ndef(\\a,{
	var octave,tune,base,d1,d2,f,sig,detune;
	octave = Duty.kr(32,0,Dseq([0,2,1]*12,inf));
	tune = Duty.kr(16,0,Dseq([1,2,1.5,1.25,0.75],inf));
	base = Duty.kr(4,0,Dseq(([39,34,42,35]+octave).midicps/(tune*pi),inf));
	d1 = Duty.kr(1/4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	d2 = Duty.kr(4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	f = base * (d1*2) * d2;

	detune = SinOsc.ar([4,5,6,7]).range(-2,2);


	sig = LFSaw.ar(f+detune,mul:0.15) * Decay.ar(Impulse.ar(4/fib(8)),(1..8)/6);
	sig = Resonz.ar(sig,LFTri.ar(1/44/fib(8)).range(f*4,f/4));
	sig = AllpassN.ar(sig.distort!4,0.25,0.25,32);
	sig = CompanderD.ar(sig,0.5,1,1/6,0.002,0.02);
	sig = Vibrato.ar(sig,[4,5,6,7],0.2);
	sig = FreeVerb.ar(sig,0.133,2);

	Splay.ar(
		sig.distort.softclip.flat
,0.1,1)}).play;
)" ],
[ 1439.928229923, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ BPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(1/4).exprange(0.01,2)*4000) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.0195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1447.562926015, 'me', "(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ BPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(1/4).exprange(0.01,2)*4000) ++ SinOsc.ar(220*[1.5,1.25,2,4].scramble,mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.0295);
};
m.addMix(~lament,postVol:true);
~lament.play;
);" ],
[ 1469.160495759, 'me', "(
Ndef(\\a).fadeTime = 4;
Ndef(\\a).quant = 2;

Ndef(\\a,{
	var octave,tune,base,d1,d2,f,sig,detune;
	octave = Duty.kr(32,0,Dseq([0,2,1]*12,inf));
	tune = Duty.kr(16,0,Dseq([1,2,1.5,1.25,0.75],inf));
	base = Duty.kr(4,0,Dseq(([39,34,42,35]+octave).midicps/(tune*pi),inf));
	d1 = Duty.kr(1/4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	d2 = Duty.kr(4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	f = base * (d1*2) * d2;

	detune = SinOsc.ar([4,5,6,7]).range(-2,2);


	sig = LFSaw.ar(f+detune,mul:0.15) * Decay.ar(Impulse.ar(4/fib(8)),(1..8)/6);
	sig = Resonz.ar(sig,LFTri.ar(1/44/fib(8)).range(f*4,f/4));
	sig = AllpassN.ar(sig.distort!4,0.25,0.25,32);
	sig = CompanderD.ar(sig,0.5,1,1/6,0.002,0.02);
	sig = Vibrato.ar(sig,[4,5,6,7],0.2);
	sig = FreeVerb.ar(sig,0.133,2);

	Splay.ar(
		sig.distort.softclip.flat
,0.1,0.2)}).play;
    m.addMix(~lament,postVol:true);
)" ],
[ 1478.524089263, 'me', "(
Ndef(\\a).fadeTime = 4;
Ndef(\\a).quant = 2;

Ndef(\\a,{
	var octave,tune,base,d1,d2,f,sig,detune;
	octave = Duty.kr(32,0,Dseq([0,2,1]*12,inf));
	tune = Duty.kr(16,0,Dseq([1,2,1.5,1.25,0.75],inf));
	base = Duty.kr(4,0,Dseq(([39,34,42,35]+octave).midicps/(tune*pi),inf));
	d1 = Duty.kr(1/4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	d2 = Duty.kr(4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
	f = base * (d1*2) * d2;

	detune = SinOsc.ar([4,5,6,7]).range(-2,2);


	sig = LFSaw.ar(f+detune,mul:0.15) * Decay.ar(Impulse.ar(4/fib(8)),(1..8)/6);
	sig = Resonz.ar(sig,LFTri.ar(1/44/fib(8)).range(f*4,f/4));
	sig = AllpassN.ar(sig.distort!4,0.25,0.25,32);
	sig = CompanderD.ar(sig,0.5,1,1/6,0.002,0.02);
	sig = Vibrato.ar(sig,[4,5,6,7],0.2);
	sig = FreeVerb.ar(sig,0.133,2);

	Splay.ar(
		sig.distort.softclip.flat
,0.1,0.2)}).play;
    m.addMix(~a,postVol:true);
)" ],
[ 1498.507895214, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~ss.play;
);" ],
[ 1511.904079855, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/1.2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~ss.play;
);" ],
[ 1531.594223049, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/1.5,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~ss.play;
);" ],
[ 1535.419120082, 'me', "(
~ss.quant=2;
~ss.fadeTime=2;
~ss={
  var high,mid,low;
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/0.2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~ss.play;
);" ],
[ 1544.78595896, 'me', "~a.stop(10)" ],
[ 1550.093478929, 'me', "~ss.stop(7);" ],
[ 1565.762942283, 'me', "NdefMixer(s)" ],
[ 1590.4412284