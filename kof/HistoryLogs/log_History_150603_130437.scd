// History, as it was on Wed Jun  3 13:04:37 2015.

[
[ 0, 'me', "  m=ProxySubmix.new(\\filter);" ],
[ 24.053864706, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 34.918937232, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 49.940605602, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*2!8));
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 79.79768545, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*0.25pi!8));
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 89.499498374, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*0.25pi!8+1));
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 96.668626019, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*0.25pi!8));
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 108.943433485, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*0.25pi!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 116.417391294, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*0.25pi!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 123.458826181, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*0.25pi!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 125.263023132, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*0.25pi!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 127.93949248, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*0.25pi!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 135.295175592, 'me', "(
~fil.quant=2;
~fil.fadeTime=2;
~fil={
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.2);
};
~fil.play;
);" ],
[ 172.821010994, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = sig * LFSaw.ar(1/4/fib(4)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 211.642623137, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*0.5pi!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 215.91684929, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*1.5pi!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 222.967005113, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*1.25pi!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 227.725165661, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*1pi!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 236.959029094, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*1pi!8));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 248.415676284, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = LFSaw.ar(50*(_*1pi!8).scramble);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 259.196593841, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(50*(_*1pi!8).scramble);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 264.745715435, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(90*(_*1pi!8).scramble);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 270.527326135, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(100*(_*1pi!8).scramble);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1/2,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 273.949389158, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(100*(_*1pi!8).scramble);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.1],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 278.605186015, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(100*(_*1pi!8).scramble);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 295.703111298, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(100*(_*1pi!8).scramble);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 306.654781239, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(100*1.5*(_*1pi!8).scramble);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 309.391803102, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(100*1.25*(_*1pi!8).scramble);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 312.931967819, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar(100*1.25*(_*2!8).scramble);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 325.49997759, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar((_*2!8).scramble+100*1.25);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 335.158599089, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar((_*2!8).scramble*100*1.25);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 341.596363655, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar((_*2!8).scramble*100*1.5);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 344.943450113, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar((_*2!8).scramble*100*1.75);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 347.870536689, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar((_*2!8).scramble*100*1.25);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 351.861513789, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = SinOsc.ar((_*2!8).scramble*100/1.25pi);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 375.822325521, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = Blip.ar((_*2!8).scramble*100/1.25pi,LFSaw.ar(1/4).exprange(2.001,10));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 391.239654931, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = Blip.ar((_*2!8).scramble*100/1.25pi,LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 398.649331793, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = Blip.ar((_*2!8).scramble*100/1.5pi,LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 405.587416037, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = Blip.ar((_*2!8).scramble*1000/1.5pi,LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 414.432291401, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = Blip.ar((_*2!8).scramble*50/1.5pi,LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 417.428371438, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = Blip.ar((_*2!8).scramble*50/1.25pi,LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.25,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 426.97212857, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = Blip.ar((_*2!8).scramble*50/1.25pi,LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.125,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 432.885761149, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = Blip.ar((_*2!8).scramble*50/1.25pi,LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.5,0.0025],[3,-3]),Impulse.ar(1,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 465.665477303, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = LPF.ar(WhiteNoise.ar(0.1!2),LFSaw.ar(1/4).exprange(10.001,11111));
  sig = sig * LFSaw.ar(1/4/fib(4)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 472.199608096, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = LPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(1/4).exprange(10.001,11111));
  sig = sig * LFSaw.ar(1/4/fib(4)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 475.228122557, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = LPF.ar(WhiteNoise.ar(0.2!2),LFSaw.ar(4).exprange(10.001,11111));
  sig = sig * LFSaw.ar(1/4/fib(4)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 479.56653892, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = LPF.ar(WhiteNoise.ar(0.4!2),LFSaw.ar(4).exprange(10.001,11111));
  sig = sig * LFSaw.ar(1/4/fib(4)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 484.32586581, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = LPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(10.001,11111));
  sig = sig * LFSaw.ar(1/4/fib(4)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 496.636288742, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = Blip.ar((_*2!8).scramble*50/1.25pi,LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * EnvGen.ar(Env([0,1,0],[1.0,0.0025],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 501.631947783, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = Blip.ar((_*2!8).scramble*50/1.25pi,LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * EnvGen.ar(Env([0,1,0],[4.0,0.0025],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 511.354556151, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = Blip.ar((_*2!8).scramble*50/1.25pi,LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * EnvGen.ar(Env([0,1,0],[4.0,0.0025],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 512.420740241, 'me', "(
~one.quant=2;
~one.fadeTime=2;
~one={
  var sig = Blip.ar((_*2!8).scramble*50/1.25pi,LFSaw.ar(1/4/fib(8)).exprange(2.001,10));
  sig = sig * EnvGen.ar(Env([0,1,0],[4.0,0.0025],[3,-3]),Impulse.ar(1/4,(0..7)/8));
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~one,postVol:true);
~one.play;
);" ],
[ 650.963886438, 'me', "~fil.stop(7);" ],
[ 681.358339358, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = LPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(10.001,11111));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4)) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 685.957345284, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = LPF.ar(WhiteNoise.ar(0.7!2),LFSaw.ar(4).exprange(10.001,11111));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4)) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 693.258151016, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = LPF.ar(WhiteNoise.ar(0.8!2),LFSaw.ar(4).exprange(10.001,11111));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1,(0..3)/4)) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 700.029125658, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = LPF.ar(WhiteNoise.ar(0.8!2),LFSaw.ar(4).exprange(10.001,11111));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1/2,(0..3)/4)) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 705.878020536, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = LPF.ar(WhiteNoise.ar(0.8!2),LFSaw.ar(4).exprange(10.001,1111));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1/2,(0..3)/4)) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 710.778161874, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.8!2),LFSaw.ar(4).exprange(10.001,1111));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1/2,(0..3)/4)) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 714.357951534, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.8!2),LFSaw.ar(4).exprange(10.001,11111));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1/2,(0..3)/4)) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 719.406901968, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.8!2),LFSaw.ar(1/4/fib(8)).exprange(10.001,11111));
  sig = sig * EnvGen.ar(Env([0,1,0],[0.002,1],[3,-3]),Impulse.ar(1/2,(0..3)/4)) ;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 733.804389921, 'me', "~one.stop(7);" ],
[ 743.089021446, 'me', "~comp.stop(7);" ],
[ 752.073585568, 'me', "~hiss.stop(7);" ],
];