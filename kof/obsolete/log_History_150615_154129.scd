// History, as it was on Mon Jun 15 15:41:29 2015.

[
[ 0, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 194.912815468, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/4).exprange(1.001,10));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 203.795874896, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/8).exprange(1.001,10));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 209.039068291, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(4).exprange(1.001,10));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 217.853371361, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(4).exprange(1.001,10));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 271.077778415, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/8).exprange(1.001,10));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 273.583208767, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/8/fib(8)).exprange(1.001,10));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 282.449371537, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/8/fib(8)).exprange(1.001,10).round(2));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 284.695480726, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/8/fib(8)).exprange(1.001,100).round(2));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 295.471294155, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/8/fib(8)).exprange(1.001,100).round(2));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 311.471359713, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/8/fib(8)).exprange(1.001,100).round(2));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 329.268978301, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/fib(8)).exprange(1.001,100).round(2));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 368.813172993, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/fib(8)).exprange(1.001,100).round(2));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,SinOsc.ar(1/4).exprange(100.001,1000));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 387.693737594, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/fib(8)).exprange(1.001,100).round(2));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,SinOsc.ar(1/4/fib(8)).exprange(100.001,10000));
  sig = GVerb.ar(sig,100)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 412.179169146, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/fib(8)).exprange(1.001,100).round(2));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,SinOsc.ar(1/4/fib(8)).exprange(100.001,10000));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 422.112700635, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/fib(8)).exprange(1.001,100).round(2));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,SinOsc.ar(1/4/fib(8)).exprange(100.001,10000));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 432.897716947, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var sig = Blip.ar(72!2,LFSaw.ar(1/fib(8)).exprange(1.001,100).round(2));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,SinOsc.ar(1/4/fib(8)).exprange(100.001,10000));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 577.852903172, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,432,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = Blip.ar(fenv!2,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = BPF.ar(sig,EnvGen.ar(Env([50,5000,50],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,[10,11,12,14])/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 588.987861359, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,432,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = Blip.ar(fenv!2,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = BPF.ar(sig,EnvGen.ar(Env([50,500,50],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,[10,11,12,14])/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 595.929930706, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,432,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = Blip.ar(fenv!2,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = BPF.ar(sig,EnvGen.ar(Env([50,500,50],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,[10,11,12,14])/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 599.885846441, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,432,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = Blip.ar(fenv!2,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,50],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,[10,11,12,14])/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 601.728101744, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,432,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = Blip.ar(fenv!2,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,[10,11,12,14])/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 628.140588156, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,432,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = Blip.ar(fenv!2,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 634.497704901, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,432,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = Blip.ar(fenv!2,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 662.083520256, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,432,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = Blip.ar(fenv!2,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 671.760343206, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,432,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = Blip.ar(fenv!2,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 675.413767874, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,432,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = Blip.ar(fenv!2,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 722.8210592, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,432,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 727.12420134, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 740.280605026, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 785.011606038, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4)).round(4320/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 792.538409404, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4)).round(4320/8pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 821.15990365, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4)).round(4320/4pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 828.64200413, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4)).round(4320/1.5pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 839.73852146, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(4320/1.5pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 854.655907308, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(4320/8pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 860.73131705, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(4320/4pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 883.134784174, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(4320/2pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 897.581505461, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/2pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 915.383801144, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/2pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 921.412603268, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/2pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(2);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,500,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 926.510312313, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/2pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(2);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,5000,70],[0.5,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 933.097583097, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/2pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(2);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,5000,70],[0.05,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 938.380699402, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/2pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(2);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,5000,70],[0.05,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 940.634010148, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/2pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(2);
  sig = BPF.ar(sig,EnvGen.ar(Env([70,5000,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 946.788983596, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/2pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(2);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 954.738378493, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/2pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 958.082996303, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1) * Pulse.ar(4);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 961.197071292, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 973.854049593, 'me', "thisProcess.stop;" ],
[ 1013.537825066, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1021.371301342, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1033.742126812, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[1.02,1.25],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1039.550039981, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.02,1.25],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1045.966433582, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.002,1.25],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,40));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1060.477064135, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.002,1.25],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,80));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1065.198942207, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.002,1.25],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,8));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1077.857938195, 'me', "thisProcess.stop;" ],
[ 1082.503601018, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.002,1.25],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,8));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1091.925417592, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.002,1.25],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,8));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,100)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1093.672478818, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.002,1.25],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,8));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1105.254972898, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.002,0.25],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,8));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1114.788184504, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.002,0.025],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,8));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1117.194207358, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([72,4320,60],[0.002,0.025],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,8));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1125.759704338, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([4320,90,60],[0.002,0.025],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,8));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1133.866546437, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([4320,90,60],[0.02,0.025],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,8));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1138.333930185, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([4320,90,60],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,8));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1145.593078044, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([4320,90,60],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,80));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1152.780967636, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([4320,90,60],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,80));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([500,90,70],[0.005,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1157.656404152, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([4320,90,60],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,80));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([500,90,70],[0.05,0.5],[3,-3]),Impulse.ar(4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1163.862400014, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([4320,90,60],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,80));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([500,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1198.678827803, 'me', "~test.stop(7);" ],
[ 1211.967451239, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1220.689710695, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1225.414921966, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2) * Pulse.ar(1);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1234.742747495, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~fil.play;
);" ],
[ 1239.030765836, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~fil.play;
);" ],
[ 1242.973124001, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.01);
};
~fil.play;
);" ],
[ 1252.45377629, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2) * Pulse.ar(2);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1256.064579399, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2) * Pulse.ar(1);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1261.969826329, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2) * Pulse.ar([1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1268.443821766, 'me', "thisProcess.stop;" ],
[ 1316.182351231, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2) * Pulse.ar([1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1320.929752735, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~fil.play;
);" ],
[ 1330.573302886, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~fil.play;
);" ],
[ 1336.515238921, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.001,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.1);
};
~fil.play;
);" ],
[ 1342.071771102, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2) * Pulse.ar(1/[1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1346.327103741, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2) * Pulse.ar(2/[1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1353.785349955, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = WhiteNoise.ar(0.1!2) * Pulse.ar(4/[1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1365.318105424, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = HPF.ar(WhiteNoise.ar(0.1!2),[1,2,4,8]*1000) * Pulse.ar(4/[1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1376.316143358, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = HPF.ar(WhiteNoise.ar(0.1!2),[1,2,4,8]*2000) * Pulse.ar(4/[1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1379.693181209, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.1!2),[1,2,4,8]*2000) * Pulse.ar(4/[1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1382.88809552, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.2!2),[1,2,4,8]*2000) * Pulse.ar(4/[1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1386.080052751, 'me', "thisProcess.stop;" ],
[ 1514.794746696, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.2!2),[1,2,4,8]*2000) * Pulse.ar(4/[1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1538.275612667, 'me', "thisProcess.stop;" ],
[ 1671.284341099, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.2!2),[1,2,4,8]*2000) * Pulse.ar(4/[1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1681.037010475, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.2!2),[1,2,4,8]*2000) * Pulse.ar(1/[1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1688.388244198, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.001,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.5);
};
~fil.play;
);" ],
[ 1698.184656149, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([4320,90,60],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,80));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([500,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.0005);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1706.215006989, 'me', "~test.stop(7);" ],
[ 1713.418152037, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.2!2),[1,2,4,8]*2000) * Pulse.ar(1/4/[1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1727.663777393, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.2!2),[1,2,4,8]*200) * Pulse.ar(1/4/[1,2,3,4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1733.989540419, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.001,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.5);
};
~fil.play;
);" ],
[ 1757.601688128, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.2!2),[1,2,4,8]*200) * Pulse.ar(1/4/[1,2,3,1/4]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1762.637215491, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.2!2),[1,2,4,8]*200) * Pulse.ar(1/4/[1,2,3,1/4,1/16]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1769.816137411, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.2!2),[1,2,4,80]*200) * Pulse.ar(1/4/[1,2,3,1/4,1/16]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1777.337900071, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = BPF.ar(WhiteNoise.ar(0.2!2),[100,2,4,80]*200) * Pulse.ar(1/4/[1,2,3,1/4,1/16]);
  sig = sig.softclip;
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 1797.812830898, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.001,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~fil.play;
);" ],
[ 1803.725028009, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.001,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 1819.388530545, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([4320,90,60],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,80));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([500,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.015);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1831.742128632, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([4320,90,60],[0.02,0.25],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,80));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([500,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.045);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1846.538964126, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([432,90,60],[0.02,5],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,80));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([500,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.045);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1853.280290319, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([432,90,60],[0.02,5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,80));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([500,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.045);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1856.493005959, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([432,90,60],[0.02,5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/fib(8)).exprange(1.001,20));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([500,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.045);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1860.647634558, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([432,90,60],[0.02,5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(1.001,20));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([500,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.045);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1863.067316389, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([432,90,60],[0.02,5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(1.001,20));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.045);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1880.40688463, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([432,90,60],[0.02,5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(1.001,20));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  //sig = GVerb.ar(sig,10)/4+sig;
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.045);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1883.517048935, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([432,90,60],[0.02,5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(1.001,20));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  //sig = GVerb.ar(sig,10)/4+sig;
  //sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.045);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1889.912043593, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([432,90,60],[0.02,5],[3,-3]),Impulse.ar(1/4,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(1.001,20));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  //sig = GVerb.ar(sig,10)/4+sig;
  //sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.045);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1899.467697152, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([432,90,60],[0.02,5],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(1.001,20));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/4/fib(4),(0..3)/4)));
  //sig = GVerb.ar(sig,10)/4+sig;
  //sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.045);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1902.844620687, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([432,90,60],[0.02,5],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(1.001,20));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  //sig = GVerb.ar(sig,10)/4+sig;
  //sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.045);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1910.206733276, 'me', "(
~test.quant=2;
~test.fadeTime=5;
~test={
  var fenv = EnvGen.ar(Env([432,90,60],[0.02,0.5],[3,-3]),Impulse.ar(1,(0..3)/4)).round(432/pi);
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(1.001,20));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = BPF.ar(sig,EnvGen.ar(Env([5000,90,70],[0.05,0.5],[3,-3]),Impulse.ar(1/fib(4),(0..3)/4)));
  //sig = GVerb.ar(sig,10)/4+sig;
  //sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.045);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 1942.160764611, 'me', "(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\\filter);
);" ],
[ 1968.51714218, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar(60.midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 1974.811402196, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar(60.midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/4,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 1983.140779591, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar(60.midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/16,(0..3)/4));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2002.546719666, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar(60.midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/16,[1,2,8,9,11]/16));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2012.10995666, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar(60.midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/16,[1,2,8,9]/16));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2018.059172766, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar(60.midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/16,[1,2,8,9]/16));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2024.783093166, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar((60+24).midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/16,[1,2,8,9]/16));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2032.082024692, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar((60+[24,24+5]).midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/16,[1,2,8,9]/16));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2053.914824643, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar((60+[24,24+5]).midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/16,[1,1.1,8,8.1]/16));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2064.1602139, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar((60+[24,24+5]).midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,0.1],[3,-3]),Impulse.ar(1/16,[1,1.5,8,8.5]/16));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2072.410929734, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar((60+[24,24+5]).midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1/16,[1,1.5,8,8.5]/16));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2079.465985464, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar((60+[24,24+3]).midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1/16,[1,1.5,8,8.5]/16));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2086.869286521, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1/16,[1,1.5,8,8.5]/16));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2104.540084293, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  sig = sig * EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1/8,[1,1.5,8,8.5]/16));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2211.987357717, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1/8,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1/8,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-24-7]).midicps,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2230.660648129, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1/4,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1/4,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-24-7]).midicps,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2237.265151201, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1/2,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1/2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-24-7]).midicps,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2255.077958262, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-24-7]).midicps,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2264.222112064, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-24-5]).midicps,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2276.704962843, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7]).midicps,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2281.115796932, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]).midicps,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2287.960473527, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(1,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2300.01923277, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(2,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2305.303893929, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(2,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2309.702396617, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2316.493501704, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.025],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2322.788235107, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.02,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2326.142002903, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2330.378330497, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2340.13687886, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-12).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2343.202538527, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-24).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2347.85721893, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-36).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2352.805923314, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-36).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]-24).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2359.328653868, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-36).midicps);
  var sig2 = LFSaw.ar((60+[-12,-12+7+7]+12).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2392.853412713, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-36).midicps);
  var sig2 = LFSaw.ar((60+TExpRand(0.001,36,Impulse.ar(1/4!2)).round(7)).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2398.609535516, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-36).midicps);
  var sig2 = LFSaw.ar((60+TExpRand.ar(0.001,36,Impulse.ar(1/4!2)).round(7)).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2422.929642202, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-36).midicps);
  var sig2 = SinOsc.ar((60+TExpRand.ar(0.001,24,Impulse.ar(1/4!2)).round(7)).midicps/0.25pi,mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2458.0824073, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-36).midicps);
  var sig2 = SinOsc.ar((60+TExpRand.ar(0.001,24,Impulse.ar(1/4!2)).round(7)).midicps/TExpRand.ar(0.001,8pi,Impulse.ar(1/4!2)).round(0.25pi),mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2470.757107497, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-36).midicps);
  var sig2 = SinOsc.ar((60+TExpRand.ar(0.001,24,Impulse.ar(1/4!2)).round(7)).midicps/TExpRand.ar(0.001,8pi,Impulse.ar(4!2)).round(0.25pi),mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2480.908462593, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-36).midicps);
  var sig2 = SinOsc.ar((60+TExpRand.ar(0.001,24,Impulse.ar(1/4!2)).round(7)).midicps/TExpRand.ar(0.001,8pi,Impulse.ar(1!2)).round(0.25pi),mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2498.430121555, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-36).midicps);
  var sig2 = SinOsc.ar((60+TExpRand.ar(0.001,24,Impulse.ar(1/2!2)).round(7)).midicps/TExpRand.ar(0.001,8pi,Impulse.ar(1/2!2)).round(0.25pi),mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2504.750647063, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-36).midicps);
  var sig2 = SinOsc.ar((60+12+TExpRand.ar(0.001,24,Impulse.ar(1/2!2)).round(7)).midicps/TExpRand.ar(0.001,8pi,Impulse.ar(1/2!2)).round(0.25pi),mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2522.104096752, 'me', "(
~pink.quant=2;
~pink.fadeTime=5;
~pink={
  var one = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(1,[1,1.5,8,8.5]/16));
  var two = EnvGen.ar(Env([0,1,0],[0.25,0.25],[3,-3]),Impulse.ar(2,[1.5,1.75,8.5,8.75]/16));
  var sig = SinOsc.ar((60+[24,-24]-36).midicps);
  var sig2 = SinOsc.ar((60+12+TExpRand.ar(0.001,24,Impulse.ar(1/2!2)).round(7)).midicps/TExpRand.ar(0.001,8pi,Impulse.ar(1/2!2)).round(0.25pi).lag(1/4),mul:0.2);
  sig = sig * one;
  sig = sig + (sig2 *  two);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~pink,postVol:true);
