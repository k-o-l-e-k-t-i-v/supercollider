// History, as it was on Wed Jun 10 09:02:15 2015.

[
[ 0, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 12.809537502, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 22.832521056, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50*(1.0001**(1..8)));
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 29.951678067, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(50*(1.0001**(1..8)));
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 32.867053207, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)));
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 38.500255322, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)));
  sig = sig * LFSaw.ar(8).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 58.751388223, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)));
  sig = sig * LFSaw.ar(8).exprange(0.001,1) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 66.428361842, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.01**(1..8)));
  sig = sig * LFSaw.ar(8).exprange(0.001,1) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 75.632600396, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.01**(1..8)));
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 90.765638099, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.01**(1..8)));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 100.066817483, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.1**(1..8)));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 108.96019823, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 121.053197602, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1.25]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 127.792503616, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1,1,1,1.25]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 137.5613788, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 143.260762706, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 155.041775129, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.1);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 168.263271453, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.1) ++ LFSaw.ar(4000,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 176.654763638, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.1) ++ LFSaw.ar(4000*[1,2],mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 183.74434542, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.1) ++ LFSaw.ar(4000*[1,2],mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 195.210584394, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(4000*[1,2],mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 233.887936177, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(4000*[1,2],mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4)));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 240.222556779, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(4000*[1,2],mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!4)));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 248.553313674, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(4000*[1,2],mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 270.422070989, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(4000*[1,2],mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 297.114008384, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(4000*[1,1.5],mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 317.90565958, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(4000*[0.5,0.25,1.25,1.5,1],mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 332.899318693, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(4000*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 378.914464319, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(2000,4000,Impulse.ar(1/4)).round(220)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 394.772657146, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(200,4000,Impulse.ar(1/4)).round(220)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 401.21049102, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(200.01,4000,Impulse.ar(1/4)).round(220)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 423.120649513, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.ar(200.01,4000,Impulse.ar(1/4)).round(220)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 428.374528416, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(200.01,4000,Impulse.kr(1/4)).round(220)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 449.410437661, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(200.01,4000,Impulse.kr(1/4)).round(440)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 454.202707468, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(200.01,4000,Impulse.kr(1/4)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 472.462107142, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(200.01,4000,Impulse.kr(1/4)).round(pi)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 484.120933604, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(200.01,4000,Impulse.kr(1/4!8)).round(8pi)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 496.38111826, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(200.01,4000,Impulse.kr(1/4!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 502.201678767, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(200.01,4000,Impulse.kr(1/4!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 518.680920229, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(200.01,4000,Impulse.kr(1/4!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 523.010741788, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(200.01,4000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 548.542754486, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(TExpRand.kr(2000.01,4000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 559.035461437, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ SinOsc.ar(TExpRand.kr(2000.01,4000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 564.428394028, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ SinOsc.ar(TExpRand.kr(2000.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 578.133520364, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ SinOsc.ar(SinOsc.ar(4).range(-10,10)+TExpRand.kr(2000.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 581.310224547, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ SinOsc.ar(SinOsc.ar(44).range(-10,10)+TExpRand.kr(2000.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 596.545566607, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(44).range(-10,10)+TExpRand.kr(2000.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 604.173384927, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4).range(-10,10)+TExpRand.kr(2000.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 621.691635244, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4).range(-4,4)+TExpRand.kr(2000.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 628.085684338, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(2000.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.1,4,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 637.516424391, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(2000.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)++0.5/8),TExpRand.kr(0.1,1,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 651.460650135, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(2000.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)++0.5/8),TExpRand.kr(0.2,1.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.1) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 657.008486352, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(2000.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)++0.5/8),TExpRand.kr(0.2,1.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 667.493615624, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)++0.5/8),TExpRand.kr(0.2,1.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 672.646413356, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,1.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 683.449451775, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,4.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 692.504002257, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,8.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 708.746975663, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = LFSaw.ar(75*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,8.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 721.157857786, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = LFSaw.ar(50*(1.0001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,8.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 722.732182968, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = LFSaw.ar(50*(1.001**(1..8)) * [1,1.5,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,8.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 728.554887689, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = LFSaw.ar(50*(1.001**(1..8)) * [1,1.25,1,1]) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,8.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 742.223474896, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = LFSaw.ar(50*(1.001**(1..8))++1.5) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,8.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 751.717837077, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = LFSaw.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,8.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 756.807010349, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = LFSaw.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.2,8.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 763.231583654, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = LFSaw.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.2,2.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 769.826336241, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,7000,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.2,2.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 801.310308868, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,700,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.2,2.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 815.955218596, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Impulse.kr(1/8!8)).round(432)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.2,2.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 841.428055276, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Impulse.kr(1/8!8)).round(432/4)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.2,2.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 854.753234711, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Impulse.kr(1/8!8)).round(432/2)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.2,2.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 867.766916542, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(4/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Impulse.kr(1/8!8)).round(432/2)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.3);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.2,2.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 882.161328559, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(11/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Impulse.kr(1/8!8)).round(432/2)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.3);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..7)++0.5/8),TExpRand.kr(0.2,2.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 898.348026902, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(11/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Impulse.kr(1/8!8)).round(432/2)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.3);
  sig = sig * Decay.ar(Impulse.ar(1,(0..7)++0.5/8),TExpRand.kr(0.2,2.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 909.632343377, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(11/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Impulse.kr(1/8!8)).round(432/2)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.3);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,2.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 920.831573589, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(11/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Impulse.kr(1/8!8)).round(432/2pi)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.3);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,2.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 927.122533809, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(11/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Impulse.kr(1/8!8)).round(432/pi)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.3);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,2.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 933.201022422, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(11/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Impulse.kr(1/8!8)).round(432/pi)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.3);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,4.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 942.535440208, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(11/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Impulse.kr(1/8!8)).round(432/pi)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.3);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,4.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,100,mul:0.2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 944.676261641, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(11/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Impulse.kr(1/8!8)).round(432/pi)*[0.5,0.25,1.25,1.5,1].scramble,mul:0.3);
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..7)++0.5/8),TExpRand.kr(0.2,4.5,Impulse.kr(1/4!8)));
  sig = GVerb.ar(sig,100,mul:0.5) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 944.820966863, 'me', "(
~saw.quant=2;
~saw.fadeTime=4;
~saw={
  var sig = SinOsc.ar(50*((1.001**(1..8))++1.5)) ++ WhiteNoise.ar(0.2) ++ LFSaw.ar(SinOsc.ar(11/fib(8)).range(-4,4)+TExpRand.kr(200.01,1700,Im