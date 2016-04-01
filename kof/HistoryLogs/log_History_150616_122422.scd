// History, as it was on Tue Jun 16 12:24:22 2015.

[
[ 0, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(2000!2);
  5.do{
  sig = BPF.ar(sig,LFSaw.ar(4).range(2000,4000));
  };
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 11.547561729, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(2000!2);
  5.do{
  sig = BPF.ar(sig,LFSaw.ar(4).range(2000,4000),0.25);
  };
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 25.968432956, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(2000!2);
  5.do{
  sig = Resonz.ar(sig,LFSaw.ar(4).range(2000,4000),0.25);
  };
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 34.548036823, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2);
  5.do{
  sig = Resonz.ar(sig,LFSaw.ar(4).range(2000,4000),0.25);
  };
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 46.324291098, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2);
  5.do{
  sig = Resonz.ar(sig,LFSaw.ar(44).range(2000,4000),0.25);
  };
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 56.177850101, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2);
  5.do{
  sig = Resonz.ar(sig,LFSaw.ar(44).range(2000,4000),0.5);
  };
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 60.257339511, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2);
  5.do{
  sig = Resonz.ar(sig,LFSaw.ar(44).range(200,4000),0.5);
  };
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 68.019489149, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2);
  5.do{
    sig = Resonz.ar(sig,LFSaw.ar(44/fib(8)).range(200,4000),0.5);
  };
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 76.269723602, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2);
  5.do{
    sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).range(200,4000),0.5);
  };
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 88.884805351, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2);
  5.do{
    sig = Resonz.ar(sig,LFSaw.ar(4/fib(8)).range(200,4000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 99.047362879, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2);
  5.do{
    sig = Resonz.ar(sig,LFSaw.ar(44/fib(8)).range(200,4000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 106.075570423, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*2);
  5.do{
    sig = Resonz.ar(sig,LFSaw.ar(44/fib(8)).range(200,4000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 108.958960589, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*1.5);
  5.do{
    sig = Resonz.ar(sig,LFSaw.ar(44/fib(8)).range(200,4000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 110.945350019, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*1.25);
  5.do{
    sig = Resonz.ar(sig,LFSaw.ar(44/fib(8)).range(200,4000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 113.237833827, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*4);
  5.do{
    sig = Resonz.ar(sig,LFSaw.ar(44/fib(8)).range(200,4000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 116.61193505, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*8);
  5.do{
    sig = Resonz.ar(sig,LFSaw.ar(44/fib(8)).range(200,4000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 128.762804273, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*8);
  5.do{
    sig = Resonz.ar(sig,LFSaw.ar(22/fib(8)).range(200,4000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 132.801937701, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*8);
  5.do{
    sig = Resonz.ar(sig,LFSaw.ar(11/fib(8)).range(200,4000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 135.981373684, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*8);
  5.do{
    sig = Resonz.ar(sig,LFSaw.ar(11/fib(8)).range(200,400),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 147.221754183, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(11/fib(8)).range(200,400),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 156.045232845, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(2000!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(11/fib(8)).range(200,400),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 161.055652209, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(2000!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(1/fib(8)).range(200,400),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 164.182402085, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(2000!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(1/fib(8)).range(200,4000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 175.571497627, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(2000!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(1/fib(8)).range(200,14000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 185.120372402, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(2000!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(11/fib(8)).range(200,14000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 191.806563949, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(2000!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(111/fib(8)).range(200,14000),0.5);
  };
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 210.80035911, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(2000!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(111/fib(8)).range(200,14000),0.5);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 231.252445855, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(111/fib(8)).range(200,14000),0.5);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 244.101237967, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(11/fib(8)).range(200,14000),0.5);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 277.914874428, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(11/fib(8)).range(200,14000)+BrownNoise.ar(1!8).range(-4,4),0.5);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 299.428328472, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(11/fib(8)).range(20,8000)+BrownNoise.ar(1!8).range(-4,4),0.5);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 309.687366578, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(200!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(11/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.5);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 313.87154942, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(20!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(11/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.5);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 363.508193333, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(20!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(11/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.5);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 366.391592024, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(20!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(11/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.5);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.25);
};
~saws.play;
);" ],
[ 377.144309418, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(20!2*8);
  5.do{
    sig = BBandPass.ar(sig,LFSaw.ar(11/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.5);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 402.485052043, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(20!2*8);
  5.do{|i|
    sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.5);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 427.314700169, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(20!2*8);
  5.do{|i|
    sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.5);
  };
  sig = Normalizer.ar(sig);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 468.637627864, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(20!2*8);
  5.do{|i|
    sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.5);
  sig = Normalizer.ar(sig);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 485.910963357, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(20!2*8);
  5.do{|i|
    sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
  sig = Normalizer.ar(sig);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig= GVerb.ar(sig);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 492.151003677, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(20!2*8);
  5.do{|i|
    sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
  sig = Normalizer.ar(sig);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig= GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 496.43784681, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(20!2*8);
  5.do{|i|
    sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
  sig = Normalizer.ar(sig);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig= GVerb.ar(sig,100)/8+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 504.881159884, 'me', "(
~saws.quant=2;
~saws.fadeTime=5;
~saws={
  var sig = LFSaw.ar(20!2*8);
  5.do{|i|
    sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
  sig = Normalizer.ar(sig);
  };
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig * Pulse.ar([1,2,3,4]);
  sig= GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~saws.play;
);" ],
[ 522.024984618, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(20!2*8);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = sig * Pulse.ar([1,2,3,4]);
    sig= GVerb.ar(sig,100)/4+sig;
    sig = LPF.ar(sig,400);
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 532.169704268, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(20!2*8);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = sig * Pulse.ar([1,2,3,4]);
    sig= GVerb.ar(sig,100)/4+sig;
    sig = LPF.ar(sig,4000);
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 558.720038797, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(20!2*8);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = sig * Pulse.ar([1,2,3,4]);
    sig= GVerb.ar(sig,100)/4+sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4).exprange(40.001,1000));
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 559.586718577, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(20!2*8);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = sig * Pulse.ar([1,2,3,4]);
    sig= GVerb.ar(sig,100)/4+sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4).exprange(40.001,10000));
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 573.025459505, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(20!2*8);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = sig * Pulse.ar([1,2,3,4]);
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4).exprange(40.001,10000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 589.943937731, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(20!2*8);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4).exprange(40.001,10000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 605.007464225, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(20!2*8);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 642.075507541, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(20!2*8);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!8).exprange(0.002,0.2),2)/4+sig;
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 654.368385178, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(20!2*8);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.002,0.2),1,2)/4+sig;
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 671.349794399, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(20!2*8);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.0002,0.2),1,2)/4+sig;
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 677.054063297, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(20!2*8);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = sig;
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.0002,0.2),1,2)/4+sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 685.029185741, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(20!2*8);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.0002,0.2),1,2)/4+sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 691.095480746, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(2000!2);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.0002,0.2),1,2)/4+sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 699.053579729, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar(1000!2);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.0002,0.2),1,2)/4+sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 704.371264153, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar([1000,200,50]!2);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.0002,0.2),1,2)/4+sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 706.000565036, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar([1000,200,50]);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 713.514481677, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar([1000,200,50,4000]);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.0002,0.2),1,2)/4+sig;
    sig = LPF.ar(sig,4000) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 719.242194843, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar([1000,200,50,4000]);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.0002,0.2),1,2)/4+sig;
    sig = LPF.ar(sig,400) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 725.264783019, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar([1000,200,50,4000]);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.0002,0.2),1,2)/4+sig;
    sig = LPF.ar(sig,400) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,1000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 736.997055924, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar([1000,200,50,4000]);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.0002,0.2),1,2)/4+sig;
    sig = LPF.ar(sig,400) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,2000));
    sig= GVerb.ar(sig,100)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 767.721865093, 'me', "(
  ~saws.quant=2;
  ~saws.fadeTime=5;
  ~saws={
    var sig = LFSaw.ar([1000,200,50,4000]);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(11+i/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.0002,0.2),1,2)/4+sig;
    sig = LPF.ar(sig,400) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,2000));
    sig= GVerb.ar(sig,10)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~saws.play;
);" ],
[ 831.462022484, 'me', "(
  ~squeaks.quant=2;
  ~squeaks.fadeTime=5;
  ~squeaks={
    var sig = LFSaw.ar([1000,200,50,4000]);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(111/(i+1)/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,LFDNoise1.ar(1!8).exprange(0.0002,0.2),1,2)/4+sig;
    sig = LPF.ar(sig,400) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,2000));
    sig= GVerb.ar(sig,10)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~squeaks.play;
);" ],
[ 853.649411236, 'me', "(
  ~squeaks.quant=2;
  ~squeaks.fadeTime=5;
  ~squeaks={
    var sig = LFSaw.ar([1000,200,50,4000]);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(111/(i+1)/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!8).exprange(0.0002,0.2),2)/4+sig;
    sig = LPF.ar(sig,400) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,2000));
    sig= GVerb.ar(sig,10)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~squeaks.play;
);" ],
[ 865.495729422, 'me', "(
  ~squeaks.quant=2;
  ~squeaks.fadeTime=5;
  ~squeaks={
    var sig = LFSaw.ar([1000,200,50,4000]);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(111/(i+1)/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!8).exprange(0.0002,0.2),2)/4+sig;
    sig = Pulse.ar([1,2,4,8]);
    sig = LPF.ar(sig,400) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,2000));
    sig= GVerb.ar(sig,10)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  ~squeaks.play;
);" ],
[ 883.736709753, 'me', "(
  ~squeaks.quant=2;
  ~squeaks.fadeTime=5;
  ~squeaks={
    var sig = LFSaw.ar([1000,200,50,4000]);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(111/(i+1)/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        }