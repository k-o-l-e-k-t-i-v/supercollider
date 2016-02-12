// History, as it was on Sat Jun 20 03:31:36 2015.

[
[ 0, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(50!2);
  sig = sig* LFSaw.ar(1/4).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 17.47035121, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(50!2);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 32.149178747, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(60.midicps*2/pi);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 39.101234699, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([60,55].midicps*2/pi);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 42.190797576, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([60,55,56].midicps*2/pi);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 44.153239199, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([60,55,56,58].midicps*2/pi);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 57.828134168, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([60,55,56,63].midicps*2/pi);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 63.317383522, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([60,55,56,65].midicps*2/pi);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 68.654672968, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([60,55,54,65].midicps*2/pi);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 75.470909271, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([60,55,54,65].midicps*[1,2,4]/pi);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 81.603732724, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([60,55,54,61].midicps*[1,2,4]/pi);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 88.207672895, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([60,55,54,72].midicps*[1,2,4]/pi);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 103.497672474, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar([60,55,54,72]+[0,12].midicps*[1,2,4]/pi);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 111.543255034, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,72]+[0,12]).midicps*[1,2,4]/pi);
  sig = sig* LFSaw.ar(1/4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 134.078972162, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,72]+[0,12]).midicps*[1,2,4]/pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 148.465112529, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,72]+[0,12]-12).midicps*[1,2,4]/pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 154.867672939, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,72]+[0,12]-7).midicps*[1,2,4]/pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 163.429067327, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,72]+[0,12]).midicps*[1,1.5,4]/pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 169.14985102, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,72]+[0,12]).midicps*[1,1.5,2]/pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 178.994533725, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,72]+[0,12]).midicps*[1,1.5,2]/pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 206.161240978, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,72]+[0,12]).midicps*[1,1.5,2]/pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 212.530555594, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,72]+[0,12]).midicps*[1,1.5,2]/pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 301.71495744, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,72]+[0,12]).midicps*[1,1.5,2]/0.5pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 310.528612427, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,72]+[0,12]).midicps*[1,1.5,2]/1.5pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 319.444456296, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54]+[0,12]).midicps*[1,1.5,2]/1.5pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 323.044953, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54]+[0,12]).midicps*[1,1.5,2]/1pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 325.690371171, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54]+[0,12]).midicps*[1,1.5,2,4]/1pi);
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 337.632017554, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54]+[0,12]).midicps*([1,1.5,2,4]/1pi));
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 347.422018811, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54]+[0,-12]).midicps*([1,1.5,2,4]/1pi));
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 350.439328913, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54]+[0,-24]).midicps*([1,1.5,2,4]/1pi));
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 355.422548301, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,65]+[0,-24]).midicps*([1,1.5,2,4]/1pi));
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 359.872466918, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,65,58]+[0,-24]).midicps*([1,1.5,2,4]/1pi));
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 365.890752314, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,58]+[0,-24]).midicps*([1,1.5,2,4]/1pi));
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 372.230091762, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,58]+[0,-12]).midicps*([1,1.5,2,4]/1pi));
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 378.282851613, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,58]+[0,24]).midicps*([1,1.5,2,4]/1pi));
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) ;
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 432.724817903, 'me', "(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var sig = LFSaw.ar(([60,55,54,58]+[0,24]).midicps*([1,1.5,2,4]/1pi));
  sig = sig* LFSaw.ar(4/fib(8)).exprange(0.001,1) * Pulse.ar([1,2,3,4]);
  sig = LPF.ar(sig,800) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,10000));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);" ],
[ 462.177013349, 'me', "(
  ~groove.quant=2;
  ~groove.fadeTime=5;
  ~groove={
    var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
    sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
    sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
    sig = CompanderD.ar(sig,4/3,1/2,1/2);
    sig = sig + (sig*Pulse.ar(2)/8);
    sig = GVerb.ar(sig,11)/4+sig + (LFSaw.ar(14000/(1..8),mul:0.1)*LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
    sig = CompanderD.ar(sig,4/3,1/1.25,1/1.25);
    Splay.ar(sig.flat,0.25,0.25);
  };
  ~groove.play;
);" ],
[ 466.405217244, 'me', "thisProcess.stop;" ],
[ 466.899261064, 'me', "(
  ~groove.quant=2;
  ~groove.fadeTime=5;
  ~groove={
    var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
    sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
    sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
    sig = CompanderD.ar(sig,4/3,1/2,1/2);
    sig = sig + (sig*Pulse.ar(2)/8);
    sig = GVerb.ar(sig,11)/4+sig + (LFSaw.ar(14000/(1..8),mul:0.1)*LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
    sig = CompanderD.ar(sig,4/3,1/1.25,1/1.25);
    Splay.ar(sig.flat,0.25,0.25);
  };
  ~groove.play;
);" ],
[ 562.389222402, 'me', "thisProcess.stop;" ],
[ 579.098853482, 'me', "thisProcess.stop;" ],
[ 595.480036289, 'm