// History, as it was on Fri Jun 12 19:58:45 2015.

[
[ 0, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(50!2*dut);
  sig = sig * Pulse.ar(2);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 10.974451189, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/4,0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(50!2*dut);
  sig = sig * Pulse.ar(2);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 15.178016288, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/4,0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(50!2*dut);
  sig = sig * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 19.471570242, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/2,0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(50!2*dut);
  sig = sig * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 22.523834692, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/2/fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(50!2*dut);
  sig = sig * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 32.836093124, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/2*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(50!2*dut);
  sig = sig * Pulse.ar(4);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 50.338186585, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/2*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(50!2*dut);
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 76.354745491, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/2*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(60.midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 89.53296416, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/2*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(60.midicps/(dut*pi));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 94.923156033, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(60.midicps/(dut*pi));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 111.528314051, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(2*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(60.midicps/(dut*pi));
  sig = sig * LFSaw.ar(2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 116.173616266, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(60.midicps/(dut*pi));
  sig = sig * LFSaw.ar(2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 126.33831659, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar(72.midicps/(dut*pi));
  sig = sig * LFSaw.ar(2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 132.754777214, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar(72.midicps/(dut*pi));
  sig = sig * LFSaw.ar(2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 140.452336115, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72+12).midicps/(dut*pi));
  sig = sig * LFSaw.ar(2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 144.632172384, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72+24).midicps/(dut*pi));
  sig = sig * LFSaw.ar(2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 151.019678816, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72+[24,36,48]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 156.556700667, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72+[24,36,5]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 160.739776068, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72+[24,36,5,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 166.096298125, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1/4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72+[24,36,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 216.798684223, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 226.317646241, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 231.195320019, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72-7+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 235.802157062, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72-12+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 274.542943623, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 303.087021316, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/2/fib(8)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 363.669618935, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 381.792851997, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 400.812754759, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,-1,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = SinOsc.ar((72-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 430.433717149, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,-1,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),4);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 436.67203971, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,-1,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 440.483116244, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 443.604163923, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(1/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 450.403717703, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(1,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 452.420005175, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 466.630354906, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),2);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.5);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 472.90498818, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),2);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.25);
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 488.479965615, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),2);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.25);
  sig = Greyhole.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 495.952914785, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),2);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.25);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~para.play;
);" ],
[ 499.03486129, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),2);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.25);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 503.580337864, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),2);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.5);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 512.592125967, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),4);
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.5);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 519.305444586, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),4);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),2);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 532.918348247, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4).exprange(0.001,100));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),2);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 542.446040583, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(4).exprange(0.001,100));
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),2);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 554.607352278, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(4).exprange(0.001,100));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),2);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 563.492583336, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((60-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(4).exprange(0.001,100));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),2);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 568.011081468, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(4).exprange(0.001,100));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),2);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 575.440295627, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(4/fib(8)).exprange(0.001,100));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),2);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 578.401124038, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),2);
  sig = Greyhole.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 588.789796737, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),2);
  sig = Greyhole.ar(sig)+sig;
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 594.02745989, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),2);
  sig = Greyhole.ar(sig)+sig;
  Splay.ar(sig.flat,0.25,0.15);
};
~para.play;
);" ],
[ 608.276650812, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),2);
  sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,2000);
  Splay.ar(sig.flat,0.25,0.15);
};
~para.play;
);" ],
[ 626.35515824, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),2);
  sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,2000) + Resonz.ar(sig,[2000,4000,8000]);
  Splay.ar(sig.flat,0.25,0.15);
};
~para.play;
);" ],
[ 632.015100108, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),2);
  sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,2000) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.15);
};
~para.play;
);" ],
[ 636.089342945, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(2,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(1*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),2);
  sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,2000) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.15);
};
~para.play;
);" ],
[ 645.669941543, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),2);
  sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,2000) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.15);
};
~para.play;
);" ],
[ 654.502017686, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),0.5);
  sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,2000) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 663.959723047, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),0.5);
  sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,900) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 670.457936509, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)/4),0.5);
  sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,900) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 672.593502157, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((48-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)/4),1.5);
  sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,900) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 685.257156438, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)/4),1.5);
  sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,900) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 700.420007364, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)/4),0.5);
  sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,900) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 704.309138176, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1/4,(0..3)/4),0.5);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,900) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 714.916671699, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),0.5);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,900) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 725.708633058, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.5);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,900) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 734.654714375, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr(4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar([1,2,1/2,1/4],(0..3)/4),0.5);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,900) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 743.407550928, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32],0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar([1,2,1/2,1/4],(0..3)/4),0.5);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,900) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 756.573146166, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = Blip.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi),4+LFSaw.ar(1/4/fib(8)).exprange(0.001,40));
  sig = sig * Decay.ar(Impulse.ar([1,2,1/2,1/4],(0..3)/4),0.5);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,900) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 778.392069086, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar([1,2,1/2,1/4],(0..3)/4),0.75);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,900) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 785.062875024, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar([1,2,1/2,1/4],(0..3)/4),0.75);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,[2000,4000,8000,16000]);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 796.863865812, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar([1,2,1/2,1/4],(0..3)/4),0.75);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,400);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 808.06970544, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.75);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,400);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 815.033304844, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.75);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,400*1.5);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 820.055389534, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.75);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,400*1.25);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 826.479152147, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.75);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,400*1.85);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 844.744010614, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.75);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*14000+50*14000+50*14000+50*14000+50*14000+50*14000+50*14000+50*14000+50);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 847.67535914, 'me', "thisProcess.stop;" ],
[ 854.232817028, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.75);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,LFSaw.ar(1/4).exprange(0.001,1)*14000+50);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 861.586792394, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),0.75);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,LFSaw.ar(4).exprange(0.001,1)*14000+50);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 877.740184983, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,LFSaw.ar(4).exprange(0.001,1)*14000+50);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 882.447997807, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,LFSaw.ar(4).exprange(0.001,1)*14000+50);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 889.942245561, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,LFSaw.ar(44).exprange(0.001,1)*14000+50);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 894.423444993, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72+12-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*14000+50);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 906.550559759, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,90) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*14000+50);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 913.712556768, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = Greyhole.ar(sig)+sig;
  sig = LPF.ar(sig,120) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*14000+50);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 918.412813937, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = Greyhole.ar(sig)+sig;
  sig = RLPF.ar(sig,120) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*14000+50);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 928.337440741, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = Greyhole.ar(sig)+sig;
  sig = RLPF.ar(sig,120) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*14000+50,0.2);
  Splay.ar(sig.flat,0.25,0.25);
};
~para.play;
);" ],
[ 937.483383407, 'me', "(
~para.quant=2;
~para.fadeTime=2;
~para={
  var dd = Duty.kr([4,8,16,32]/4,0,Dseq([12,7,0,24,36,0,0,0],inf));
  var dut = Duty.kr(4*fib(8),0,Dseq([1,2,1.5,1.25],inf));
  var sig = LFSaw.ar((72-dd+[24,48,7,3]).midicps/(dut*pi));
  sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  //sig = Greyhole.ar(sig)+sig;
  sig = RLPF.ar(sig,120) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*14000+50,0.12);
  Spla