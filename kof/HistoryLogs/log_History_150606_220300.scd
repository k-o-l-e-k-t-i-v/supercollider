// History, as it was on Sat Jun  6 22:03:00 2015.

[
[ 0, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(LFSaw.ar(1/600).exprange(0.001,1));
  sig = sig;
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 25.822465265, 'me', "thisProcess.stop;" ],
[ 47.863547553, 'me', "thisProcess.stop;" ],
[ 57.74921546, 'me', "thisProcess.stop;" ],
[ 58.250466925, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(LFSaw.ar(1/600).exprange(1.001,22000));
  sig = sig;
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 79.37722399, 'me', "thisProcess.stop;" ],
[ 83.020503266, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(LFSaw.ar(1/6000).exprange(1.001,22000));
  sig = sig;
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 86.929994317, 'me', "thisProcess.stop;" ],
[ 103.669944009, 'me', "thisProcess.stop;" ],
[ 104.338940242, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(LFSaw.ar(1/60).exprange(1.001,22000));
  sig = sig;
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 110.007378844, 'me', "thisProcess.stop;" ],
[ 125.891851344, 'me', "thisProcess.stop;" ],
[ 126.65348755, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(Line.ar(0,1,60).exprange(1.001,22000));
  sig = sig;
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 130.432161547, 'me', "thisProcess.stop;" ],
[ 134.263509454, 'me', "thisProcess.stop;" ],
[ 134.858005617, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(Line.ar(0,1,600).exprange(1.001,22000));
  sig = sig;
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 165.693787363, 'me', "thisProcess.stop;" ],
[ 166.117210357, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(Line.ar(0,1,600));
  sig = sig;
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 173.283128713, 'me', "thisProcess.stop;" ],
[ 173.548569744, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(Line.ar(1,22000,600));
  sig = sig;
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 180.76209397, 'me', "thisProcess.stop;" ],
[ 181.123758702, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(Line.ar(1,22000,6000));
  sig = sig;
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 193.73781984, 'me', "thisProcess.stop;" ],
[ 194.018775019, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(Line.ar(1,22000,60000));
  sig = sig;
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 207.429824528, 'me', "thisProcess.stop;" ],
[ 210.455469701, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(Line.ar(1,22000,6000));
  sig = sig;
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 212.800041857, 'me', "thisProcess.stop;" ],
[ 213.289872021, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(Line.ar(1,22000,6000));
  sig = sig;
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 222.875346904, 'me', "thisProcess.stop;" ],
[ 231.022452098, 'me', "thisProcess.stop;" ],
[ 231.362241181, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(Line.ar(1,22000,6000));
  sig = GVerb.ar(sig,10);
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 238.998643493, 'me', "thisProcess.stop;" ],
[ 248.054352267, 'me', "thisProcess.stop;" ],
[ 248.371932948, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(Line.ar(1,22000,6000)).clip(-0.5,0.5);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig,0.25,0.5);
};
m.addMix(~pls,postVol:true);
~pls.play;
);" ],
[ 295.344846614, 'me', "thisProcess.stop;" ],
[ 295.635143619, 'me', "(
~pls.quant=2;
~pls.fadeTime=2;
~pls={
  var sig = LFPulse.ar(Line.ar(1,22000,6)).clip(-0.5,0.5);
  sig = GVerb.ar(sig,10);
  Splay.ar(sig,0.25,0.