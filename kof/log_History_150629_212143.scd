// History, as it was on Mon Jun 29 21:21:43 2015.

[
[ 0, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
  var sig = LFSaw.ar(50!2);
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 9.397928574, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
  var sig = LFSaw.ar(50!2);
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.15);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 18.114961198, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
  var sig = LFSaw.ar(50!2);
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 35.253734669, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
  var sig = LFSaw.ar(50!2);
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 56.859587441, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
  var sig = LFSaw.ar(50!2);
  sig = CombN.ar(sig,1/4,1/4,4); 
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 63.698616711, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
  var sig = LFSaw.ar(80!2);
  sig = CombN.ar(sig,1/4,1/4,4); 
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 68.222122522, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
  var sig = LFSaw.ar(80!2);
    sig = CombN.ar(sig,1/4,1/4*(1..8),4); 
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 80.055951812, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,2,4,5]);
    sig = CombN.ar(sig,1/4,1/4*(1..8),4); 
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 90.682280373, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]);
    sig = CombN.ar(sig,1/4,1/4*(1..8),4); 
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 103.456131866, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]);
    sig = CombN.ar(sig,1/4,1/4*(1..8),4); 
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 106.822254979, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]);
    sig = CombN.ar(sig,1/4,1/4/(1..8),4); 
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 130.527842248, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]);
    sig = CombN.ar(sig,1/4,1/4/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/8,2);
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 137.881817299, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]);
    sig = CombN.ar(sig,1/4,1/4/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/8,2);
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 163.732681725, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]);
    sig = CombN.ar(sig,1/4,1/4/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/8,2);
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 170.866870013, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]);
    sig = CombN.ar(sig,1/4,1/4/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/8,2);
  sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 177.930863111, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]);
    sig = CombN.ar(sig,1/4,1/4/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/8,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 183.732080645, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]);
    sig = CombN.ar(sig,1/4,1/4/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/8,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 186.262756594, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]);
    sig = CombN.ar(sig,1/4,1/4/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 189.51648156, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 193.849062805, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]*1.5);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 201.230162951, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]*1.25);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 210.151860546, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = LFSaw.ar(80+[1,80,40,20]*[1.25,1.5]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 214.948197097, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = SinOsc.ar(80+[1,80,40,20]*[1.25,1.5]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 226.007533137, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = SinOsc.ar(80+[1,80,40,20]*[1.25,1.5,2,4]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 233.76026772, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = SinOsc.ar(80+[1,80,40,20/1.5]*[1.25,1.5,2,4]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 242.088179311, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = SinOsc.ar(80+[1,2,3,4]*[1.25,1.5,2,4]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 251.940192565, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = SinOsc.ar(80*1.5+[1,2,3,4]*[1.25,1.5,2,4]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 261.385116629, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = SinOsc.ar(80*4+[1,2,3,4]*[1.25,1.5,2,4]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,12)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 271.909873418, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = SinOsc.ar(80*4+[1,2,3,4]*[1.25,1.5,2,4]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,120)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 287.467599612, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = SinOsc.ar(80*4+[1,2,3,4]*[1.25,1.5,2,4]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,[4,5])/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 302.50254052, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = SinOsc.ar(80*4+[1,2,3,4]*[1.25,1.5,2,4]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2);
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/2,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,[4,5])/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 309.635653082, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = SinOsc.ar(80*4+[1,2,3,4]*[1.25,1.5,2,4]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4);
    sig = AllpassN.ar(sig,1/8,1/4,2)/2+sig;
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/2,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,[4,5])/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 314.061988584, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = SinOsc.ar(80*4+[1,2,3,4]*[1.25,1.5,2,4]);
    sig = CombN.ar(sig,1/4,1/2/(1..8),4)/2+sig;
    sig = AllpassN.ar(sig,1/8,1/4,2)/2+sig;
    sig = sig*EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/2,(0..3)++[0.5,0.25]/4));
    sig = GVerb.ar(sig,[4,5])/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~lalal,postVol:true);
~lalal.play;
);" ],
[ 318.110958419, 'me', "(
~lalal.quant=2;
~lalal.fadeTime=5;
~lalal={
    var sig = SinOsc.