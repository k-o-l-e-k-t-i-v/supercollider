// History, as it was on Wed Jun  3 02:04:39 2015.

[
[ 0, 'me', "(
  m=ProxySubmix.new(\\filter);
);" ],
[ 2.811890104, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = SinOsc.ar(72+(env*10)) * env;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 16.761483236, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = SinOsc.ar(72+(env*10)) * env;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 28.518465534, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.51],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = SinOsc.ar(72+(env*10)) * env;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 37.61840133, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.51],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var sig = SinOsc.ar(72+(env*10)) * env;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 46.393397378, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.51],[3,-3]),Impulse.ar(1/2,(0..3)++0.5/4));
  var sig = SinOsc.ar(72+(env*10)) * env;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 55.816857105, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.51],[3,-3]),Impulse.ar(1,(0..3)++0.5/4));
  var sig = SinOsc.ar(72+(env*10)) * env;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~test,postVol:true);
~test.play;
);" ],
[ 109.878893933, 'me', "(
~pink.quant=2;
~pink.fadeTime=2;
~pink={
  var sig = Blip.ar(4320) * EnvGen.ar(Env([0,1,0],[0.02,4],[3,-3]),Impulse.ar(1/16,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 120.822138626, 'me', "(
~pink.quant=2;
~pink.fadeTime=2;
~pink={
  var sig = Blip.ar(4320) * EnvGen.ar(Env([0,1,0],[0.02,4],[3,-3]),Impulse.ar(1/32,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 132.628100688, 'me', "(
~pink.quant=2;
~pink.fadeTime=2;
~pink={
  var sig = Blip.ar(4320,4) * EnvGen.ar(Env([0,1,0],[0.02,4],[3,-3]),Impulse.ar(1/32,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 141.743920034, 'me', "(
~pink.quant=2;
~pink.fadeTime=2;
~pink={
  var sig = Blip.ar(4320,10) * EnvGen.ar(Env([0,1,0],[0.02,4],[3,-3]),Impulse.ar(1/32,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 181.796443865, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/8).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 192.154442214, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/8).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.015);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 197.364518237, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/8).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.045);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 213.476926636, 'me', "(
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
[ 301.75815849, 'me', "(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = sig * LFSaw.ar(1/[8,16]).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.045);
};
m.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 376.331433035, 'me', "(
~reverb.quant=2;
~reverb.fadeTime=2;
~reverb={
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.4);
};
~reverb.play;
);" ],
[ 388.71185127, 'me', "(
~reverb.quant=2;
~reverb.fadeTime=2;
~reverb={
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.7);
};
~reverb.play;
);" ],
[ 406.789317087, 'me', "~test.stop(7);" ],
[ 412.733452403, 'me', "~hiss.stop(7);" ],
[ 413.949668651, 'me', "~pink.stop(7);" ],
[ 415.106092, 'me', "~saw.stop(7);" ],
[ 418.468641694, 'me', "~reverb.stop(7);" ],
];