~pink.play;
);" ],
[ 2643.543870437, 'me', "thisProcess.stop;" ],
[ 2645.746507395, 'me', "(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\\filter);
);" ],
[ 2686.03233592, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2766.068498064, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) + (SinOsc.ar(4000,mul:0.1)*Pulse.ar(1/4));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2777.981651029, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) + (SinOsc.ar(4000,mul:0.1)*Pulse.ar(1/8));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2787.681748761, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) + (SinOsc.ar(4000,mul:0.1)*Pulse.ar(1/8,pi));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2805.901295875, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) + (SinOsc.ar(4000,mul:0.1)*Pulse.ar(1/4));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2822.236020355, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) + (SinOsc.ar(4000,mul:0.1)*Decay.ar(Impulse.ar(1/8),1));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2834.826690865, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) + (SinOsc.ar(4000,mul:0.2)*Decay.ar(Impulse.ar(1/8),1));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2839.266125958, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) + (SinOsc.ar(4000,mul:0.2)*Decay.ar(Impulse.ar(1/8,0.5),1));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2858.648400406, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) + (SinOsc.ar(4000,mul:0.2)*Decay.ar(Impulse.ar(1/4,0.25),1));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2869.719354195, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) + (SinOsc.ar(4000,mul:0.2)*Decay.ar(Impulse.ar(1/4,0),1));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2883.222089347, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) + (SinOsc.ar(4000,mul:0.2)*Decay.ar(Impulse.ar(1/4,pi),1));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2892.24656461, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) + (SinOsc.ar(4000,mul:0.2)*Decay.ar(Impulse.ar(1/4),1));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2928.970575472, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) ;
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = sig + (SinOsc.ar(4000,mul:0.2)*Decay.ar(Impulse.ar(1/4),1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2974.078366387, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2) ;
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = sig + (SinOsc.ar(4000,mul:0.2)*Decay.ar(TDelay.ar(Impulse.ar(1/4),1/(1..10)),0.1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 2991.944612896, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = sig + (SinOsc.ar(4000,mul:0.2)*Decay.ar(TDelay.ar(Impulse.ar(1/4),1/(1..10)),0.1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3021.508993877, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = sig + (SinOsc.ar(4000,mul:0.2)*Decay.ar(TDelay.ar(Impulse.ar(1/4,-0.5),1/(1..10)),0.1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3034.397726625, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = sig + (SinOsc.ar(4000,mul:0.2)*Decay.ar(TDelay.ar(Impulse.ar(1/4,-0.5),1/(1..10)),0.1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3051.425610553, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = sig + (SinOsc.ar(4000+(1..10),mul:0.2)*Decay.ar(TDelay.ar(Impulse.ar(1/4,-0.5),1/(1..10)),0.1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3063.046818542, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = sig + (SinOsc.ar(14000+(1..10),mul:0.2)*Decay.ar(TDelay.ar(Impulse.ar(1/4,-0.5),1/(1..10)),0.1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3078.182473573, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(1/4,-0.5),1/(1..10)),0.1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3155.24708835, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/4;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo/fib(8)).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo/fib(8),-0.5),1/(1..10)),0.1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3197.458692903, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/2;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3260.392099509, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/2;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + (BrownNoise.ar(0.1!2)*Decay.ar(Impulse.ar(tempo,-0.5),1/2));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3278.158959338, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/2;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + (BrownNoise.ar(0.1!2)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3290.459477841, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.05);
};
~fil.play;
);" ],
[ 3307.500539896, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.05);
};
~fil.play;
);" ],
[ 3316.132719909, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/2;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + (PinkNoise.ar(0.1!2)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3330.198622184, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/2;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++WhiteNoise.ar(0.1)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3354.413898331, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++WhiteNoise.ar(0.1)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3364.807427034, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++WhiteNoise.ar(0.1)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3422.013422169, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++WhiteNoise.ar(0.1)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFSaw.ar(70,mul:0.1)*LFSaw.ar(1/4).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3434.03246893, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++WhiteNoise.ar(0.1)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFSaw.ar(70,mul:0.1)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3442.721277148, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++WhiteNoise.ar(0.1)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFSaw.ar(70,mul:0.01)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3453.758173933, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++WhiteNoise.ar(0.1)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFPulse.ar(50,mul:0.01)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3459.709066727, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++WhiteNoise.ar(0.1)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFPulse.ar(50,mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3474.992906859, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++WhiteNoise.ar(0.05)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFPulse.ar(50,mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3485.047919221, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.05),5000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFPulse.ar(50,mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3497.665574293, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),5000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFPulse.ar(50,mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3499.506887862, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(10000+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFPulse.ar(50,mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3533.69874124, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 3607.189806324, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TExpRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFPulse.ar(50,mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3647.235866803, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFPulse.ar(50,mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3710.134260637, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFPulse.ar(50,SinOsc.kr(11).range(-pi,pi),mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3729.612639908, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFPulse.ar(50,SinOsc.kr(1/4).range(-pi,pi),mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3732.338892312, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (LFPulse.ar(50,SinOsc.kr(1/4).range(-pi,8pi),mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3752.423921904, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (VarSaw.ar(50,SinOsc.kr(1/4).range(-pi,8pi),mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3774.327354608, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (VarSaw.ar(50,SinOsc.kr(1/4).range(-pi,8pi),mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat.distort,0.25,0.5);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 3853.57132655, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,1,LFDNoise1.ar(4).exprange(0.001,0.1),2) * LFDNoise0.ar(1/4).range(0.001,0.1) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 3880.344636085, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,1,LFDNoise1.ar(4).exprange(0.0001,0.1),2) * LFDNoise0.ar(1/4).range(0.001,0.1) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 3884.248340143, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,1,LFDNoise1.ar(4).exprange(0.0001,0.1),1) * LFDNoise0.ar(1/4).range(0.001,0.1) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 3890.151207718, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(4).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4).range(0.001,0.1) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 3896.464791518, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(4).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4).exprange(0.001,0.1) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 3900.897648659, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(4).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4).exprange(0.001,0.2) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 3908.140305673, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(4).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(4).exprange(0.001,0.2) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 3932.804659345, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(4).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4).exprange(0.001,0.2) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 3935.469183481, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(4).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.2) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 3949.903563615, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.2) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 3954.024684918, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.2) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.15);
};
~fil.play;
);" ],
[ 4066.252178495, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.2) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~fil.play;
);" ],
[ 4332.668836532, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.4) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~fil.play;
);" ],
[ 4342.553961281, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(72!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (VarSaw.ar(50,SinOsc.kr(1/4).range(-pi,8pi),mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat.distort,0.25,0.75);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 4358.282678669, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(70!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (VarSaw.ar(50,SinOsc.kr(1/4).range(-pi,8pi),mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat.distort,0.25,0.75);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 4437.037393024, 'me', "~lalala.stop(7);" ],
[ 4449.263389545, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(70!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (VarSaw.ar(50,SinOsc.kr(1/4).range(-pi,8pi),mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat.distort,0.25,0.00075);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 4456.356129657, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4485.214371603, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = LFSaw.ar(50*[1,2,1.5]);
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4502.754944565, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = LFSaw.ar(50*[1,1.25,1.5]);
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4517.548492249, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = LFSaw.ar(60.midicps*2/([1,1.25,1.5]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4538.304637827, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = LFSaw.ar(60.midicps*2/([1,1.25,1.5]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4545.61744255, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = LFSaw.ar(60.midicps*2/([1,1.25,1.5]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4553.565463946, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(60.midicps*2/([1,1.25,1.5]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4582.949677575, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(60.midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4592.57028889, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(72.midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4606.129801757, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar((72+12).midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4616.426636935, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar((72-7).midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4619.63284102, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar((72-5).midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4625.0781558, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar((72).midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4632.42566098, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar((72).midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.0005);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4638.313570174, 'me', "~fil.stop(7);" ],
[ 4670.870206952, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = WhiteNoise.ar(0.1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4682.127886434, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = WhiteNoise.ar(0.2!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4687.444847766, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = WhiteNoise.ar(0.2!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4696.650276872, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = WhiteNoise.ar(0.2!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4703.836815626, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = WhiteNoise.ar(0.4!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4717.92502801, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.4!2),[2000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4723.744141591, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[2000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4735.946830479, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[2000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),0.2);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4745.889962974, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[2000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4754.413267122, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4786.051901321, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.2)*Pulse.ar(4));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4790.260776697, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.2)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4794.287408905, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.02)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4798.166554811, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.02)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4804.177757206, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.4) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~fil.play;
);" ],
[ 4813.556835029, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.4) );
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~fil.play;
);" ],
[ 4819.268163298, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.4) );
  sig = GVerb.ar(sig,20);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~fil.play;
);" ],
[ 4826.610612929, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[1200,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.02)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4833.688488844, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(70!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (VarSaw.ar(50,SinOsc.kr(1/4).range(-pi,8pi),mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat.distort,0.25,0.075);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 4838.692650046, 'me', "(
~lalala.quant=2;
~lalala.fadeTime=5;
~lalala={
  var tempo = 1/8;
  var sig = SinOsc.ar(70!2,mul:0.9) ;
  sig = sig * LFSaw.ar(tempo).exprange(0.001,1);
  sig = sig + (SinOsc.ar(1000*TRand.ar(1,10,Impulse.ar(1/4)).round(2)+(1..10),mul:0.4)*Decay.ar(TDelay.ar(Impulse.ar(tempo,-0.5),1/(1..10)),0.1));
  sig = sig + ([]++PinkNoise.ar(0.1)++HPF.ar(WhiteNoise.ar(0.1),15000)*Decay.ar(Impulse.ar(tempo,[-0.5,0]),1/2));
  sig = sig + (VarSaw.ar(50,SinOsc.kr(1/4).range(-pi,8pi),mul:0.05)*LFSaw.ar(tempo).exprange(0.001,1));
  Splay.ar(sig.flat.distort,0.25,0.175);
};
e.addMix(~lalala,postVol:true);
~lalala.play;
);" ],
[ 4860.625013086, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar((72).midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.0005);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4870.372758526, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar((72).midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4876.296578516, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar((72).midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4889.938796457, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.4) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.25);
};
~fil.play;
);" ],
[ 4892.465351734, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.4) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.025);
};
~fil.play;
);" ],
[ 4896.067945777, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.4) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.025);
};
~fil.play;
);" ],
[ 4898.121607595, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.4) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 4911.444026604, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 4920.923326255, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[1200,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.02)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.005);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4926.469396486, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[1200,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.02)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.05);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4932.257855398, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[1200,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.02)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4935.547002546, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.02)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 4951.01876319, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,60]).midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4956.417337055, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,60,60-7,65]).midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4960.25876039, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,60,60-7,65]).midicps*2/([1,1.25,1.75]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4971.914529516, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,60,60-7,65]).midicps*2/([1,1.25,1.5,0.5]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 4983.545365857, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,60,60-7,65]).midicps*1.5/([1,1.25,1.5,0.5]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 5003.437585124, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,60,60-7,65]).midicps*1.5/([1,1.25,1.5,0.5]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 5009.697426638, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,60,60-7,65]).midicps*2/([1,1.25,1.5,0.5]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 5014.075420785, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.7!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.02)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 5026.784272835, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 5029.432652087, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/1.1,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 5034.445429287, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
  sig = GVerb.ar(sig,100);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 5037.221419624, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 5056.930692839, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.02)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 5062.142491507, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.2)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 5068.715018765, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.12)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 5070.610084602, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.0012)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 5074.715977004, 'me', "(
