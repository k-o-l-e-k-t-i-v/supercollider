// History, as it was on Sat Jun 20 14:27:45 2015.

[
[ 0, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(1/4).exprange(10.001,10000));
  sig = Greyhole.ar(sig,0.1,0.2,0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 21.043299939, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFDNoise1.ar(1!8)).exprange(10.001,10000));
  sig = Greyhole.ar(sig,0.1,0.2,0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 33.085687501, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFDNoise1.ar(1/4!8)).exprange(10.001,10000));
  sig = Greyhole.ar(sig,0.1,0.2,0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 55.655729969, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFDNoise1.ar(1/4!8)).exprange(10.001,10000));
  sig = LPF.ar(sig,8000);
  sig = Greyhole.ar(sig,0.1,0.2,0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 67.169988897, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFDNoise1.ar(1/4!8)).exprange(10.001,10000));
  sig = LPF.ar(sig,8000);
  sig = sig * Pulse.ar(4);
  sig = Greyhole.ar(sig,0.1,0.2,0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 70.58906686, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFDNoise1.ar(1/4!8)).exprange(10.001,10000));
  sig = LPF.ar(sig,8000);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = Greyhole.ar(sig,0.1,0.2,0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 82.114475064, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFDNoise1.ar(1/4!8)).exprange(10.001,10000));
  sig = LPF.ar(sig,8000);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = Greyhole.ar(sig,0.5,0.2,0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 84.576500183, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFDNoise1.ar(1/4!8)).exprange(10.001,10000));
  sig = LPF.ar(sig,8000);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = Greyhole.ar(sig,0.5,0.02,0.4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 87.51294815, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFDNoise1.ar(1/4!8)).exprange(10.001,10000));
  sig = LPF.ar(sig,8000);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = Greyhole.ar(sig,0.5,0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 98.76654696, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFDNoise1.ar(1/4!8)).exprange(10.001,10000));
  sig = LPF.ar(sig,8000);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = Greyhole.ar(sig,0.5,0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 106.91216112, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFDNoise1.ar(1/4!8)).exprange(50.001,10000));
  sig = LPF.ar(sig,8000);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = Greyhole.ar(sig,0.5,0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 121.120654477, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,1)).exprange(50.001,10000));
  sig = LPF.ar(sig,8000);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = Greyhole.ar(sig,0.5,0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 147.298620813, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,1)).exprange(50.001,10000));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(50.001,1000));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = Greyhole.ar(sig,0.5,0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 158.280401934, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,1)).exprange(50.001,10000));
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(50.001,10000));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = Greyhole.ar(sig,0.5,0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 167.604976677, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,1)).exprange(50.001,10000));
  sig = BPF.ar(sig,LFSaw.ar(1/[4,3,2,1]).exprange(50.001,10000));
  sig = sig * Pulse.ar([1,2,3,4]);
  sig = Greyhole.ar(sig,0.5,0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 200.617263037, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,1)).exprange(50.001,10000));
  sig = BPF.ar(sig,LFSaw.ar(1/[4,3,2,1]).exprange(50.001,10000));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Greyhole.ar(sig,0.5,0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 286.542530372, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,1)).exprange(50.001,10000));
  sig = BPF.ar(sig,LFSaw.ar(4/[4,3,2,1]).exprange(50.001,10000));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Greyhole.ar(sig,0.5,0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 289.283542097, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,1)).exprange(50.001,10000));
  sig = BPF.ar(sig,LFSaw.ar(4/[4,3,2,1]).exprange(50.001,1000));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Greyhole.ar(sig,0.5,0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 292.161752331, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFSaw.ar(LFSaw.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,1)).exprange(50.001,1000));
  sig = BPF.ar(sig,LFSaw.ar(4/[4,3,2,1]).exprange(50.001,1000));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Greyhole.ar(sig,0.5,0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 325.115513698, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50);
  sig = sig * Pulse.ar(4).softclip;
  sig = Greyhole.ar(sig,0.5,0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 335.449496512, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50);
  sig = sig * Pulse.ar(4).softclip;
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.02,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 338.851330061, 'me', "(
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50);
  sig = sig * Pulse.ar(4).softclip;
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.0,10);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 340.985310486, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50);
  sig = sig * Pulse.ar(4).softclip;
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.0,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 347.790601263, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50);
  sig = sig * Pulse.ar(4).softclip;
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.0,4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 355.713959192, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50);
  sig = sig * Pulse.ar([1,2,4,3]).softclip;
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.0,4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 371.168527458, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,1.5,2]);
  sig = sig * Pulse.ar([1,2,4,3]).softclip;
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.0,4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 382.637227254, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,1.5,2]);
  sig = sig * Pulse.ar([1,2,4,3]).softclip;
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.9,4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 391.113911829, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,1.5,2]);
  sig = sig * Pulse.ar([1,2,4,3]).softclip;
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.4,4);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 393.688808872, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,1.5,2]);
  sig = sig * Pulse.ar([1,2,4,3]).softclip;
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 403.614642212, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,1.5,20]);
  sig = sig * Pulse.ar([1,2,4,3]).softclip;
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 408.902207272, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,1.5,2]);
  sig = sig * Pulse.ar([1,2,4,3]).softclip;
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 422.446347674, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,1.5,2]);
  sig = BPF.ar(sig,100);
  sig = sig * Pulse.ar([1,2,4,3]).softclip;
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 433.031531909, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,1.5,2]);
  sig = BPF.ar(sig,100);
  sig = sig * Pulse.ar([1,2,4,3]);
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 444.556813398, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,1.5,2]);
  sig = BPF.ar(sig,100);
  sig = sig * Pulse.ar([1,2,4,3]*1.5);
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 459.621674834, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,1.5,2]);
  sig = BPF.ar(sig,100);
  sig = sig * Pulse.ar([1,2,4,3]/2);
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 470.305265575, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,1.5,2]);
  sig = BPF.ar(sig,100);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Greyhole.ar(sig,1/[1,2,4,8],0.4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 478.889517646, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,1.5,2]);
  sig = BPF.ar(sig,100);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Greyhole.ar(sig,1/[2,4,8,16],0.4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 484.058699371, 'me', "(
~animals.quant=2;
~animals.fadeTime=5;
~animals={
  var sig = LFPulse.ar(50*[1,1,15,2]);
  sig = BPF.ar(sig,100);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = Greyhole.ar(sig,1/[2,4,8,16],0.4,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~animals.play;
);" ],
[ 633.139780855, 'me', "thisProcess.stop;" ],
];