// History, as it was on Sat Jun 20 03:44:11 2015.

[
[ 0, 'me', "(
~a.play;
~melod.quant=2;
~a.quant=2;
~melod={Duty.kr(8,0,Dseq([1,1.5,2,1.5,1,2],inf)).lag(1)};
)" ],
[ 1.663422103, 'me', "(
~a={
  var sig;

  sig = SinOsc.ar(43.2*~melod*(1.0001*(1..8)),mul:0.5);
  sig = sig * Decay.ar(Impulse.ar(4/fib(8)),4);
  sig = sig + ( HPF.ar(WhiteNoise.ar(0.06!4),TRand.ar(1200,12000,Impulse.ar(8!4))) * Pulse.ar(8/fib(4)));
  sig = sig + PitchShift.ar((LFSaw.ar(4320*(~melod.lag(2)*1.5)*(1.0001**(1..8)),mul:LFTri.ar(1/fib(8)).exprange(0.2,0.001))),SinOsc.ar(1/8).range(0.001,0.2));
  sig = CompanderD.ar(sig,0.5,1/1.5,1/6,0.01,0.01);
  sig = DelayL.ar(sig,0.1,SinOsc.ar(4/(1..8)).range(0.00001,0.01));
  sig = AllpassL.ar(sig,0.1,SinOsc.ar(1/8/(1..8)).range(0.00001,0.01));
  sig = FreeVerb.ar(sig,0.1,10);

  
  Splay.ar(sig);
};
)" ],
[ 128.989224095, 'me', "thisProcess.stop;" ],
[ 130.415360802, 'me', "(
~fun.quant=2;
~fun.fadeTime=2;
~fun={
    var mod = Duty.kr(4,0,Dseq([1,2,4,8]*0.25pi,inf));
    var sig = (Blip.ar(43.2,[10,20,40,80,2]) ++ LFSaw.ar(SinOsc.ar(11).range(432/mod,4320/mod),mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ LFSaw.ar(50) ++ SinOsc.ar(10000/mod,mul:0.2)).scramble;
    sig = sig * (Decay.ar(Impulse.ar(2/[2,4],(0..7)++[0.25,0.5,0.75]/8),[2,3,4]/2));
    sig = sig * LFDNoise1.ar(1/4!8);
    sig = Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(80.001,16000));
    sig = GVerb.ar(sig,[10,20,100,8])/2+sig;
    sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,1);
};
~fun.play;
);" ],
[ 162.168949786, 'me', "thisProcess.stop;" ],
[ 229.304108767, 'me', "(
~melody.quant=2;
~melody.fadeTime=5;
~melody={
    var mel = Duty.kr(1,0,Dseq([55,58,54,56,60],inf));
    var sig = SinOsc.ar(mel.midicps!2,mul:LFDNoise1.ar(1)) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 244.274807801, 'me', "(
~melody.quant=2;
~melody.fadeTime=5;
~melody={
    var mel = Duty.kr(1,0,Dseq([55,58,54,56,60],inf));
    var sig = SinOsc.ar(mel.midicps!2,mul:LFDNoise1.ar(1).range(0.01,0.2)) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 260.287317877, 'me', "(
~melody.quant=2;
~melody.fadeTime=5;
~melody={
    var mel = Duty.kr(1/4,0,Dseq([55,58,54,56,60],inf));
    var sig = SinOsc.ar(mel.midicps!2,mul:LFDNoise1.ar(1).range(0.01,0.2)) * Pulse.ar(1);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 264.575633301, 'me', "(
~melody.quant=2;
~melody.fadeTime=5;
~melody={
    var mel = Duty.kr(1/4,0,Dseq([55,58,54,56,60],inf));
    var sig = SinOsc.ar(mel.midicps!2,mul:LFDNoise1.ar(1).range(0.01,0.2)) * Pulse.ar(4);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 286.518829307, 'me', "(
~melody.quant=2;
~melody.fadeTime=5;
~melody={
    var mel = Duty.kr(1/4,0,Dseq([55,58,54,56],inf));
    var sig = SinOsc.ar(mel.midicps!2,mul:LFDNoise1.ar(1).range(0.01,0.2)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 298.143433022, 'me', "(
~melody.quant=2;
~melody.fadeTime=5;
~melody={
    var mel = Duty.kr(4,0,Dseq([55,58,54,56],inf));
    var sig = SinOsc.ar(mel.midicps!2,mul:LFDNoise1.ar(1).range(0.01,0.2)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 313.525163485, 'me', "(
~melody.quant=2;
~melody.fadeTime=5;
~melody={
    var mel = [55,58,54,56];
    var sig = SinOsc.ar(mel.midicps!2,mul:LFDNoise1.ar(1).range(0.01,0.2)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 319.55627553, 'me', "(
~melody.quant=2;
~melody.fadeTime=5;
~melody={
    var mel = [55,58,54,56];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.2)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 326.68253115, 'me', "(
~melody.quant=2;
~melody.fadeTime=5;
~melody={
    var mel = [55,58,54,56];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.4)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 339.016036638, 'me', "(
~melody.quant=2;
~melody.fadeTime=5;
~melody={
    var mel = [55,58,54,56];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 347.839904926, 'me', "(
~melody.quant=2;
~melody.fadeTime=5;
~melody={
    var mel = [55,58,54,56];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 359.073024447, 'me', "(
~melody.quant=2;
~melody.fadeTime=5;
~melody={
    var mel = [55,56,54,56];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 367.196156808, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,56,58,56];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 373.287800929, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,56,60,56];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 380.198681663, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,56,60,62];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 384.568943186, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,56,60,61];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 387.876013122, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,56,60,63];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 388.963413855, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,56,60,64];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 400.002867016, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,56,60,48];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 404.157431686, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,56,65,48];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 407.328956356, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,58,65,48];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 415.411797307, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,65,55,48];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 419.58082336, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,65,54,48];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 422.668211432, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,65,57,48];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 426.797675517, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,65,58,48];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 440.886443289, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,65,58,48];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 454.209599644, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,65,58,48];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 477.556247476, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,65,58,53];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 481.289312907, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,57,58,53];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 485.395269886, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,54,58,53];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 493.686967041, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,58,53];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 497.991494979, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,58,56];
    var sig = SinOsc.ar(mel.midicps,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 507.644710242, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,58,56];
    var sig = SinOsc.ar(mel.midicps*2,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 514.511387709, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,58,56];
    var sig = SinOsc.ar(mel.midicps*1.5,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 521.792858675, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,58,56];
    var sig = SinOsc.ar(mel.midicps*1.25,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 533.10519214, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,58,56];
    var sig = SinOsc.ar(mel.midicps*[2,1],mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 534.69212336, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,58,56];
    var sig = SinOsc.ar(mel.midicps*[4,1],mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 541.994636202, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,55,58,56];
    var sig = SinOsc.ar(mel.midicps*[4,1],mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 545.596775982, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,55,58,58];
    var sig = SinOsc.ar(mel.midicps*[4,1],mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 554.06992463, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,57,58,58];
    var sig = SinOsc.ar(mel.midicps*[4,1],mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 558.321431298, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,57,58,60];
    var sig = SinOsc.ar(mel.midicps*[4,1],mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 561.441190743, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,57,54,60];
    var sig = SinOsc.ar(mel.midicps*[4,1],mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 564.388617676, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,57,52,60];
    var sig = SinOsc.ar(mel.midicps*[4,1],mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 568.612014614, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,57,52,60];
    var sig = SinOsc.ar(mel.midicps*[4,1]/pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 575.036283233, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,57,52,60];
    var sig = SinOsc.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 587.471719604, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,57,52,60];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 603.050203148, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,57,52,60];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,2000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 612.949088142, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,57,52,60];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 616.23820868, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,52,60];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 624.357555071, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,52,65];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 628.017371162, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,52,63];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 631.817503975, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,52,58];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 634.224463719, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,52,57];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 636.802204077, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,55,57];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 638.369207132, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,52,54,57];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 647.406642291, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,58,54,57];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 652.473142852, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,51,54,57];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 663.45186791, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,60-7,54,57];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 666.963929478, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,60-7,57];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 668.864707605, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [55,60-7];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 678.093091668, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60-7];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 685.034146759, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60-5];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 689.005635145, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60-3];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 692.3683977, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60-2];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 697.828867761, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 702.793658684, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60,48];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 709.104758623, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60,48,72];
    var sig = VarSaw.ar(mel.midicps*[4,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 714.655222396, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60,48,72];
    var sig = VarSaw.ar(mel.midicps*[2,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 728.682571808, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60,48,72];
    var sig = VarSaw.ar(mel.midicps*[2,1]/0.5pi,mul:LFDNoise1.ar(1/2!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 734.513295637, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60,48,72];
    var sig = VarSaw.ar(mel.midicps*[2,1]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 747.915884074, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60,48,72];
    var sig = VarSaw.ar(mel.midicps*[2,1]/pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 752.677133182, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60,48,72];
    var sig = VarSaw.ar(mel.midicps*[4,2]/pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 757.419480173, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [67,60,48,72];
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 764.838103175, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,72];
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 771.67405187, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,58];
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 778.022899423, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,56];
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 780.686854024, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,55];
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8)) * EnvGen.ar(Env([0,1,0],[0.02,0.5],[3,-3]),Impulse.ar(2,(0..3)/4));
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 817.618248535, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,55];
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 823.665267384, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,55];
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 833.197377735, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,55];
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 835.209306184, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,55];
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/0.25pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 843.038939812, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,55]+12;
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/0.25pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 845.648212832, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,55]-12;
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/0.25pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 848.347380471, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,55]-12;
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 852.060133861, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,55]+12;
    var sig = VarSaw.ar(mel.midicps*[1.5,2]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 854.663660041, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,55]+12;
    var sig = VarSaw.ar(mel.midicps*[1.25,2]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 857.341789273, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,55]+12;
    var sig = VarSaw.ar(mel.midicps*[1,2]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 860.713537198, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,55];
    var sig = VarSaw.ar(mel.midicps*[1,2]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 863.647891145, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,48,54];
    var sig = VarSaw.ar(mel.midicps*[1,2]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 869.140740878, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,60,55,54];
    var sig = VarSaw.ar(mel.midicps*[1,2]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 872.338183238, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [65,58,55,54];
    var sig = VarSaw.ar(mel.midicps*[1,2]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 874.105606785, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [60,58,55,54];
    var sig = VarSaw.ar(mel.midicps*[1,2]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,4000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 879.659272075, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [60,58,55,54];
    var sig = VarSaw.ar(mel.midicps*[1,2]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,14000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 887.066889087, 'me', "(
~melody.quant=2;
~melody.fadeTime=2;
~melody={
    var mel = [60,58,55,54];
    var sig = SinOsc.ar(mel.midicps*[1,2]/0.5pi,mul:LFDNoise1.ar(1!4).range(0.01,0.8));
    sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = LPF.ar(sig,14000);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~melody,postVol:true);
~melody.play;
);" ],
[ 896.05824163, 'me', "thisProcess.stop;" ],
[ 911.750849548, 'me', "(
~fun.quant=2;
~fun.fadeTime=2;
~fun={
    var mod = Duty.kr(4,0,Dseq([1,2,4,8]*0.25pi,inf));
    var sig = (Blip.ar(43.2,[10,20,40,80,2]) ++ LFSaw.ar(SinOsc.ar(11).range(432/mod,4320/mod),mul:0.2) ++ WhiteNoise.ar(0.1!2) ++ LFSaw.ar(50) ++ SinOsc.ar(10000/mod,mul:0.2)).scramble;
    sig = sig * (Decay.ar(Impulse.ar(2/[2,4],(0..7)++[0.25,0.5,0.75]/8),[2,3,4]/2));
    sig = sig * LFDNoise1.ar(1/4!8);
    sig = Resonz.ar(sig,LFSaw.ar(1/8/fib(8)).exprange(80.001,16000));
    sig = GVerb.ar(sig,[10,20,100,8])/2+sig;
    sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,1);
};
~fun.play;
);" ],
[ 928.160995468, 'me', "thisProcess.stop;" ],
[ 928.605017174, 'me', "(
~pls.quant=2;
~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65],inf)).lag(1/20);
	var pp = SinOsc.ar(50*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNoise1.ar(1/2!8).range(-2pi,2pi),mul:0.7/(1..8)) * LFDNoise1.ar(1!8));

	sig = sig + (LFPar.ar(mm.midicps/([1,2,4,1.5]*0.125pi),mul:0.3) * Decay.ar(Impulse.ar(1/8,[0,0.25,0.5,0.75]/8),4) * LFDNoise1.ar(1/2!8));


	sig = Limiter.ar(sig,0.9);

	sig = GVerb.ar(sig,[100,10])/[4,2]+sig;

	sig = CompanderD.ar(sig/2,3/4,1/2,1/2);

	Splay.ar(sig.flat,0.25);

};
~pls.play;
)" ],
[ 942.165699241, 'me', "(
~pls.quant=2;
~pls={
	var mm = Duty.kr([1,2,4,8]*4,0,Dseq([60,63,60,65,60,67,72,65],inf)).lag(1/20);
	var pp = SinOsc.ar(50*[1,1.5,4,2],mul:0.2) * Pulse.ar(4) * LFDNoise1.ar(1/4!8);
	var sig = pp;


	sig = sig + HPF.ar(WhiteNoise.ar(0.25!2) * Pulse.ar(4/fib(8)) * LFDNoise1.ar(1/4!8),1200*(1..8),0.2);

	sig = sig + (SinOsc.ar(mm.midicps/([1,2,4,8,1.5,1.25,1,2]*0.25pi),LFDNois