~www.quant=2;
~www.fadeTime=5;
~www={
  var sig = HPF.ar(WhiteNoise.ar(0.2!2),[12000,8000]);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.2);
  sig = sig + (SinOsc.ar(70,mul:0.12)*Pulse.ar(2));
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~www,postVol:true);
~www.play;
);" ],
[ 5082.823741862, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
 // sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 5098.319798126, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
 // sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,120),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 5100.161410289, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
 // sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,120),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 5108.319229371, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(1/8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
 // sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,120),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 5118.226250661, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(1/8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
  sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,120),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 5128.091029119, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(1/8!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
 // sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,120),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 5143.09666368, 'me', "(
~fil.quant=2;
~fil.fadeTime=5;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = sig + (CombN.ar(sig,0.5,LFDNoise1.ar(1!2).exprange(0.0001,0.1),0.5) * LFDNoise0.ar(1/4!2).exprange(0.001,0.5) );
 // sig = GVerb.ar(sig,10);
  low = CompanderD.ar(LPF.ar(sig,120),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.125);
};
~fil.play;
);" ],
[ 5150.213770707, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,63,60-7,65]).midicps*2/([1,1.25,1.5,0.5]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 5153.257153272, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,63,60-7,65]).midicps*1.5/([1,1.25,1.5,0.5]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 5157.864859606, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,63,60-7,65]).midicps*1.25/([1,1.25,1.5,0.5]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 5170.870032092, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,63,60-7,65]).midicps*4/([1,1.25,1.5,0.5]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 5176.988697261, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,63,60-7,65]).midicps*2/([1,1.25,1.5,0.5]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 5180.41064196, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=5;
~hiss={
  var sig = SinOsc.ar(([72,63,60-7,65]).midicps*2/([1,1.25,1.5,0.25]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.35);
};
e.addMix(~hiss,postVol:true);
~hiss.play;
);" ],
[ 5183.529792937, 'me', "~hiss.stop(7);" ],
[ 5184.833003042, 'me', "~lalala.stop(7);" ],
[ 5186.19872666, 'me', "~www.stop(7);" ],
[ 5188.728320263, 'me', "~fil.stop(7);" ],
];