// History, as it was on Sat Jun  6 15:02:07 2015.

[
[ 0, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * ToggleFF.ar(CoinGate.ar(0.25,Impulse.ar(2)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 11.68580795, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * ToggleFF.ar(CoinGate.ar(0.25,Impulse.ar(8)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 24.347961084, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 83.804765541, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50*(1.001**(1..8))) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 91.918783441, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50*((1..8))) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 96.630749679, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50*(2**(1..8))) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 102.949282225, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50*(2**(1..8)/100)) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 106.119876252, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50*(2**(1..8)/8pi)) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 112.603253231, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(500*(2**(1..8)/8pi)) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 115.280705436, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50*(2**(1..8)/8pi)) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 122.432735518, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50+(1..8)) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 144.369837831, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50+(1..8)) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 151.267493213, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50+(1..8)) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 157.651534465, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50+(1..8)) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)*sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 163.003217857, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50+(1..8)) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.5)*sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 165.971580977, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50+(1..8)) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.6)*sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 187.392267797, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50+(1..8)) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)*sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 206.509236286, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50+(1..8)) ++ WhiteNoise.ar(0.1) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)*sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 211.573981817, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50+(1..8)) ++ WhiteNoise.ar(0.4) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)*sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 217.807348062, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50+(1..8)) ++ WhiteNoise.ar(0.4) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 240.877836727, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) ++ WhiteNoise.ar(0.4) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 251.926403737, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ LFPulse.ar(50) ++ WhiteNoise.ar(0.4) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 260.671777128, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ LFPulse.ar(50) ++ WhiteNoise.ar(0.2) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 265.860336297, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ LFPulse.ar(50!2) ++ WhiteNoise.ar(0.2!2) * ToggleFF.ar(CoinGate.ar(0.25!8,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 272.490881305, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ LFPulse.ar(50!2) ++ WhiteNoise.ar(0.2!2) * ToggleFF.ar(CoinGate.ar(0.25!2,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 275.940000064, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ LFPulse.ar(50!2) ++ WhiteNoise.ar(0.2!2) * ToggleFF.ar(CoinGate.ar(0.25!4,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 279.751351186, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ LFPulse.ar(50!2) ++ WhiteNoise.ar(0.2!2) * ToggleFF.ar(CoinGate.ar(0.25!4,Impulse.ar(4)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 282.961470451, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ LFPulse.ar(50!2) ++ WhiteNoise.ar(0.2!2) * ToggleFF.ar(CoinGate.ar(0.5!4,Impulse.ar(4)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 284.609415234, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ LFPulse.ar(50!2) ++ WhiteNoise.ar(0.2!2) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(4)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 308.137787284, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(50!2) ++ WhiteNoise.ar(0.2!2) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(4)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 320.691476047, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ WhiteNoise.ar(0.2!2) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(4)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 331.41289703, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(WhiteNoise.ar(0.2!2),12000) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(4)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 342.108560527, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(LFSaw.ar(12000!2),12000) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(4)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 357.563064465, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(LFSaw.ar(12000!2,mul:0.2),12000) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(4)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 363.997564301, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(12000!2,mul:0.2),12000) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(4)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 398.694570373, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(14000!2,mul:0.2),14000) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(4)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 406.25116251, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(14000!2,mul:0.2),8000) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(4)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 409.878662358, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(8000!2,mul:0.2),8000) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(4)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 421.842693788, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(8000!2,mul:0.2),8000) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 433.371140998, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(8000!2,mul:0.2),8000) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(8))).lag(1/4);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 442.421269781, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(8000!2,mul:0.2),8000) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(8))).lag(1/8);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 453.605674662, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(8000!2,mul:0.2),8000) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(8))).lag(LFSaw.ar(1/4).exprange(0.001,1/2));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 462.216898132, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(8000!2,mul:0.2),8000) * ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/2));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 476.026681754, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(8000!2,mul:0.2),8000) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.75!4,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/2));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 488.275225748, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(8000!2,mul:0.2),8000) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.75!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/2));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 493.402130595, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(8000!2,mul:0.2),8000) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.15!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/2));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 500.380217411, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(8000!2,mul:0.2),8000) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/2));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 512.800459459, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(8000!2,mul:0.2),8000) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 612.904459757, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(800!2,mul:0.2),8000) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 620.747631562, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(800!2,mul:0.2),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 627.844593088, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(400!2,mul:0.2),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 629.509903329, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(440!2,mul:0.2),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 633.583207289, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(660!2,mul:0.2),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 638.506678957, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(2000!2,mul:0.2),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 680.193616697, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(20000!2,mul:0.2),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 684.292615755, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(2000!2,mul:0.2),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 687.905830851, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(1600!2,mul:0.2),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 688.71906429, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(16000!2,mul:0.2),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 696.060366497, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(15000!2,mul:0.2),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 700.641365152, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(14000!2,mul:0.2),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 706.234910611, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(14000!2,mul:0.7),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 711.9556553, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(16000!2,mul:0.7),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 724.546677163, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(16000!2,mul:0.8),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 737.754561858, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(17000!2,mul:0.8),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 744.534230994, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = [] ++ SinOsc.ar(75!2,mul:0.9) ++ HPF.ar(SinOsc.ar(14000!2,mul:0.8),80) ++ WhiteNoise.ar(0.2!2)* ToggleFF.ar(CoinGate.ar(0.95!8,Impulse.ar(8))).lag(LFSaw.ar(1/4/fib(8)).exprange(0.001,1/20));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 767.388431414, 'me', "thisProcess.stop;" ],
[ 828.982118765, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 846.433922458, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/4,(0..7)/7));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 849.192747598, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 863.039197312, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,2],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 876.920392445, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,2],[3,-3]),Impulse.ar(1/4,(0..7)/8));
 // sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 881.141970236, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,2],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 889.28260459, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 892.818352093, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 894.625694565, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/8,(0..7)/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 898.946166633, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 904.418531538, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.4)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 909.776956001, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 919.118629025, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var sig = LFPulse.ar(50!2) * EnvGen.ar(Env([0,1,0],[0.02,2.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 944.433317917, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = LFPulse.ar(50!2+(env*1000)) * EnvGen.ar(Env([0,1,0],[0.02,2.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 947.309501777, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = LFPulse.ar(50!2+(env*100)) * EnvGen.ar(Env([0,1,0],[0.02,2.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 954.253312495, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = LFPulse.ar(50!2+(env*10)) * EnvGen.ar(Env([0,1,0],[0.02,2.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 966.775778828, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = LFPulse.ar(50!2+(env*10)) * EnvGen.ar(Env([0,1,0],[0.02,4.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 972.870443753, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1,0],[0.02,4],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = LFPulse.ar(50!2+(env*10)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 983.966978396, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1,0],[0.02,4],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var sig = LFPulse.ar(50!2+(env*10)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 991.600846039, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1,0],[0.02,2],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var sig = LFPulse.ar(50!2+(env*10)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 995.3924768, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var sig = LFPulse.ar(50!2+(env*10)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1009.788426842, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env*10)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1020.034406803, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env*10)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1024.323950447, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env*10)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1030.326475658, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,100,0],[0.02,0.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1035.442549872, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,100,0],[0.02,0.15],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1041.984042554, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,100,0],[0.02,0.015],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1045.23613853, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1000,0],[0.02,0.015],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1050.720534305, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1000,0],[0.02,0.025],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1054.365453227, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1000,0],[0.02,0.045],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1059.036229854, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1000,0],[0.02,0.045],[3,-3]),Impulse.ar(1/8,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1069.455955331, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1000,0],[0.02,0.045],[3,-3]),Impulse.ar(1,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1077.85314676, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1000,0],[0.02,0.045],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1082.46292453, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1000,0],[0.02,0.045],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1087.782350131, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1000,0],[0.02,0.045],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1109.806754602, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,1000,0],[0.02,0.045],[3,-3]),CoinGate.ar(0.5,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1131.824416448, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,12000,0],[0.02,0.045],[3,-3]),CoinGate.ar(0.5,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1147.40393557, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000],0],[0.02,0.045],[3,-3]),CoinGate.ar(0.5,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1149.519693425, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.02,0.045],[3,-3]),CoinGate.ar(0.5,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1156.991308353, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.02,0.145],[3,-3]),CoinGate.ar(0.5,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1165.338557173, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.02,0.145],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1173.781579528, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.02,0.085],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,100+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1178.765503176, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.02,0.085],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,4+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1185.24741975, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.02,0.085],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1190.602959494, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.085],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1196.485879323, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0085],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1200.004509767, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,1.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1209.430712122, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1214.109155465, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1223.767053234, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1257.175257744, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1270.878310894, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1284.528984434, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1294.642730201, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75,2]/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1337.882845857, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/8)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1340.136492004, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1346.618718287, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1351.092804612, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.02,0.025],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1354.554984735, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.002,0.025],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1359.650545885, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.002,0.125],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1367.859347418, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1380.971741511, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFPulse.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1390.869624474, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFPulse.ar(75!2+(env)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1408.026181092, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFPulse.ar(75!2+(env)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1412.397413979, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFPulse.ar(75!2+(env)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1423.973029868, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFPulse.ar(75!2+(env)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1449.18798444, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = SinOsc.ar(75!2+(env)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1456.414621564, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(75!2+(env)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1462.485040669, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2+(env)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1472.524330669, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1484.148516193, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[12000,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1499.869331009, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[1200,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1506.565497789, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[1200,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + Pulse.ar(env) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1524.000136899, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[1200,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + VarSaw.ar(env) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1536.123721436, 'me', "(
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[1200,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1543.437768771, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[1200,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/[1,2,4,8]) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1554.728381427, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[1200,200,1000,20],0],[0.002,0.0285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1563.614047174, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[1200,200,1000,20],0],[0.002,0.285],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1573.593020575, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[1200,200,1000,20],0],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1575.934078939, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[1200,200,1000,20],0],[0.02,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1582.674136106, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([0,[1200,200,1000,20],0],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1589.42154578, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[1200,200,1000,20],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1595.574258305, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[1200,200,1000,200],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1599.417225408, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[1200,200],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1602.879075492, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,200],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1605.371262903, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1615.155336413, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1618.32623702, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env/(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1627.353582072, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env*(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1639.7843259, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env*(1..8)/1.5) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1644.506404192, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env*(1..8)/1.25) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1650.906822102, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env*(1..8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1682.012232774, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env*(1..8)/8) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1690.743363443, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1714.996201595, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1731.924980701, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,15000],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1740.170139347, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1748.834849339, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1753.248625638, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1763.444550285, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  //sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1775.605775125, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,6+((1..8)/8),mul:0.3)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1786.061420308, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1803.248309138, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1811.861338408, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],50],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1822.328929101, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],500],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1848.893067802, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],500*mod],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1880.928265319, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432/(mod*pi)],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1882.993881005, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],4320/(mod*pi)],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1897.919508356, 'me', "(
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],4320/(mod*2pi)],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1911.696615525, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],4320/(mod*[1,2,4,8]*pi)],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1936.004481397, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],4320],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1941.073394024, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1951.282802014, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,2,4,8]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1957.934609469, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[1,1.5,2,4,8]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1962.639625627, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[1,1.5,2,4,8,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1990.861313852, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,2,4,8,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 1995.736770037, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,2,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2005.025778432, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.75!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2035.915192062, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2040.516225952, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2056.443048668, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),CoinGate.ar(0.5,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2069.037642006, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2088.243831988, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:0.5) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2117.048856407, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,LFSaw.ar(1/4).exprange(0.001,0.8)) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2131.470400839, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.ar(1/4).exprange(0.001,0.8)) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2138.76513995, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.001,0.8)) + SinOsc.ar(env,mul:LFDNoise1.ar(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2142.693171488, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.001,0.8)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2153.273249645, 'me', "(
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(4).exprange(0.001,0.8)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2164.558307092, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1).exprange(0.001,0.8)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2177.75125601, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1).exprange(0.001,1)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2179.029957046, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.25!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1).exprange(0.01,1)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2191.94602392, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1).exprange(0.01,1)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2203.017450733, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1).exprange(0.01,1)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2212.414402383, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1).exprange(0.01,1)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2226.880801654, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2279.061535002, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.2!2)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2286.002479746, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.1!2)*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2289.457511824, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.1!2)*LFSaw.ar(1/4/fib(8)).exprange(0.00001,1));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2295.528829943, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.1!2)*Pulse.ar(1/4/fib(8)).exprange(0.00001,1));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2297.603125793, 'me', "thisProcess.stop;" ],
[ 2305.792980282, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(1/4/fib(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2317.679534579, 'me', "(
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.001!2)*Pulse.ar(4/fib(8)));
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2326.511803306, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.001!2)*Pulse.ar(4/fib(8)).softclip );
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2328.796603436, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],432*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(4/fib(8)).softclip );
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2341.241568393, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(4/fib(8)).softclip );
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2351.561600343, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*2*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(4/fib(8)).softclip );
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2359.94189282, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*4*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(4/fib(8)).softclip );
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2368.222156552, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(4/fib(8)).softclip );
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2375.01076066, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,16]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(4/fib(8)).softclip );
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2382.949442692, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,16*1.5]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(4/fib(8)).softclip );
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2396.887608403, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(4/fib(8)).softclip );
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2412.703080968, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2421.967114855, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2425.937663616, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2453.465700038, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.15,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2458.605564204, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.5,0.15,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2468.966228144, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.15,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2482.06236686, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.15,SinOsc.kr(4/fib(8)));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2485.774157739, 'me', "thisProcess.stop;" ],
[ 2488.696902862, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.05,SinOsc.kr(4/fib(8)));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2492.631135808, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.05,SinOsc.kr(4/fib(4)));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2504.282346678, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.05,SinOsc.kr([1,3]));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2508.080339268, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.05,SinOsc.kr([1.1,3]));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2517.502994494, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.05,SinOsc.kr(11));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2527.707776574, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.05,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2530.056996506, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.05,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2541.571774635, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([50,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2557.022478667, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([432,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2564.103422427, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2567.533670302, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([10000,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2574.590879789, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([1000,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2584.26441003, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,2500,2000,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2593.362243736, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,2500,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2594.902820321, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2604.507209861, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.1485],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2618.650195154, 'me', "(
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(1/4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2623.861243583, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2629.112250965, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(8).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2633.589916101, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(11).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2640.878416749, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(4).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2642.820305882, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.6)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2645.523053026, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2648.674030509, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.3)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2656.863764685, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.3)+(sig*0.5);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2676.825433886, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = GVerb.ar(sig,10+((1..8)/8),mul:0.5)+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2690.301975559, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),2000)+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2695.920122239, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),200)+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2701.36726968, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),200)+(sig*LFSaw.ar(4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2707.806088782, 'me', "(
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),200)+(sig*LFSaw.ar(4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2718.64080251, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),200)+(sig*LFSaw.ar(4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2726.250610981, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),200)+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2749.645583845, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2760.450928, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/2,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/2,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2777.684181593, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,0.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2782.102245901, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2810.316630868, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2819.584856386, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2824.781534744, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = LPF.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),LFSaw.ar(1/8/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2831.050489371, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = LPF.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),LFSaw.ar(1/8/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/8/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2842.698257608, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = LPF.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),LFSaw.ar(1/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2851.702744411, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = LPF.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),LFSaw.ar(1/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1/4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2857.022384266, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = BPF.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),LFSaw.ar(1/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1/4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2862.017150838, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = Resonz.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),LFSaw.ar(1/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1/4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2872.463976529, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = Resonz.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),LFSaw.ar(1/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(1/4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 2882.219834419, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = Resonz.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),LFSaw.ar(1/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 3012.753803038, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  4.do{|i|
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8+i),mul:0.5),LFSaw.ar(1/4+i/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = Resonz.ar(GVerb.ar(sig,10+((1..8)/8+i),mul:0.5),LFSaw.ar(1+i/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(4/fib(8)).exprange(0.001,1));
      };
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 3016.404607295, 'me', "thisProcess.stop;" ],
[ 3019.825689141, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  2.do{|i|
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8+i),mul:0.5),LFSaw.ar(1/4+i/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4+i/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = Resonz.ar(GVerb.ar(sig,10+((1..8)/8+i),mul:0.5),LFSaw.ar(1+i/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(4+i/fib(8)).exprange(0.001,1));
      };
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 3026.372505684, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  2.do{|i|
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8+i),mul:0.5),LFSaw.ar(1/4+i/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4+i/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = Resonz.ar(GVerb.ar(sig,10+((1..8)/8+i),mul:0.5),LFSaw.ar(1+i/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(4+i/fib(8)).exprange(0.001,1));
      };
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
[ 3040.912229596, 'me', "(
~coin.quant=2;
~coin.fadeTime=2;
~coin={
  var mod = Duty.kr(4,0,Dseq([1,1.5,1.25,2],inf));
  var env = EnvGen.ar(Env([0.01,[400,250,250,200,1500],43.2*[4,8,2,3]*[1,1.5,mod*1.5,4,mod]],[0.002,0.0885],[3,-3]),CoinGate.ar(0.5!8,Impulse.ar(1/4,(0..7)++[0.5,0.75]/4)));
  var sig = LFSaw.ar(50!2,mul:LFSaw.kr(2).exprange(0.01,0.56)) + SinOsc.ar(env,mul:LFDNoise1.kr(1!8)) * EnvGen.ar(Env([0,1,0],[0.002,1.75],[3,-3]),CoinGate.ar(0.75,Impulse.ar(1/4,(0..7)++[0.25,0.5,0.75]/8)));
  sig = sig + (WhiteNoise.ar(0.01!2)*Pulse.ar(2/fib(8)).softclip);
  sig = LPF.ar(GVerb.ar(sig,100+((1..8)/8),mul:0.5),LFSaw.ar(1/4/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
  sig = sig * Pulse.ar(4);
  sig = Resonz.ar(GVerb.ar(sig,10+((1..8)/8),mul:0.5),LFSaw.ar(1/fib(8)).exprange(100.001,10000))+(sig*LFSaw.ar(4/fib(8)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.25,SinOsc.kr(4));
};
m.addMix(~coin,postVol:true);
~coin.play;
);" ],
];