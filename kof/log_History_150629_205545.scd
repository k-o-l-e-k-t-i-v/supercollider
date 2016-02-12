// History, as it was on Mon Jun 29 20:55:45 2015.

[
[ 0, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
  var sig = LFSaw.ar(50!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 72.592064796, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
  var sig = LFSaw.ar(50!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.225);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 82.382435481, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
  var sig = LFSaw.ar(50!2);
  sig = sig;
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 84.21839412, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
  var sig = LFSaw.ar(50!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 88.817978369, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
  var sig = LFSaw.ar(150!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 120.522486573, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(150!2) * Pulse.ar(4/fib(4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 150.967164615, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(150!2) * Pulse.ar(4/fib(4));
  sig = sig;
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 161.383023467, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(80!2) * Pulse.ar(4/fib(4));
  sig = sig;
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 164.196126878, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(80!2) * Pulse.ar(4/fib(4));
  sig = sig;
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.0125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 175.726877511, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(80!2) * Pulse.ar(4/fib(4));
  sig = sig;
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 186.583123103, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(80!2) * Pulse.ar(4/fib(4));
  sig = sig;
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 194.503928549, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(80!2) * Pulse.ar(4/fib(4));
  sig = sig;
    sig = LPF.ar(sig,10);
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 196.629215213, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(80!2) * Pulse.ar(4/fib(4));
  sig = sig;
    sig = LPF.ar(sig,1000);
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 212.663133078, 'me', "s.freeAll" ],
[ 228.588338354, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(80!2) * Pulse.ar(4/fib(4));
  sig = sig;
    sig = LPF.ar(sig,1000);
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 249.219543629, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(4/fib(4));
  sig = sig;
    sig = LPF.ar(sig,1000);
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 252.426077764, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(4/fib(4));
  sig = sig;
    sig = LPF.ar(sig,100);
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 256.466440182, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(4/fib(4));
  sig = sig;
    sig = LPF.ar(sig,2000);
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.025);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 270.561504955, 'me', "~tse.stop(7);" ],
[ 275.417468223, 'me', "~tse.stop(7);" ],
[ 279.856461002, 'me', "(
~tse.quant=2;
~tse.fadeTime=5;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(4/fib(4));
  sig = sig;
    sig = LPF.ar(sig,2000);
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 285.754479295, 'me', "(
~tse.quant=2;
~tse.fadeTime=2;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(4/fib(4));
  sig = sig;
    sig = LPF.ar(sig,2000);
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 295.974500195, 'me', "(
~tse.quant=2;
~tse.fadeTime=2;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(8/fib(4));
  sig = sig;
    sig = LPF.ar(sig,2000);
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 317.878130781, 'me', "(
~tse.quant=2;
~tse.fadeTime=2;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(8/fib(4));
  sig = sig;
    sig = RLPF.ar(sig,LFSaw.ar(1/4).exprange(0.001,1) * 2000+100 );
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 328.638157877, 'me', "(
~tse.quant=2;
~tse.fadeTime=2;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(8/fib(4));
  sig = sig;
    sig = RLPF.ar(sig,LFSaw.ar(1).exprange(0.001,1) * 2000+100 );
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 334.584490627, 'me', "(
~tse.quant=2;
~tse.fadeTime=2;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(8/fib(4));
  sig = sig;
    sig = RLPF.ar(sig,LFSaw.ar(1).exprange(0.001,1) * 2000+100 );
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 340.624255917, 'me', "(
~tse.quant=2;
~tse.fadeTime=2;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(4/fib(4));
  sig = sig;
    sig = RLPF.ar(sig,LFSaw.ar(1).exprange(0.001,1) * 2000+100 );
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 344.112729198, 'me', "(
~tse.quant=2;
~tse.fadeTime=2;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(16/fib(4));
  sig = sig;
    sig = RLPF.ar(sig,LFSaw.ar(1).exprange(0.001,1) * 2000+100 );
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 352.192258168, 'me', "(
~tse.quant=2;
~tse.fadeTime=2;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(4/fib(4));
  sig = sig;
    sig = RLPF.ar(sig,LFSaw.ar(1).exprange(0.001,1) * 2000+100 );
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 357.519257738, 'me', "(
~tse.quant=2;
~tse.fadeTime=2;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(1/fib(8));
  sig = sig;
    sig = RLPF.ar(sig,LFSaw.ar(1).exprange(0.001,1) * 2000+100 );
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 367.369046231, 'me', "(
~tse.quant=2;
~tse.fadeTime=2;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(2/fib(8));
  sig = sig;
    sig = RLPF.ar(sig,LFSaw.ar(1).exprange(0.001,1) * 2000+100 );
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 383.41623213, 'me', "(
~tse.quant=2;
~tse.fadeTime=2;
~tse={
    var sig = LFSaw.ar(80+[1,2,3,4]) * Pulse.ar(2/fib(8));
  sig = sig;
    sig = RLPF.ar(sig,LFSaw.ar(1/[1,2,4,8]).exprange(0.001,1) * 2000+100 );
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.125);
};
e.addMix(~tse,postVol:true);
~tse.play;
);" ],
[ 453.359364796, 'me', "(
~hisses.quant=2;
~hisses.fadeTime=5;
~hisses={
    var sig = LFSaw.ar(432*4/([1,1.5,2,4]*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.015);
};
e.addMix(~hisses,postVol:true);
~hisses.play;
);" ],
[ 490.76029125, 'me', "(
~hisses.quant=2;
~hisses.fadeTime=5;
~hisses={
    var sig = LFSaw.ar(432*4/([1,1.5,2,4]*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exp