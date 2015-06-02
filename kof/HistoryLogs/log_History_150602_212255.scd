// History, as it was on Tue Jun  2 21:22:55 2015.

[
[ 0, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=2;
~lalala={
  var sig = LFSaw.ar(5000/fib(12));
  sig = sig * SinOsc.ar(1/2/fib(12)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lalala.play;
m.addMix(~lalala,postVol:true);
);" ],
[ 17.242773109, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=2;
~lalala={
  var sig = LFSaw.ar(5000/(fib(12)/8pi));
  sig = sig * SinOsc.ar(1/2/fib(12)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lalala.play;
m.addMix(~lalala,postVol:true);
);" ],
[ 23.129879094, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=2;
~lalala={
  var sig = LFSaw.ar(5000/(fib(12)/2pi));
  sig = sig * SinOsc.ar(1/2/fib(12)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lalala.play;
m.addMix(~lalala,postVol:true);
);" ],
[ 27.623134918, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=2;
~lalala={
  var sig = LFSaw.ar(500/(fib(12)/2pi));
  sig = sig * SinOsc.ar(1/2/fib(12)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lalala.play;
m.addMix(~lalala,postVol:true);
);" ],
[ 48.531383235, 'me', "~lalala.stop(10);" ],
];