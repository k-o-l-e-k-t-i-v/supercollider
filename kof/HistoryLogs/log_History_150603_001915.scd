// History, as it was on Wed Jun  3 00:19:15 2015.

[
[ 0, 'me', "(
  p=ProxySpace.push(s.reboot);
  m=ProxySubmix.new(\\filter);
);" ],
[ 13.960587948, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]);
  sig = Select.ar(LFSaw.ar(1).exprange(0.0001,sig.size),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 28.852931724, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]) ++ WhiteNoise.ar(0.2!2);
  sig = Select.ar(LFSaw.ar(1).exprange(0.0001,sig.size),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 36.702826432, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]) ++ WhiteNoise.ar(0.2!2);
  sig = Select.ar(LFSaw.ar(1).exprange(0.0001,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 41.563608091, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]) ++ WhiteNoise.ar(0.4!2);
  sig = Select.ar(LFSaw.ar(1).exprange(0.0001,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 43.25625244, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]) ++ WhiteNoise.ar(0.4!2);
  sig = Select.ar(LFSaw.ar(1).exprange(0.001,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 45.519833835, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]) ++ WhiteNoise.ar(0.4!2);
  sig = Select.ar(LFSaw.ar(1).exprange(0.01,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 50.375109185, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]) ++ WhiteNoise.ar(0.4!2);
  sig = Select.ar(LFSaw.ar(1).range(0.01,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 53.307777028, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/2) ++ WhiteNoise.ar(0.4!2);
  sig = Select.ar(LFSaw.ar(1).range(0.01,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 59.650230864, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.5) ++ WhiteNoise.ar(0.4!2);
  sig = Select.ar(LFSaw.ar(1).range(0.01,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 67.022889151, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.5) ++ WhiteNoise.ar(0.4!2);
  sig = Select.ar(LFSaw.ar(2).range(0.01,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 72.703221232, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.5) ++ WhiteNoise.ar(0.4!2);
  sig = Select.ar(LFSaw.ar(4).range(0.01,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 76.61734192, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.5) ++ WhiteNoise.ar(0.4!2);
  sig = Select.ar(LFSaw.ar(44).range(0.01,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 83.675433923, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.5) ++ WhiteNoise.ar(0.4!2);
  sig = Select.ar(LFSaw.ar(1/4/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 94.338334851, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.5) ++ WhiteNoise.ar(0.4!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/4/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 106.37309627, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.5) ++ WhiteNoise.ar(0.4!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 113.761316735, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.25) ++ WhiteNoise.ar(0.4!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 117.763264703, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.25) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 150.956848671, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.25) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).range(44,14444));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 161.084168788, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.25) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(44.001,14444));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 164.506325916, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.25) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(44.001,4444));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 177.992657264, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.25) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(44.001,4444))+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 189.763669912, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.25) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(44.001,4444));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 195.1662058, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.25) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(4)).exprange(44.001,4444));

  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 207.978562349, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.25) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(4)).exprange(44.001,4444));
  GVerb.ar(sig,10,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 212.517044562, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.25) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(4)).exprange(44.001,4444));
  sig = GVerb.ar(sig,10,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 226.219238035, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.1);
};
~fil.play;
);" ],
[ 230.456340299, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.4);
};
~fil.play;
);" ],
[ 243.69329496, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.25) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(4)).exprange(44.001,4444));
  sig = GVerb.ar(sig,4,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 248.664738017, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.5) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(4)).exprange(44.001,4444));
  sig = GVerb.ar(sig,4,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 254.164269961, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.75) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(75!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(4)).exprange(44.001,4444));
  sig = GVerb.ar(sig,4,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 260.558116527, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.75) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(90!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(4)).exprange(44.001,4444));
  sig = GVerb.ar(sig,4,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 264.465269948, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*[1,10,20,40]/1.75) ++ WhiteNoise.ar(0.5!2) ++ SinOsc.ar(100!2);
  sig = Select.ar(LFSaw.ar(1/fib(8)).range(0.01,sig.size+0.1),sig)!2;
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(4)).exprange(44.001,4444));
  sig = GVerb.ar(sig,4,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 270.029933735, 'me', "~fil.stop(7);" ],
[ 271.71036929, 'me', "~one.stop(20);" ],
];