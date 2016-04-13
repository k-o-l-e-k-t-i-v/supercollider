// History, as it was on Mon Jun 15 20:57:52 2015.

[
[ 0, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = SinOsc.ar(111!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 3.582795048, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = SinOsc.ar(111!2,mul:0.2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 12.236264612, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = SinOsc.ar(111!2,mul:0.4);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 14.237611722, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = SinOsc.ar(111!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 21.277240163, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(111!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 36.236538132, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(111!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = LPF.ar(sig,LFSaw.ar(1/4).exprange(100.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 42.069079677, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(111!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(100.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 119.159688506, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4,mul:0.4);
  sig = sig * LFSaw.ar(8).exprange(0.001,1);
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(100.001,14000),SinOsc.ar(11).range(0.1,2));
  Splay.ar(sig,0.25,0.5);
};
~abcc.play;
);" ],
[ 128.811965965, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4,mul:0.4);
  sig = sig * LFSaw.ar(8).exprange(0.001,1);
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(150.001,14000),SinOsc.ar(11).range(0.1,2));
  Splay.ar(sig,0.25,0.5);
};
~abcc.play;
);" ],
[ 132.269969295, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4,mul:0.4);
  sig = sig * LFSaw.ar(8).exprange(0.001,1);
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(150.001,14000),SinOsc.ar(1).range(0.1,2));
  Splay.ar(sig,0.25,0.5);
};
~abcc.play;
);" ],
[ 143.291619144, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4,mul:0.4);
  sig = sig * LFSaw.ar(8).exprange(0.001,1);
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(150.001,14000).lag(1),SinOsc.ar(1).range(0.1,2));
  Splay.ar(sig,0.25,0.5);
};
~abcc.play;
);" ],
[ 157.358728704, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(150.001,14000).lag(1),SinOsc.ar(1).range(0.1,2));
  Splay.ar(sig,0.25,0.5);
};
~abcc.play;
);" ],
[ 165.043995454, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(150.001,14000).lag(1),SinOsc.ar(11).range(0.1,2));
  Splay.ar(sig,0.25,0.5);
};
~abcc.play;
);" ],
[ 168.187466761, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(150.001,14000).lag(1),SinOsc.ar(11).range(0.01,2));
  Splay.ar(sig,0.25,0.5);
};
~abcc.play;
);" ],
[ 176.028547194, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = BPF.ar(sig,LFSaw.ar(1/4).exprange(150.001,14000).lag(1),SinOsc.ar(11).range(0.2,2));
  Splay.ar(sig,0.25,0.5);
};
~abcc.play;
);" ],
[ 192.059879942, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(150.001,14000).lag(1),SinOsc.ar(11).range(0.2,2));
  Splay.ar(sig,0.25,0.5);
};
~abcc.play;
);" ],
[ 200.720153203, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(150.001,14000).lag(1),SinOsc.ar(11).range(0.2,2));
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 216.03614509, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(150.001,14000).lag(1),SinOsc.ar(11).range(0.2,2));
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 221.046686513, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(150.001,14000).lag(1),SinOsc.ar(11).range(0.2,2));
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 227.038490474, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(150.001,14000),SinOsc.ar(11).range(0.2,2));
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 229.163456418, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(150.001,14000),SinOsc.ar(1).range(0.2,2));
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 233.310553274, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(150.001,14000),SinOsc.ar(1/3).range(0.2,2));
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 236.939377262, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(150.001,14000),SinOsc.ar(1/3/fib(8)).range(0.2,2));
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 243.792444272, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(150.001,14000),SinOsc.ar(1/3/fib(8)).range(0.2,2))+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 262.991860427, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(150.001,14000),SinOsc.ar(1/3/fib(8)).range(0.2,2))+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 267.466982732, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(150.001,14000),SinOsc.ar(1/3/fib(8)).range(0.2,2))+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 272.114222482, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(150.001,14000),SinOsc.ar(2/fib(8)).range(0.2,2))+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 287.231484236, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(150.001,14000),SinOsc.ar(2/fib(8)).range(0.2,2))+(sig/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 295.08796561, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(50.001,14000),SinOsc.ar(2/fib(8)).range(0.2,2))+(sig/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 297.626220502, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.2,2))+(sig/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 302.231359001, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(1/2/fib(8)).range(0.2,2))+(sig/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 305.258133874, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(1/2/fib(8)).range(0.2,2))+(sig/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 309.568677615, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = Resonz.ar(sig,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(1/2/fib(8)).range(0.2,2))+(sig/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 318.934837299, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(1/2/fib(8)).range(0.2,2))+(sig/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 328.864428184, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(1/2/fib(8)).range(0.2,2))+(sig/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 337.301384367, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.2,2))+(sig/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 340.357570244, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2))+(sig/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 347.447767829, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2))+(sig/8);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 357.30033587, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2))+(sig/5);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 369.635487873, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2))+LPF.ar(sig,400);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 377.141273855, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2))+LPF.ar(sig,200);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 386.826022811, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2))+GVerb.ar(LPF.ar(sig,200));
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 388.735871376, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2))+GVerb.ar(LPF.ar(sig,200),10);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 398.177481556, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig,600),10);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 410.223850807, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig,LFSaw.ar(1/4).exprange(80.001,800)),10);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 424.830957137, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig;
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 433.905770055, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = LFSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 441.693806596, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 452.78351012, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 469.019317907, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig*2,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 474.45834933, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig*4,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 480.101311617, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 491.61701317, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 540.178923218, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);

  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 553.155817937, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(4).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);

  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 567.753674175, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);

  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 571.494486811, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);

  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 574.000318713, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);

  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 611.767653031, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
