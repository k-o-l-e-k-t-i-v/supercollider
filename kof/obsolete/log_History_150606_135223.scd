// History, as it was on Sat Jun  6 13:52:23 2015.

[
[ 0, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000+[10,20,40,80]);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 45.775872217, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000+([10,20,40,80]*LFSaw.ar(1/4).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 53.235291598, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000+([10,20,40,800]*LFSaw.ar(1/4).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 60.742344166, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000+([10,20,400,800]*LFSaw.ar(1/4).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 66.192794996, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000+([100,200,400,800]*LFSaw.ar(1/4).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 76.702238973, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000+([100,200,400,800]*LFSaw.ar(1/4).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 96.614902984, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000/[1,1.25,1.5,1.125]+([100,200,400,800]*LFSaw.ar(1/4).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 106.772549798, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000/[1,1.25,1.5,1.125]+([100,200,400,800]*LFSaw.ar(4).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 114.320961199, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000/[1,1.25,1.5,1.125]+([100,200,400,800]*LFSaw.ar(4).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 119.577109167, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000/[1,1.25,1.5,1.125]+([100,200,400,800]*LFSaw.ar(44).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 124.482868383, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000/[1,1.25,1.5,1.125]+([100,200,400,800]*LFSaw.ar(11).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 130.61213883, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000/[1,1.25,1.5,1.125]+([100,200,400,800]*LFSaw.ar(11).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(11).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 146.090618522, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000/[1,1.25,1.5,1.125]+([100,200,400,800]*LFSaw.ar(11).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(11).exprange(0.001,1) * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 156.199138843, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000/[1,1.25,1.5,1.125]+([100,200,400,800]*LFSaw.ar(11).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(11).exprange(0.001,1) * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 161.637850776, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000/[1,1.25,1.5,1.125]+([100,200,400,800]*LFSaw.ar(11).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(44).exprange(0.001,1) * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 168.385669927, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000/[1,1.25,1.5,1.125]+([100,200,400,800]*LFSaw.ar(11).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1) * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 176.676066011, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000/[1,1.25,1.5,1.125]+([100,200,400,800]*LFSaw.ar(111).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1) * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 184.684071814, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4000/[1,1.25,1.5,1.125]+([100,200,400,800]*LFSaw.ar(1).exprange(0.001,1) ));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1) * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 223.868104507, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 249.156482212, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]) * Decay.ar(Impulse.ar(1/4,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 266.225786706, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 273.028281293, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*1.5) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 276.888275889, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*1.25) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 280.908089356, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*1.5) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 285.102922299, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*1.125) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 289.955678437, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*1.1125) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 294.017731056, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*1.25) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 297.400180016, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*1.5) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 300.167837068, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*1.75) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 306.276828581, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*2) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 311.970513397, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*[1,1.5]) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 317.510855782, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*[1,1.25]) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 322.633618545, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*[1,1.5]) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 330.074108634, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4]*[1,1.5]) * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 341.835861892, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*[1,1.5]) * Decay.ar(Impulse.ar(2,(0..3)/4),0.5);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 345.755728171, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*[1,1.25]) * Decay.ar(Impulse.ar(2,(0..3)/4),0.5);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 349.014630795, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*[1,2]) * Decay.ar(Impulse.ar(2,(0..3)/4),0.5);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 352.657727923, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*[1,4]) * Decay.ar(Impulse.ar(2,(0..3)/4),0.5);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 354.495074028, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*[1,2]) * Decay.ar(Impulse.ar(2,(0..3)/4),0.5);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 355.940062693, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(432*[1,2,4,8]*[1,1.5]) * Decay.ar(Impulse.ar(2,(0..3)/4),0.5);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 363.476211394, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]*[1,1.5]) * Decay.ar(Impulse.ar(2,(0..3)/4),0.5);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 371.840207596, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]*[1,1.5]) * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.5);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 377.952957093, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]*[1,1.5]) * Decay.ar(Impulse.ar(1/2,(0..3)/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 386.978231636, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]*[1,1.25]) * Decay.ar(Impulse.ar(1/2,(0..3)/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 393.220762072, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]*[1,1.125]) * Decay.ar(Impulse.ar(1/2,(0..3)/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 417.947067775, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]*[1,1.125]) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 422.424014178, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]*[1,1.125]) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 433.62839969, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]*[1,1.125]/pi) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 438.354303178, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]*[1,1.125]) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 444.669065666, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]*([1,1.125]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 448.772219166, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]*([1,1.25]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 452.769204009, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]/([1,1.25]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 459.924039985, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]/([1,1.5]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 468.316273966, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var sig = SinOsc.ar(4320/[1,2,4,8]/([1,1.25]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 491.648339064, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod = Duty.kr(4,0,Dseq([1,1.25],inf));
  var sig = SinOsc.ar(4320/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 508.086734679, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod = Duty.kr(4,0,Dseq([1.5,1.25],inf));
  var sig = SinOsc.ar(4320/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 518.857039317, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod = Duty.kr(4,0,Dseq([1.5,1.25,1.125,2],inf));
  var sig = SinOsc.ar(4320/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 538.490699055, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod = Duty.kr(4,0,Dseq([1.5,1.25,1.125,0.75,0.5],inf));
  var sig = SinOsc.ar(4320/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 590.998887016, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod = Duty.kr(1,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 597.291782398, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod = Duty.kr(2,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 609.674396093, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 724.711269604, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod = Duty.kr(1,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 731.106845408, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 737.622582256, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 741.155346661, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*1.5/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 746.806461958, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*1.25/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 764.841004262, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 771.062147069, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(4,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 796.739325324, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(4,0,Dseq([1.5,1.25,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 799.374458085, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/4,0,Dseq([1.5,1.25,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 812.799867802, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1.5,1.25,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 827.402950374, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/16,0,Dseq([1.5,1.25,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 846.198393243, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1.5,1.25,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 866.310981653, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1.5,2,4],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 869.446181842, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,1.5,2,4],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 873.14507035, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,1.5,2,0.5],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 879.230461282, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.5],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 899.86478061, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 933.035153452, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(43.2)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 942.901368484, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75,mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 957.716544519, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75*Decay.ar(Impulse.ar(1,(0..3)/4),1),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 970.51184648, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(4*Decay.ar(Impulse.ar(1,(0..3)/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 978.468248739, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(8*Decay.ar(Impulse.ar(1,(0..3)/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 995.15234468, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1012.839323632, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1024.697532874, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.1)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1077.779357739, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(4320*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1090.559866675, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(432*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1104.793254029, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = LFSaw.ar(432*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1117.014055707, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = LFSaw.ar([72,69].midicps*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1143.343938304, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = LFSaw.ar([72,65].midicps*4*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1150.036787293, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar([72,65].midicps*4*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1169.637072434, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
~harp={
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar([72,63].midicps*4*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1209.972769833, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(notes.midicps*4*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1239.916693497, 'me', "~harp.set(\\notes,[72,65]);" ],
[ 1246.370426097, 'me', "~harp.set(\\notes,[72,63]);" ],
[ 1250.666280144, 'me', "~harp.set(\\notes,[72,67]);" ],
[ 1254.858682064, 'me', "~harp.set(\\notes,[72-7,67]);" ],
[ 1259.53081953, 'me', "~harp.set(\\notes,[72-7,65]);" ],
[ 1263.521055667, 'me', "~harp.set(\\notes,[72-7,69]);" ],
[ 1275.560829984, 'me', "~harp.set(\\notes,[72-7,63,65,67]);" ],
[ 1283.220340528, 'me', "~harp.set(\\notes,[72,63,65,67]);" ],
[ 1296.28568056, 'me', "~harp.set(\\notes,[72,63,65]);" ],
[ 1303.005490453, 'me', "~harp.set(\\notes,[72,63,69]);" ],
[ 1308.183571576, 'me', "~harp.set(\\notes,[72,63,67]);" ],
[ 1311.410482033, 'me', "~harp.set(\\notes,[72,63,60]);" ],
[ 1318.063693813, 'me', "~harp.set(\\notes,[72,63,69]);" ],
[ 1320.094449809, 'me', "~harp.set(\\notes,[72,63]);" ],
[ 1321.985369487, 'me', "~harp.set(\\notes,[72,60]);" ],
[ 1328.36843409, 'me', "~harp.set(\\notes,[72,60,36]);" ],
[ 1340.37154897, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.1)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1356.824483061, 'me', "~harp.set(\\notes,[72,60]+12);" ],
[ 1359.260895737, 'me', "~harp.set(\\notes,[72,60]+24);" ],
[ 1362.624443576, 'me', "~harp.set(\\notes,[72,60]-12);" ],
[ 1377.149902246, 'me', "~harp.set(\\notes,[72,60]);" ],
[ 1380.044412115, 'me', "~harp.set(\\notes,[72,60]+24);" ],
[ 1391.748118536, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1423.750024126, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (WhiteNoise.ar(0.2!2) * Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1433.588884712, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (WhiteNoise.ar(0.2!2) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1448.581135211, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),2000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1455.213287823, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1465.132574411, 'me', "~harp.set(\\notes,[72,60]+12);" ],
[ 1469.905045759, 'me', "~harp.set(\\notes,[72,60]);" ],
[ 1489.768178313, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = SinOsc.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (LFSaw.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1499.311615515, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = VarSaw.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1519.492988943, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = VarSaw.ar(notes.midicps*4*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1581.716569905, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = VarSaw.ar(notes.midicps*1.5*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1629.705118393, 'me', "~harp.set(\\notes,[72,60]+12);" ],
[ 1634.353643813, 'me', "~harp.set(\\notes,[72,63]+12);" ],
[ 1640.659133344, 'me', "~harp.set(\\notes,[72,67]+12);" ],
[ 1718.559049688, 'me', "t=Task({~harp.set(\\notes,{[72,67,65,63,69].choose+12}!2);1});" ],
[ 1733.026971069, 'me', "t.play(quant:2);" ],
[ 1774.287450445, 'me', "t=Task({~harp.set(\\notes,{[72,67,65,63,69].choose}!2);1});" ],
[ 1776.127064922, 'me', "t.play(quant:2);" ],
[ 1807.989813249, 'me', "t=Task({loop{~harp.set(\\notes,{[72,67,65,63,69].choose}!2);1.wait;}});" ],
[ 1814.431446965, 'me', "t.play(quant:2);" ],
[ 1820.010056184, 'me', "t=Task({loop{~harp.set(\\notes,{[72,67,65,63,69].choose}!2);4.wait;}});" ],
[ 1855.001377682, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
  var sig = VarSaw.ar(notes.midicps*4*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1870.50664108, 'me', "t=Task({loop{~harp.set(\\notes,{[72,67,65].choose}!2);4.wait;}});" ],
[ 1892.806562898, 'me', "thisProcess.stop;" ],
[ 1912.319774475, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*4*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.25,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1953.317772744, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*4*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1970.166270379, 'me', "thisProcess.stop;" ],
[ 1971.126965247, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,69]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*4*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 1974.476161157, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*4*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 2097.890100246, 'me', "thisProcess.stop;" ],
[ 3235.359146985, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*4*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3239.109944439, 'me', "thisProcess.stop;" ],
[ 3247.757579022, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = GVerb.ar(sig,mul:0.2)+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3401.873644623, 'me', "(
~kali.quant=2;
~kali.fadeTime=2;
~kali={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~kali,postVol:true);
~kali.play;
);" ],
[ 3413.503718684, 'me', "(
~kali.quant=2;
~kali.fadeTime=2;
~kali={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.1);
};
m.addMix(~kali,postVol:true);
~kali.play;
);" ],
[ 3419.717369141, 'me', "(
~kali.quant=2;
~kali.fadeTime=2;
~kali={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~kali,postVol:true);
~kali.play;
);" ],
[ 3424.866792055, 'me', "(
~kali.quant=2;
~kali.fadeTime=2;
~kali={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~kali,postVol:true);
~kali.play;
);" ],
[ 3435.695519397, 'me', "(
~te.quant=2;
~te.fadeTime=2;
~te={
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.1);
};
~te.play;
);" ],
[ 3446.302319624, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3463.12856587, 'me', "(
~te.quant=2;
~te.fadeTime=2;
~te={
  var sig = m.ar;
  sig = GVerb.ar(sig,10+(1/(1..8)));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.1);
};
~te.play;
);" ],
[ 3480.22488577, 'me', "(
~kali.quant=2;
~kali.fadeTime=2;
~kali={
  var sig = LFSaw.ar(50*[1,1.5,2]);
  sig = sig * LFSaw.ar(1).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~kali,postVol:true);
~kali.play;
);" ],
[ 3484.94997995, 'me', "(
~kali.quant=2;
~kali.fadeTime=2;
~kali={
  var sig = LFSaw.ar(50*[1,1.5,2]);
  sig = sig * LFSaw.ar(1/[1,2,3]).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~kali,postVol:true);
~kali.play;
);" ],
[ 3494.659750976, 'me', "(
~kali.quant=2;
~kali.fadeTime=2;
~kali={
  var sig = LFSaw.ar(50*[1,1.5,2]);
  sig = sig * LFSaw.ar(1/[1,2]).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~kali,postVol:true);
~kali.play;
);" ],
[ 3496.40643537, 'me', "(
~kali.quant=2;
~kali.fadeTime=2;
~kali={
  var sig = LFSaw.ar(50*[1,2]);
  sig = sig * LFSaw.ar(1/[1,2]).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~kali,postVol:true);
~kali.play;
);" ],
[ 3533.031876491, 'me', "(
~kali.quant=2;
~kali.fadeTime=2;
~kali={
  var sig = LFPulse.ar(50*[1,2]);
  sig = sig * LFSaw.ar(1/[1,2]).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~kali,postVol:true);
~kali.play;
);" ],
[ 3548.610077873, 'me', "(
~kali.quant=2;
~kali.fadeTime=2;
~kali={
  var sig = LFPulse.ar(50*[1,2]);
  sig = sig * LFSaw.ar(1/4/[1,2]).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~kali,postVol:true);
~kali.play;
);" ],
[ 3575.460231462, 'me', "(
~te.quant=2;
~te.fadeTime=2;
~te={
  var sig = m.ar;
  sig = GVerb.ar(sig,10+(1/(1..8)));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.2);
};
~te.play;
);" ],
[ 3580.120473604, 'me', "(
~te.quant=2;
~te.fadeTime=2;
~te={
  var sig = m.ar;
  sig = GVerb.ar(sig,10+(1/(1..8)));
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.4);
};
~te.play;
);" ],
[ 3593.221174682, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3614.008978872, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*4*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3649.017060877, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*2*1.5*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3658.415665365, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3685.51526607, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.4!2),1200) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3692.506580138, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.6!2),1200) * Decay.ar(Impulse.ar(1,(0..3)/4),0.1));
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3697.764712604, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (HPF.ar(WhiteNoise.ar(0.6!2),1200) * Decay.ar(Impulse.ar(1,(0..3)/4),0.2));
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3706.56517949, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (BPF.ar(WhiteNoise.ar(0.6!2),1200) * Decay.ar(Impulse.ar(1,(0..3)/4),0.2));
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3709.418556672, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (BPF.ar(WhiteNoise.ar(0.6!2),12000) * Decay.ar(Impulse.ar(1,(0..3)/4),0.2));
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3732.140131193, 'me', "(
~harp.quant=2;
~harp.fadeTime=2;
  ~harp={|notes=#[72,60]|
  var mod2 = Duty.kr(1/8,0,Dseq([1,0.75,2,0.75],inf));
  var mod = Duty.kr(8,0,Dseq([1.5,1.25,1.125,0.75],inf));
         var sig = VarSaw.ar(notes.midicps*2*mod2/[1,2,4,8]/([1,mod]*pi)) * Decay.ar(CoinGate.ar(0.5!4,Impulse.ar(1/2,(0..3)++[0.5,0.25,1.25]/4)),2);
  sig = sig + (SinOsc.ar(75+(100*Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1)),mul:0.5)*Decay.ar(Impulse.ar(1,(0..3)/4),1));
  sig = sig + (BPF.ar(WhiteNoise.ar(0.6!2),LFSaw.ar(1/4).exprange(100.001,10000)) * Decay.ar(Impulse.ar(1,(0..3)/4),0.2));
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~harp,postVol:true);
~harp.play;
);" ],
[ 3748.783845076, 'me', "~kali.stop(7);" ],
[ 3757.974619284, 'me', "~te.stop(7);" ],
[ 3989.590239463, 'me', "thisProcess.stop;" ],
[ 4009.540953796, 'me', "(
~xoxo.quant=2;
~xoxo.play;
~xoxo={
	var t,t2,t3,env,env2,env3,sig,sig2,sig3,temp,l1,l2,l3,melod;

	melod = Duty.kr(8,0,Dseq(powerset([1.25,1.5,1,0.75]).scramble.flat,inf));

	temp = 1/2;
	l1 = 0.5;
	l2 = 1.75;
	l3 = 0.125;

	t = Impulse.ar(temp/2,1/8*[0,1,2,3,4,5,6,7,7.25,7.5,7.75]);
	t2 = Impulse.ar(temp*[2,1],1/4*([0,0.5,1,1.25,1.5,1.75,2,3,3.5]));
	t3 = Impulse.ar(temp/2,1/4*([0,1,2,3,3.5,3.75]+0.5));

	env = Decay.ar(t,l1);
	env2 = Decay2.ar(t2,0.06,l2);
	env3 = Decay.ar(t3,l3);

	sig = (SinOsc.ar(50!2+(Decay.ar(t,0.02).exprange(1.0001,4400.0) ))*env);
	sig = Resonz.ar(sig,Decay.ar(t,0.1).exprange(4000.01,44));

	sig2 = LFSaw.ar(([24,36,24+4,24+4]+LFNoise0.ar(1/4!3).range(0,40).round(12)).midicps*(_*melod!4)*(SinOsc.ar(4.01).range(1.000001,1.001)**(1..8)),mul:0.295/(1..4));
	sig2= s