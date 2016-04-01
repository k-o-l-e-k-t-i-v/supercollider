// History, as it was on Tue Jun  2 23:06:20 2015.

[
[ 0, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = SinOsc.ar(444/((_*2!8)+2));
  sig = sig * Decay.ar(Impulse.ar(1/fib(8),(0..7)/8),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 21.27046951, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = SinOsc.ar(444/((_*2!8)+2));
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 32.055493307, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = SinOsc.ar(444*((_*2!8)+2));
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 41.863104587, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = SinOsc.ar(44.4*((_*2!8)+2));
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 53.063459284, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = SinOsc.ar(44.4*((_*2!8)+2));
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 62.832435811, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = SinOsc.ar(44.4*((_*2!8)+2)*1.5);
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 73.264466729, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = SinOsc.ar(44.4*((_*2!8)+2)*1.25);
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 82.382225969, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = SinOsc.ar(44.4*((_*2!8)+2)*1.75);
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 89.396999516, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = SinOsc.ar(44.4*((_*2!8)+2)*1.125);
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 93.910365211, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = SinOsc.ar(44.4*((_*2!8)+2)*1);
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 110.975663884, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = Blip.ar(44.4*((_*2!8)+2)*1,[2,3,4,5,6,7,8,9]);
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 121.080863931, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = Blip.ar(44.4*((_*2!8)+2)*1,[2,3,4,5,6,7,8,9]*2);
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 136.662103371, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = Blip.ar(44.4*((_*2!8)+2)*1,[2,3,4,5,6,7,8,9]*LFSaw.ar(1).range(1,4));
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 145.127291114, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = Blip.ar(44.4*((_*2!8)+2)*1,[2,3,4,5,6,7,8,9]*LFSaw.ar(4).range(1,4));
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 150.086965885, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = Blip.ar(44.4*((_*2!8)+2)*1,[2,3,4,5,6,7,8,9]*LFSaw.ar(4).exprange(1.01,4));
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 152.311716188, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = Blip.ar(44.4*((_*2!8)+2)*1,[2,3,4,5,6,7,8,9]*LFSaw.ar(1/4).exprange(1.01,4));
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 158.10935216, 'me', "(
~nofun.quant=2;
~nofun.fadeTime=2;
~nofun={
  var sig = Blip.ar(44.4*((_*2!8)+2)*1,[2,3,4,5,6,7,8,9]*LFSaw.ar(1/4/fib(8)).exprange(1.01,4));
  sig = sig * Decay.ar(Impulse.ar(2/fib(8),(0..7)/8),2);
  Splay.ar(sig.flat,0.25,0.5);
};
~nofun.play;
m.addMix(~nofun,postVol:true);
);" ],
[ 195.010536186, 'me', "~nofun.stop(60);" ],
];