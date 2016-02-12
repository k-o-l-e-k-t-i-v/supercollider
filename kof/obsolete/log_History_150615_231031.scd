// History, as it was on Mon Jun 15 23:10:31 2015.

[
[ 0, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 8.634892291, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 31.561003493, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1).range(-10,10));
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 40.822047259, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1).range(-0,10));
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 42.253591994, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1).range(0,10));
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 46.661534509, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1/4).range(0,10));
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 49.081308159, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(4).range(0,10));
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 57.19661939, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(8).range(0,10));
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 64.318928623, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(8).range(0,100));
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 69.64653638, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(8).range(0,1000));
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 79.327499949, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(8).range(0,1000));
  sig= BPF.ar(sig,500);
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 91.869709217, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(8).range(0,1000));
  sig= BPF.ar(sig,432);
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 101.567891275, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1/8).range(0,1000));
  sig = BPF.ar(sig,432);
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 112.366918723, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1/8).range(0,1000));
  sig = BPF.ar(sig,43.2);
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 123.806957925, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1/8).range(0,1000));
  sig = BPF.ar(sig,90.2);
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 144.389289378, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1/8).range(0,1000));
  sig = BPF.ar(sig,90.2*(1.0001**(1..8)));
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 147.190492616, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1/8).range(0,1000));
  sig = BPF.ar(sig,90.2*(1.01**(1..8)));
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 158.35823546, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1/8).range(0,1000));
  sig = BPF.ar(sig,90.2*(1.01**(1..8)),0.1);
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 170.354347583, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1/8).range(0,1000));
  sig = BPF.ar(sig,120.2*(1.01**(1..8)),0.1);
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 181.364120316, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1/8).range(0,100));
  sig = BPF.ar(sig,120.2*(1.01**(1..8)),0.1);
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 196.212172041, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(8).range(0,100));
  sig = BPF.ar(sig,120.2*(1.01**(1..8)),0.1);
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 197.875971107, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(1).range(0,100));
  sig = BPF.ar(sig,120.2*(1.01**(1..8)),0.1);
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 205.180437133, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,120.2*(1.01**(1..8)),0.1);
  sig = sig * LFSaw.ar(2!2).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 209.506077853, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(50+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,120.2*(1.01**(1..8)),0.1);
  sig = sig * LFSaw.ar(4).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 222.440863745, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(150+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,120.2*(1.01**(1..8)),0.1);
  sig = sig * LFSaw.ar(4).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 228.312025524, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(1500+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,120.2*(1.01**(1..8)),0.1);
  sig = sig * LFSaw.ar(4).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 251.248871024, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(150+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,120.2*(1.01**(1..8)),0.1);
  sig = sig * LFSaw.ar(4).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 253.55289733, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(150+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,12.2*(1.01**(1..8)),0.1);
  sig = sig * LFSaw.ar(4).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 255.146303676, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(150+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,40.2*(1.01**(1..8)),0.1);
  sig = sig * LFSaw.ar(4).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 259.20800776, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(150+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.1);
  sig = sig * LFSaw.ar(4).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 267.430536759, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(150+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.5);
  sig = sig * LFSaw.ar(4).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 278.366567589, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(150+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
  sig = sig * LFSaw.ar(4).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 295.328361321, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(150+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
  sig = sig * LFSaw.ar(40).range(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 308.565351114, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(150+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
  sig = sig * LFSaw.ar(40).exprange(0.00001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 318.934228686, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(150+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
  sig = sig * LFSaw.ar(40).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 334.854672583, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(150+LFSaw.ar(4).range(0,1000));
  sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
  sig = sig * LFSaw.ar(40).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 342.66972891, 'me', "(
~poiu.quant=2;
~poiu.fadeTime=5;
~poiu={
  var sig = LFSaw.ar(150+LFSaw.ar(4).range(0,100));
  sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
  sig = sig * LFSaw.ar(40).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~poiu,postVol:true);
~poiu.play;
);" ],
[ 375.868080716, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(1500+LFSaw.ar(4).range(0,100));
    sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(40).exprange(0.001,1);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 393.049288474, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(1500+LFSaw.ar(4).range(0,100));
    sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(40).exprange(0.001,1);
    sig = GVerb.ar(sig/8,10);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 402.374403911, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(1500+LFSaw.ar(4).range(0,100));
    sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(4).exprange(0.001,1);
    sig = GVerb.ar(sig/8,10);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 407.723335739, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(4).range(0,100));
    sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(4).exprange(0.001,1);
    sig = GVerb.ar(sig/8,10);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 413.348378278, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(4).range(0,250));
    sig = BPF.ar(sig,40.2*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(4).exprange(0.001,1);
    sig = GVerb.ar(sig/8,10);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 417.981098676, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(4).range(0,250));
    sig = BPF.ar(sig,250.2*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(4).exprange(0.001,1);
    sig = GVerb.ar(sig/8,10);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 419.727896791, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(4).range(0,250));
    sig = BPF.ar(sig,250.15*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(4).exprange(0.001,1);
    sig = GVerb.ar(sig/8,10);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 431.074707173, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(4).range(0,250));
    sig = BPF.ar(sig,250.15*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig/8,10);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 437.706150778, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(4).range(0,250));
    sig = BPF.ar(sig,250.15*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 446.173542681, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(4).range(0,250));
    sig = BPF.ar(sig,250.15*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig/2,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 462.466147456, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4).range(0,250));
    sig = BPF.ar(sig,250.15*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig/2,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 469.674592035, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250));
    sig = BPF.ar(sig,250.15*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig/2,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 486.952170533, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250));
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 497.680493206, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250));
    sig = BPF.ar(sig,250.15*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig/2,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 501.918140533, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250));
    sig = BPF.ar(sig,250.15*(1.5**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 507.877056827, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250));
    sig = BPF.ar(sig,250.15*(2**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 521.080187821, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250));
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 526.624601558, 'me', "thisProcess.stop;" ],
[ 526.932813565, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250));
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 547.922483546, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) + PinkNoise.ar(0.1!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 553.695626235, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) / PinkNoise.ar(0.1!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 558.530729061, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * PinkNoise.ar(0.1!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 570.838900534, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * PinkNoise.ar(0.5!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 580.753176023, 'me', "(
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.5!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 585.162208044, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 596.784245232, 'me', "(
  ~poiu.quant=2;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(432);
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 607.580607243, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 613.696328627, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 619.064223701, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10);
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 629.063146756, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 650.527970093, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) +WhiteNoise.ar(0.1!2) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100);
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 662.866973617, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.1!2) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,100) * sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 677.938745964, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.1!2) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10) * sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 694.985105589, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.1!2) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10) * sig;
    sig = Normalizer.ar(sig)/2;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 701.996550224, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.1!2) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10) * sig.distort;
    sig = Normalizer.ar(sig)/2;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 710.845803075, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.1!2) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10) * sig.distort;
    sig = Normalizer.ar(sig,0.1)/2;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 719.65898279, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.1!2) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10) * sig.distort;
    sig = Normalizer.ar(sig,0.1);
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 740.913449546, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.1!2) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10) * sig.distort;
    sig = Normalizer.ar(sig[0],0.1) * sig[1];
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 756.809059293, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.1!2) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10) * sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 762.169791632, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.1!2) * SinOsc.ar(432/(1..8));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 778.921576681, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.1!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 790.09022752, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(0.75!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 795.979742702, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 799.868674534, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.1);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 803.186000516, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 849.553780979, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = SinOsc.ar(sig.range(44,4000));
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 861.404691418, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = SinOsc.ar(sig.range(44,4000),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 867.821600579, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = SinOsc.ar(sig.range(44,4000).lag(0.1),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 874.792759197, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = SinOsc.ar(sig.range(44,400).lag(0.1),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 878.844549535, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = SinOsc.ar(sig.range(44,400).lag(0.01),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 885.879962601, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = SinOsc.ar(sig.range(44,400).lag(0.001),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 896.682099321, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = SinOsc.ar(sig.range(44,800).lag(0.001),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 903.725778004, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = SinOsc.ar(sig.range(44,800).lag(0.0001),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 909.87398114, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = SinOsc.ar(sig.range(44,8000).lag(0.0001),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 919.672823362, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LFSaw.ar(sig.range(44,18000).lag(0.0001),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 922.705400024, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LFSaw.ar(sig.range(44,18000).lag(0.0001),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 989.183178427, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LFSaw.ar(sig.range(44,1800).lag(0.0001),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 998.881071806, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LFSaw.ar(sig.range(44,900).lag(0.0001),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1012.455586353, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(4320/((1..8)*pi));
    sig = LFSaw.ar(sig.range(44,900).lag(0.0001),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1020.368103099, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = LFSaw.ar(sig.range(44,900).lag(0.0001),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1032.442855917, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = LFSaw.ar(sig.range(44,900).round(43.2).lag(0.0001),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1035.668780782, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = LFSaw.ar(sig.range(44,900).round(43.2).lag(0.001),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1039.878650675, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = LFSaw.ar(sig.range(44,900).round(43.2).lag(0.01),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1043.532570541, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = LFSaw.ar(sig.range(44,900).round(43.2).lag(0.1),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1051.20221396, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = LFSaw.ar(sig.range(44,900).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1058.275618209, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = LFSaw.ar(sig.range(44,9000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1063.929967174, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = SinOsc.ar(sig.range(44,9000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1083.956556211, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(250+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = SinOsc.ar(sig.range(44,9000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1089.380327276, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(50+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = SinOsc.ar(sig.range(44,9000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1092.128010334, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,250)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = SinOsc.ar(sig.range(44,9000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1096.919471925, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25)) * BrownNoise.ar(1!2).lag(0.01);
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = SinOsc.ar(sig.range(44,9000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1103.187167319, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,250.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = SinOsc.ar(sig.range(44,9000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1110.628119211, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,50.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = SinOsc.ar(sig.range(44,9000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1111.911409649, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,5.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + WhiteNoise.ar(0.01!2) * SinOsc.ar(432/((1..8)*pi));
    sig = SinOsc.ar(sig.range(44,9000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1121.686850813, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,5.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(432/((1..8)*pi));
    sig = SinOsc.ar(sig.range(44,9000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1123.625369095, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,5.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(4.32/((1..8)*pi));
    sig = SinOsc.ar(sig.range(44,9000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1133.476984346, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,5.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(4.32/((1..8)*pi));
    sig = SinOsc.ar(sig.range(44,900).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1139.502288329, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,5.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(4.32/((1..8)*pi));
    sig = SinOsc.ar(sig.range(300,4000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1146.956002875, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,5.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(4.32/((1..8)*pi));
    sig = SinOsc.ar(sig.range(3000,4000).round(43.2),mul:0.12);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1150.530264948, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,5.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(4.32/((1..8)*pi));
    sig = SinOsc.ar(sig.range(3000,4000).round(43.2),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1155.1187614, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,5.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(4.32/((1..8)*pi));
    sig = SinOsc.ar(sig.range(1000,4000).round(43.2),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1157.254867419, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,5.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(4.32/((1..8)*pi));
    sig = SinOsc.ar(sig.range(500,4000).round(43.2),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1164.200345783, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,0.515*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(4.32/((1..8)*pi));
    sig = SinOsc.ar(sig.range(500,4000).round(43.2),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1179.671271997, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,1.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(4.32/((1..8)*pi));
    sig = SinOsc.ar(sig.range(500,4000).round(43.2),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1183.525545427, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,1.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * SinOsc.ar(4.32/((1..8)*pi));
    sig = SinOsc.ar(sig.range(500,4000).round(43.2),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1189.231185778, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,1.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) + SinOsc.ar(4.32/((1..8)*pi));
    sig = SinOsc.ar(sig.range(500,4000).round(43.2),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1205.169465371, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,1.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * LFPulse.ar(1);
    sig = SinOsc.ar(sig.range(500,4000).round(43.2),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1206.74452073, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var sig = LFSaw.ar(5+LFSaw.ar(1/4/fib(8)).range(0,25));
    sig = BPF.ar(sig,1.15*(1.25**(1..8)),0.5,mul:LFDNoise1.ar(1!8)) * LFPulse.ar(4);
    sig = SinOsc.ar(sig.range(500,4000).round(43.2),mul:0.2);
    sig = GVerb.ar(sig,10)/2 + sig;
    Splay.ar(sig.flat,0.5,0.75);
  };
  e.addMix(~poiu,postVol:true);
  ~poiu.play;
);" ],
[ 1221.360532914, 'me', "(
  ~poiu.quant=2;
  ~poiu.fadeTime=5;
  ~poiu={
    var