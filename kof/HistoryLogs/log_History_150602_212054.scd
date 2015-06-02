// History, as it was on Tue Jun  2 21:20:54 2015.

[
[ 0, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
m.addMix(~test,postVol:true);
);" ],
[ 18.243919006, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).range(0,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
m.addMix(~test,postVol:true);
);" ],
[ 30.208297916, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.01,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
m.addMix(~test,postVol:true);
);" ],
[ 32.430382474, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(4).exprange(0.01,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~test.play;
m.addMix(~test,postVol:true);
);" ],
[ 38.140906315, 'me', "~test.stop(7);" ],
];