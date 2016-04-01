// History, as it was on Fri Jun 12 21:12:09 2015.

[
[ 0, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50!2);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*18000+50);
  Splay.ar(sig.flat,0,0.15,1);
};
~parksynth.play;
);" ],
[ 23.275806382, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*18000+50);
  Splay.ar(sig.flat,0,0.15,1);
};
~parksynth.play;
);" ],
[ 35.735649218, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*18000+50);
  Splay.ar(sig.flat,0,0.25,1);
};
~parksynth.play;
);" ],
[ 46.756375452, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50);
  Splay.ar(sig.flat,0,0.25,1);
};
~parksynth.play;
);" ],
[ 60.751184355, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*18000+50);
  Splay.ar(sig.flat,0,0.25,1);
};
~parksynth.play;
);" ],
[ 105.679888288, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,8]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*18000+50);
  Splay.ar(sig.flat,0,0.25,1);
};
~parksynth.play;
);" ],
[ 109.838731216, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*18000+50);
  Splay.ar(sig.flat,0,0.25,1);
};
~parksynth.play;
);" ],
[ 115.326873143, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*18000+50);
  Splay.ar(sig.flat,0,0.25,1);
};
~parksynth.play;
);" ],
[ 118.403836561, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.25]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*18000+50);
  Splay.ar(sig.flat,0,0.25,1);
};
~parksynth.play;
);" ],
[ 123.569196446, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*18000+50);
  Splay.ar(sig.flat,0,0.25,1);
};
~parksynth.play;
);" ],
[ 133.853390938, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  Splay.ar(sig.flat,0,0.25,1);
};
~parksynth.play;
);" ],
[ 214.835606556, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = Greyhole.ar(sig)+sig;
  Splay.ar(sig.flat,0,0.5,1);
};
~parksynth.play;
);" ],
[ 221.817608679, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = Greyhole.ar(sig)/2+sig;
  Splay.ar(sig.flat,0,0.5,1);
};
~parksynth.play;
);" ],
[ 235.502068538, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = Greyhole.ar(sig,1,0.01,8)/2+sig;
  Splay.ar(sig.flat,0,0.5,1);
};
~parksynth.play;
);" ],
[ 241.245912187, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = Greyhole.ar(sig,0.1,0.01,8)/2+sig;
  Splay.ar(sig.flat,0,0.5,1);
};
~parksynth.play;
);" ],
[ 243.637659387, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = Greyhole.ar(sig,0.5,0.01,8)/2+sig;
  Splay.ar(sig.flat,0,0.5,1);
};
~parksynth.play;
);" ],
[ 253.694742034, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = Greyhole.ar(sig,0.05,0.01,8)/2+sig;
  Splay.ar(sig.flat,0,0.5,1);
};
~parksynth.play;
);" ],
[ 265.807449283, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = Greyhole.ar(sig,0.05,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.5,1);
};
~parksynth.play;
);" ],
[ 271.985152221, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = Greyhole.ar(sig,4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.5,1);
};
~parksynth.play;
);" ],
[ 277.47269527, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.5,1);
};
~parksynth.play;
);" ],
[ 281.490788108, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.5,1);
};
~parksynth.play;
);" ],
[ 285.509343081, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.5,1);
};
~parksynth.play;
);" ],
[ 292.439387204, 'me', "thisProcess.stop;" ],
[ 348.738499786, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1!4).exprange(0.0002,0.2),8);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.5,1);
};
~parksynth.play;
);" ],
[ 354.199445682, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1!4).exprange(0.0002,0.2),8);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.25,1);
};
~parksynth.play;
);" ],
[ 356.706214726, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1!4).exprange(0.0002,0.2),8);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.15,1);
};
~parksynth.play;
);" ],
[ 364.312068894, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1!4).exprange(0.0002,0.2),8);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.015,1);
};
~parksynth.play;
);" ],
[ 372.33186687, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1!4).exprange(0.0002,0.2),8);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.025,1);
};
~parksynth.play;
);" ],
[ 376.161301219, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1!4).exprange(0.0002,0.2),8);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.035,1);
};
~parksynth.play;
);" ],
[ 384.957942949, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(4!4).exprange(0.0002,0.2),8);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.035,1);
};
~parksynth.play;
);" ],
[ 399.4875475, 'me', "(
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = LPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(4!4).exprange(0.0002,0.2),8);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig * Pulse.ar(4);
  Splay.ar(sig.flat,0,0.035,1);
};
~parksynth.play;
);" ],
[ 402.473106129, 'me', "thisProcess.stop;" ],
[ 712.892996503, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(4!4).exprange(0.0002,0.2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.1);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.035,1);
};
~parksynth.play;
);" ],
[ 725.681945091, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(4!4).exprange(0.0002,0.2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1/4,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.035,1);
};
~parksynth.play;
);" ],
[ 732.02521948, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(4!4).exprange(0.0002,0.2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.035,1);
};
~parksynth.play;
);" ],
[ 741.930750253, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(4!4).exprange(0.0002,0.2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.045,1);
};
~parksynth.play;
);" ],
[ 753.935246797, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(8!4).exprange(0.0002,0.2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.045,1);
};
~parksynth.play;
);" ],
[ 763.145704382, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(8!4).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.045,1);
};
~parksynth.play;
);" ],
[ 769.138522226, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/8!4).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.045,1);
};
~parksynth.play;
);" ],
[ 789.211935384, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(4!4).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.045,1);
};
~parksynth.play;
);" ],
[ 799.600868732, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(4!4).exprange(0.0002,2)+LFSaw.ar(11).range(0,100),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.045,1);
};
~parksynth.play;
);" ],
[ 826.636798253, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]+LFSaw.ar(11).range(0,100));
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(4!4).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.045,1);
};
~parksynth.play;
);" ],
[ 843.469078449, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]+LFSaw.ar(44).range(0,100));
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(4!4).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.045,1);
};
~parksynth.play;
);" ],
[ 858.85506154, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]+LFSaw.ar(44).range(0,100));
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/4!4).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.045,1);
};
~parksynth.play;
);" ],
[ 871.435324989, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]+LFSaw.ar(44).range(0,100));
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.045,1);
};
~parksynth.play;
);" ],
[ 879.7080057, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]+LFSaw.ar(44).range(0,100));
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.085,1);
};
~parksynth.play;
);" ],
[ 899.305884237, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var sig = LFSaw.ar(50*[1,1.5,4,8]+LFSaw.ar(44).range(0,100));
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.285,1);
};
~parksynth.play;
);" ],
[ 908.000510635, 'me', "thisProcess.stop;" ],
[ 963.529762525, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq(72.midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = LFSaw.ar(mod*[1,1.5,4,8]+LFSaw.ar(44).range(0,100));
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.285,1);
};
~parksynth.play;
);" ],
[ 965.737591263, 'me', "thisProcess.stop;" ],
[ 975.597814035, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq(72.midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = LFSaw.ar(mod*[1,1.5,4,8]+LFSaw.ar(44).range(0,100));
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.0285,1);
};
~parksynth.play;
);" ],
[ 979.875462109, 'me', "thisProcess.stop;" ],
[ 985.833135385, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq(72.midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = LFSaw.ar(mod*[1,1.5,4,8]+LFSaw.ar(44).range(0,100));
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.0285,1);
};
~parksynth.play;
);" ],
[ 1013.731044595, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq(72.midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.0285,1);
};
~parksynth.play;
);" ],
[ 1020.397929391, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq(72.midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.485,1);
};
~parksynth.play;
);" ],
[ 1044.221421443, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq(72.midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.785,1);
};
~parksynth.play;
);" ],
[ 1053.837487522, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq(72.midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1081.847150627, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72-12).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1105.797852726, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72-12+[12,24,0]).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1116.514641137, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72-12+[12,24,0,-7]).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1123.421089502, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72-12+[12,24-7,0,-7]).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1134.19096437, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72-24+[12,24-7,0,-7]).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1158.517910863, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72-24+[12,24-14,0,-7]).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1170.473798285, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72-24+[12,24-14,0,5]).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1182.740107401, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72-24+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1191.290145048, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/4/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1198.942624926, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/2/fib(4)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1204.003005758, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1225.675775571, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*pi,inf));
  var sig = LFSaw.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1237.136028135, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1248.277752597, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1270.435968013, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=2;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((72+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*1.5pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1291.443188834, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*1.25pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1299.151387566, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*1.125pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1306.842537636, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*0.5pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,1,0.01,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1323.312942269, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*0.5pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.01,0.91,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1329.99204964, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*0.5pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1349.261226138, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*0.5pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig * Pulse.ar(1/fib(4)) + sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1362.522767481, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*0.5pi,inf));
  var sig = SinOsc.ar(mod);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1381.146326976, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*0.5pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*100);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.685,1);
};
~parksynth.play;
);" ],
[ 1400.436865322, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*0.5pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*100);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.785,1);
};
~parksynth.play;
);" ],
[ 1407.543785411, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-14,0,5]).midicps/[1,2,1.125,1.25]*0.5pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10);
  //sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8);
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.785,1);
};
~parksynth.play;
);" ],
[ 1431.798204068, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-7,0,5]).midicps/[1,2,1.125,1.25]*0.5pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8)/8+sig;
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.785,1);
};
~parksynth.play;
);" ],
[ 1440.064809963, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-7,0,5]).midicps/[1,2,1.125,1.25]*0.5pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.785,1);
};
~parksynth.play;
);" ],
[ 1450.138827613, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-7,0,5]).midicps/[1,2,1.125,1.25]*0.5pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.785,1);
};
~parksynth.play;
);" ],
[ 1457.454748561, 'me', "(
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((48+[12,24-7,0,5]).midicps/[1,2,1.125,1.25]*0.5pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.785,1);
};
~parksynth.play;
);" ],
[ 1463.858884667, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((48+[12,24-7,0,5]).midicps/[1,2,1.5,1.25]*0.5pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.785,1);
};
~parksynth.play;
);" ],
[ 1469.59470008, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((48+[12,24-7,0,5]).midicps/[1,2,1.5,1.25]*0.75pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.785,1);
};
~parksynth.play;
);" ],
[ 1474.924593495, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((48+[12,24-7,0,5]).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.785,1);
};
~parksynth.play;
);" ],
[ 1490.911621196, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((48+[12,24-7,0,5]).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.785,1);
};
~parksynth.play;
);" ],
[ 1512.561415961, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((60+[12,24-7,0,5]).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1522.755615624, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(4,0,Dseq((36+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1529.337261301, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/4,0,Dseq((36+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1546.054164517, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/4,0,Dseq((36+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1565.45743578, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/4,0,Dseq((72+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1576.85978955, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/4,0,Dseq((72+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*0.5pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1580.094520084, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/4,0,Dseq((72+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*0.25pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1583.343338799, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/4,0,Dseq((72+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*0.5pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1586.516227937, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/4,0,Dseq((72+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1.5pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1589.418390269, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/4,0,Dseq((72+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1.25pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1593.400189693, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/4,0,Dseq((72+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1.5pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1600.55363086, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/4,0,Dseq((72+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1614.01913835, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/4,0,Dseq((24+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1627.420422116, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/4,0,Dseq(([24,60]+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1636.287545125, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/[4,1/4],0,Dseq(([24,60]+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.02,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1657.567409156, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/[4,1/4],0,Dseq(([24,60]+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.8,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1670.227059146, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/[4,1/4],0,Dseq(([24,60]+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2) + WhiteNoise.ar(0.1!2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.8,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1673.903946851, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/[4,1/4],0,Dseq(([24,60]+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*10+2) + WhiteNoise.ar(0.5!2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.8,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1679.227654814, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/[4,1/4],0,Dseq(([24,60]+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*100+2) + WhiteNoise.ar(0.5!2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.8,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1682.960946772, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/[4,1/4],0,Dseq(([24,60]+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*4+2) + WhiteNoise.ar(0.5!2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.8,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1688.263814852, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/[4,1/4],0,Dseq(([24,48]+[12,24-7,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*4+2) + WhiteNoise.ar(0.5!2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.8,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1692.193213834, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/[4,1/4],0,Dseq(([24,48]+[12,24-5,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*4+2) + WhiteNoise.ar(0.5!2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.8,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1696.638703158, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/[4,1/4],0,Dseq(([24,48]+[12,24-3,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*4+2) + WhiteNoise.ar(0.5!2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.8,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1700.517105872, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/[4,1/4],0,Dseq(([24,48]+[12,24-1,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*4+2) + WhiteNoise.ar(0.5!2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.8,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1709.5506836, 'me', "(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/[4,1/4],0,Dseq(([24,48]+[12,24,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*4+2) + WhiteNoise.ar(0.5!2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.8,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);" ],
[ 1712.895893246, 'me', "~parksynth.stop(15);" ],
[ 1714.34017552, 'me', "~parksynth.stop(15);" ],
];