~abcc.play;
);" ],
[ 654.738461919, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,800)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 679.534578972, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,8000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 688.703046487, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 710.92428568, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 722.674423517, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,100)/4+sig;
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 727.626122868, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,11)/4+sig;
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 754.841386928, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,11)/4+sig;
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 770.855919676, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,11)/4+sig;
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 840.239741784, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,11)/4+sig + LFSaw.ar(14000,mul:0.1);
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 846.037622258, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,11)/4+sig + LFSaw.ar(14000+(1..8),mul:0.1);
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 863.627504958, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,11)/4+sig + (LFSaw.ar(14000+(1..8),mul:0.1)*LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 873.531723989, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,11)/4+sig + (LFSaw.ar(14000/(1..8),mul:0.1)*LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 917.574139368, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,11)/4+sig + (LFSaw.ar(14000/(1..8),mul:0.1)*LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = sig + (sig*Pulse.ar(1)/2);
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 924.739383454, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,11)/4+sig + (LFSaw.ar(14000/(1..8),mul:0.1)*LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = sig + (sig*Pulse.ar(1)/4);
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 930.076009719, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,11)/4+sig + (LFSaw.ar(14000/(1..8),mul:0.1)*LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = sig + (sig*Pulse.ar(2)/4);
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 932.592716337, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = GVerb.ar(sig,11)/4+sig + (LFSaw.ar(14000/(1..8),mul:0.1)*LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = sig + (sig*Pulse.ar(2)/8);
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 942.872359294, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = sig + (sig*Pulse.ar(2)/8);
  sig = GVerb.ar(sig,11)/4+sig + (LFSaw.ar(14000/(1..8),mul:0.1)*LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  //sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 963.225959719, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = sig + (sig*Pulse.ar(2)/8);
  sig = GVerb.ar(sig,11)/4+sig + (LFSaw.ar(14000/(1..8),mul:0.1)*LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/1.5,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 976.852684934, 'me', "(
~abcc.quant=2;
~abcc.fadeTime=5;
~abcc={
  var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  sig = sig + (sig*Pulse.ar(2)/8);
  sig = GVerb.ar(sig,11)/4+sig + (LFSaw.ar(14000/(1..8),mul:0.1)*LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
  sig = CompanderD.ar(sig,4/3,1/1.25,1/1.25);
  Splay.ar(sig.flat,0.25,0.25);
};
~abcc.play;
);" ],
[ 1172.53059638, 'me', "(
  ~groove.quant=2;
  ~groove.fadeTime=5;
  ~groove={
    var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
    sig = sig * SinOsc.ar(1/fib(8)).exprange(0.001,1);
    sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,SinOsc.ar(1/4).exprange(80.001,18000)),10);
    sig = CompanderD.ar(sig,4/3,1/2,1/2);
    sig = sig + (sig*Pulse.ar(2)/8);
    sig = GVerb.ar(sig,11)/4+sig + (SinOsc.ar(14000/(1..8),mul:0.1)*SinOsc.ar(1/4/fib(4)).exprange(0.001,1));
    sig = CompanderD.ar(sig,4/3,1/1.25,1/1.25);
    Splay.ar(sig.flat,0.25,0.25);
  };
  ~groove.play;
);" ],
[ 1204.273050055, 'me', "(
  ~groove.quant=2;
  ~groove.fadeTime=5;
  ~groove={
    var sig = VarSaw.ar(432/4!2,mul:0.4) ++ LFSaw.ar(43.2*2) ++ WhiteNoise.ar(0.1);
    sig = sig * LFSaw.ar(1/fib(8)).expr