// History, as it was on Mon Jun 15 14:52:37 2015.

[
[ 0, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var fenv = EnvGen.ar(Env([50,250,50],[0.02,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var sig = Blip.ar(fenv,20);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 10.879954531, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var fenv = EnvGen.ar(Env([50,250,50],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var sig = Blip.ar(fenv,20);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 28.431876284, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var fenv = EnvGen.ar(Env([50,250,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var sig = Blip.ar(fenv,20);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 32.838086679, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,20);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 46.595251023, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 106.931920743, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,1000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,1000));
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 113.210611902, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,1000)) + LPF.ar(sig,LFSaw.ar(4).exprange(10.001,1000));
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 116.069895377, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(4).exprange(10.001,1000)) + LPF.ar(sig,LFSaw.ar(4).exprange(10.001,1000));
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 128.394868947, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(4).exprange(10.001,1000)) + LPF.ar(sig,LFSaw.ar(4).exprange(10.001,1000));
  sig = GVerb.ar(sig)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 134.254489058, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(4).exprange(10.001,1000)) + LPF.ar(sig,LFSaw.ar(4).exprange(10.001,1000));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 152.470938479, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(4).exprange(10.001,1000)) + LPF.ar(sig,LFSaw.ar(4).exprange(10.001,1000));
  sig = GVerb.ar(sig)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 155.632889698, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(4).exprange(10.001,1000)) + LPF.ar(sig,LFSaw.ar(4).exprange(10.001,1000));
  sig = GVerb.ar(sig)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 163.553932641, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(4).exprange(10.001,1000)) + LPF.ar(sig,LFSaw.ar(4).exprange(10.001,1000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~plink.play;
);" ],
[ 166.632475143, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(4).exprange(10.001,1000)) + LPF.ar(sig,LFSaw.ar(4).exprange(10.001,1000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 172.022668327, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,1000)) + LPF.ar(sig,LFSaw.ar(4).exprange(10.001,1000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 175.533934635, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(4).exprange(10.001,1000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 183.175135757, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,50],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 187.612570429, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,70],[0.002,0.1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 190.612558497, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,70],[0.002,0.51],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 197.484263049, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,70],[0.002,0.051],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 199.356975358, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,70],[0.02,0.051],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 202.377338531, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,70],[0.04,0.051],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 204.631434041, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,70],[0.04,0.051],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 209.810987615, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,70],[0.004,0.051],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 216.711466228, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.004,0.051],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 219.95301931, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.051],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 222.583230547, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 241.943404712, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4).exprange(0.001,1)*100+2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 256.246891372, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(4)).exprange(0.001,1)*100+2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 259.178781405, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*100+2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 261.32185456, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 279.684136607, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 291.843860627, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 293.765444582, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 314.455282673, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 344.701689785, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 352.983190601, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 357.872034372, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 372.225191616, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1/2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 378.698715766, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1/2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 381.039763889, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1/2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 384.545944789, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,250,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 394.654452346, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,2500,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 398.207853781, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.003,0.151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 401.028433688, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.003,0.0151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 409.083272364, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.002,0.0151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 412.401465062, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.0151],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 419.244811103, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.0251],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 423.958845024, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.0251],[-3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 428.043004743, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.0251],[-3,3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 433.680693345, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.0251],[-3,1.01]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 442.441480059, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.251],[-3,1.01]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 445.322769341, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.251],[-3,0.01]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 449.22051366, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.251],[-3,0.1]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 451.456393486, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.251],[-3,0.2]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 457.74019078, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.51],[-3,0.2]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 461.146332646, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.51],[-3,0.4]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 464.537409374, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.51],[-3,-0.4]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 473.322549162, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.51],[-3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 475.495328213, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.001,0.51],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 479.997277856, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.01,0.51],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 488.152200612, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,4000,70],[0.01,0.51],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 491.064332422, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,70],[0.01,0.51],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 502.213524559, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([50,400,40],[0.01,0.51],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 512.284636368, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 2;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.01,0.51],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 521.542700137, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 4;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.01,0.51],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 527.301386278, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.01,0.51],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 543.274463019, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.01,1.51],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 554.500416881, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.01,1],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 559.535349453, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.01,0.1],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 561.69974466, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.01,0.25],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 566.58123389, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.01,0.5],[3,-0.5]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 569.513700435, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.01,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 584.577571819, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 586.269962512, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.05],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 609.424041054, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo+SinOsc.ar(0.1).range(-0.1,0.1),(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.05],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 620.322152703, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo+SinOsc.ar(1).range(-0.1,0.1),(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.05],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 623.656142664, 'me', "(
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo+SinOsc.ar(1).range(-0.01,0.01),(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.05],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 640.650482866, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo+SinOsc.ar(1).range(-0.01,0.05),(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.05],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 656.029893082, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo+SinOsc.ar(1/4).range(-0.01,0.05),(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.05],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 658.76264338, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo+SinOsc.ar(1/4).range(-0.01,0.15),(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.05],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 659.81315176, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo+SinOsc.ar(1/4).range(-0.01,0.25),(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.05],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 665.992567457, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo+SinOsc.ar(1/4).range(-0.01,0.25),(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 668.373558989, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo+SinOsc.ar(1/4).range(-0.01,0.25),(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 684.854537076, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo+SinOsc.ar(1/4).range(-0.01,0.05),(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 697.864726181, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 705.24407855, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++[0.5,0.25]/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*10+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 719.061287372, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++[0.5,0.25]/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 730.392097751, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++[0.5,0.25]/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  //sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 741.485766612, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++[0.5,0.25]/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 749.17619579, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++[0.5,0.25]/4));
  var fenv = EnvGen.ar(Env([70,400,70],[0.001,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/3/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 764.047945011, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++[0.5,0.25]/4));
  var fenv = EnvGen.ar(Env([70,250,70],[0.001,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/3/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 767.495276367, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(tempo,(0..3)++[0.5,0.25]/4));
  var fenv = EnvGen.ar(Env([70,250,70],[0.001,0.05],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/3/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 776.097870087, 'me', "(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++[0.5,0.25]/4));
  var fenv = EnvGen.ar(Env([70,250,70],[0.001,0.05],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/3/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);" ],
[ 883.941946855, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([500,5000,500],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.5);
};
~hiss.play;
);" ],
[ 894.14136054, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([500,5000,500],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 904.065759254, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([500,5000,500],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.2],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 905.751429464, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([500,5000,500],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 909.758368773, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([500,15000,500],[0.02,0.1],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 913.86178286, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([500,15000,500],[0.02,0.15],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 915.699963315, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([500,15000,500],[0.002,0.15],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 920.779552977, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([20000,15000,500],[0.002,0.15],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 924.316540858, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([20000,100,500],[0.002,0.15],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 926.235174182, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.15],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 930.726073927, 'me', "(
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 936.285133968, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.5!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 952.719921044, 'me', "(
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(2,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.5!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 958.481253883, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.5!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 972.775920159, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.1!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 974.646161509, 'me', "(
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = HPF.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 982.869762275, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = Resonz.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.25);
};
~hiss.play;
);" ],
[ 987.591919792, 'me', "(
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = Resonz.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.5);
};
~hiss.play;
);" ],
[ 994.416902911, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = Resonz.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.25,0.5);
};
~hiss.play;
);" ],
[ 1022.477954766, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var tempo =1;
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(1,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)+[0.5,2.5,2.75]/4));
  var sig = Resonz.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.25,0.5);
};
~hiss.play;
);" ],
[ 1030.679617856, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var tempo = 1/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = Resonz.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.25,0.5);
};
~hiss.play;
);" ],
[ 1034.654084408, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var tempo = 1/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = Resonz.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.5,0.5);
};
~hiss.play;
);" ],
[ 1043.769320108, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var tempo = 2/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.002,0.015],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = Resonz.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.5,0.5);
};
~hiss.play;
);" ],
[ 1063.891316852, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var tempo = 2/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.15,0.15],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = Resonz.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.5,0.5);
};
~hiss.play;
);" ],
[ 1069.238434163, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var tempo = 2/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.15,0.15],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = Resonz.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.5,0.5);
};
~hiss.play;
);" ],
[ 1073.935214035, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var tempo = 1/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.15,0.15],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = Resonz.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.5,0.5);
};
~hiss.play;
);" ],
[ 1084.305006362, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var tempo = 1/2/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.15,0.15],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = Resonz.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.5,0.5);
};
~hiss.play;
);" ],
[ 1088.665677223, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var tempo = 1/2/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.5,0.5],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = Resonz.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.5,0.5);
};
~hiss.play;
);" ],
[ 1098.927429842, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var tempo = 1/2/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.5,0.5],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = BPF.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.5,0.5);
};
~hiss.play;
);" ],
[ 1108.013474647, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var tempo = 1/2/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[1,0.5],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = BPF.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.5,0.5);
};
~hiss.play;
);" ],
[ 1114.38527987, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=4;
~hiss={
  var tempo = 1/2/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[1,0.5],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = BPF.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.5,0.5);
};
~hiss.play;
);" ],
[ 1126.282493357, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=4;
~hiss={
  var tempo = 1/2/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[1,1],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = BPF.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.5,0.5);
};
~hiss.play;
);" ],
[ 1134.583852857, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=4;
~hiss={
  var tempo = 1/2/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.1,1],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = BPF.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(