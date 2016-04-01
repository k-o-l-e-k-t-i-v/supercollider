// History, as it was on Wed Jun  3 03:18:26 2015.

[
[ 0, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 15.477249965, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50!2 + (LFSaw.ar(44).exprange(0.001,44)));
  sig = sig * LFSaw.ar(1).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 86.599365927, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000!2);
  sig = sig * LFSaw.ar(44).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 144.059729837, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/(1..8));
  sig = sig * LFSaw.ar(44).exprange(0.001,1);
  sig= sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 155.864757815, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/(1..8));
  sig = sig * LFSaw.ar(44).exprange(0.001,1);
  sig= sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 189.36836608, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/(1..8));
  sig = sig * LFSaw.ar(44).exprange(0.001,1);
  sig= sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(440.001,14441));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 195.973289454, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/(1..8));
  sig = sig * LFSaw.ar(44).exprange(0.001,1);
  sig= sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(440.001,14441));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 203.858240279, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/(1..8));
  sig = sig * LFSaw.ar(44/fib(8)).exprange(0.001,1);
  sig= sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(440.001,14441));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 207.215912239, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/(1..8));
  sig = sig * LFSaw.ar(44/fib(4)).exprange(0.001,1);
  sig= sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(440.001,14441));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 212.709786527, 'me', "(
~two.quant=2;
~two.fadeTime=2;
~two={
  var sig = LFSaw.ar(5000/(1..8));
  sig = sig * LFSaw.ar(44/fib(4)).exprange(0.001,1);
  sig= sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(440.001,14441));
  Splay.ar(sig.flat,0.25,1);
};
m.addMix(~two,postVol:true);
~two.play;
);" ],
[ 250.597265864, 'me', "(
~reverb.quant=2;
~reverb.fadeTime=2;
~reverb={
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.2);
};
~reverb.play;
);" ],
[ 262.608944845, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(150!2 + (LFSaw.ar(44).exprange(0.001,44)));
  sig = sig * LFSaw.ar(1).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 289.165535665, 'me', "m.stop(10)" ],
[ 298.378288676, 'me', "s.stop(10)" ],
[ 305.228897435, 'me', "~reverb.stop(7);" ],
[ 306.4919324, 'me', "~two.stop(7);" ],
[ 308.582623677, 'me', "~one.stop(7);" ],
];