// History, as it was on Tue Jun 16 11:33:43 2015.

[
[ 0, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(14000!2);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 4.054936926, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(14000+[0,1]);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 16.610647289, 'me', "thisProcess.stop;" ],
[ 31.249219564, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(1400+[0,1]);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 55.534565145, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(432+[0,1]);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 60.47044224, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(432/pi+[0,1]);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 79.959233582, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60].midicps/pi+[0,1]);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 88.695666542, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60].midicps*2/pi+[0,1]);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 95.26478281, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60].midicps/0.5pi+[0,1]);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 106.352204163, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.5pi+[0,1]);
  sig = sig * LFSaw.ar(1/4).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 117.3006794, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.5pi+[0,1]);
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 140.651483978, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.5pi+[0,1]);
  sig = sig * SinOsc.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 142.363998987, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.5pi+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 163.342745978, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.25pi+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 171.747425914, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.25pi*1.5+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 179.594597512, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.25pi*[1,1.5,0.5]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 185.151507634, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.25pi*[1,1.5,0.5,0.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 192.365562207, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.25pi*[1,1.5,0.75,0.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 195.304590132, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.25pi*[1,1.125,0.75,0.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 202.356261154, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.25pi*[1,1.125,1.5,0.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 205.055001987, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.25pi*[1,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 207.87557628, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,72,65,63].midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 221.303206073, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,69,65,63].midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 227.460877897, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,69,64,63].midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 234.024165719, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,69,65,63].midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 235.893776173, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,69,61,63].midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 239.782465106, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,69,60,63].midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 245.537358851, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar([60,63,60,65].midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 270.621736265, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(([60,63,60,65]+[0,0,12,0]).midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 277.833565865, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(([60,63,60,65]+[0,-7,12,0]).midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 280.900273148, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(([60,63,60,65]+[0,-7,12,-14]).midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 285.629624675, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(([60,63,60,65]+[-7,-7,12,-14]).midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 289.373755675, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(([60,63,60,65]+[0,-7,12,-14]).midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 293.355772627, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(([60,63,60,65]+[0,-7,-12,-14]).midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 296.030745879, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(([60,63,60,65]+[0,-7,-12,14]).midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 300.117639242, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(([60,63,60,65]+[0,-7,-12,0]).midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 302.138357753, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var sig = SinOsc.ar(([60,63,60,65]+[0,7,-12,0]).midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 352.294939995, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr(4*[1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14],inf));
  var sig = SinOsc.ar(([60,63,60,65]+mod).midicps/0.25pi*[2,1.125,1.5,1.25]+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 395.941094507, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr(4*[1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14],inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5],inf));
  var sig = SinOsc.ar(([60,63,60,65]+mod).midicps/0.25pi*mod2+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 459.430869917, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr(4*[1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4,0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.125pi*mod2+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,3,4]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 473.677217878, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr(4*[1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4,0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.125pi*mod2+[0,1]);
  sig = sig * SinOsc.kr(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 488.895436022, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr(4*[1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4,0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.125pi*mod2+[0,1]);
  sig = sig * LFSaw.kr(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 493.258699679, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr(4*[1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4,0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.125pi*mod2+[0,1]);
  sig = sig * LFSaw.kr(1/4/[1,2,4,8],-0.5).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 513.470665922, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr(4*[1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4,0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.125pi*mod2+[0,1]);
  sig = sig * LFSaw.kr(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 523.537579531, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr(4*[1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4,0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.125pi*mod2+[0,1]);
  sig = sig * LFSaw.kr(1/4/[1,2,4,8],0.5).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 538.381509246, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr(4*[1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4,0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.125pi*mod2+[0,1]);
  sig = sig * LFSaw.kr(1/4/[1,2,4,8],-0.25).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 557.748416184, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr(4*[1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4,0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.125pi*mod2+[0,1]);
  sig = sig * LFSaw.kr(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 567.856254434, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr(4*[1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4,0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.125pi*mod2+[0,1]);
  sig = sig * LFSaw.kr(1/4/[8,4,2,1]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 609.406430538, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr([4*1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4*[1,2,4,8],0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.125pi*mod2+[0,1]);
  sig = sig * LFSaw.kr(1/4/[8,4,2,1]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 615.373388144, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr([4*1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4*[1,2,4,8],0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.125pi*mod2+[0,1]);
  sig = sig * LFSaw.kr(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 622.107491014, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr([4*1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4*[1,2,4,8],0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.25pi*mod2+[0,1]);
  sig = sig * LFSaw.kr(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 643.604438861, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr([4*1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4*[1,2,4,8],0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.25pi*mod2+[0,1],mul:0.5);
  sig = sig * LFSaw.kr(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~lkj.play;
);" ],
[ 646.110827597, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr([4*1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4*[1,2,4,8],0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.25pi*mod2+[0,1],mul:0.5);
  sig = sig * LFSaw.kr(1/4/[1,2,4,8]).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.75);
};
~lkj.play;
);" ],
[ 675.147304032, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var mod = Duty.kr([4*1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(4*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(4*[1,2,4,8],0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.25pi*mod2+[0,1],mul:0.5);
  sig = sig * (1-LFSaw.kr(1/4/[1,2,4,8]).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.75);
};
~lkj.play;
);" ],
[ 717.687677932, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var tempo = 1;
  var mod = Duty.kr([tempo*1,2,4,8],0,Dseq([0,0,12,-7,-12,7,0,0,24,-14,14].scramble,inf));
  var mod2 = Duty.kr(tempo*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(tempo*[1,2,4,8],0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.25pi*mod2+[0,1],mul:0.5);
  sig = sig * (1-LFSaw.kr(1/tempo/[1,2,4,8]).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.75);
};
~lkj.play;
);" ],
[ 733.78166974, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var tempo = 1;
  var mod = Duty.kr([tempo*1,2,4,8],0,Dseq([0,0,12,-12,0,0,24,14].scramble,inf));
  var mod2 = Duty.kr(tempo*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(tempo*[1,2,4,8],0,Dseq([60,60,63,65,67].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.25pi*mod2+[0,1],mul:0.5);
  sig = sig * (1-LFSaw.kr(1/tempo/[1,2,4,8]).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.75);
};
~lkj.play;
);" ],
[ 747.902135324, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var tempo = 1;
  var mod = Duty.kr([tempo*1,2,4,8],0,Dseq([0,0,12,-12,0,0,24,14].scramble,inf));
  var mod2 = Duty.kr(tempo*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(tempo*[1,2,4,8],0,Dseq([60,60,63,65,72].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.25pi*mod2+[0,1],mul:0.5);
  sig = sig * (1-LFSaw.kr(1/tempo/[1,2,4,8]).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.75);
};
~lkj.play;
);" ],
[ 752.497603029, 'me', "(
~lkj.quant=2;
~lkj.fadeTime=5;
~lkj={
  var tempo = 1/2;
  var mod = Duty.kr([tempo*1,2,4,8],0,Dseq([0,0,12,-12,0,0,24,14].scramble,inf));
  var mod2 = Duty.kr(tempo*[1,2,4,8],0,Dseq([2,1.125,1.5,1.25,1,1,1,1.5,1,1,1,1.5].scramble,inf));
  var mod3 = Duty.kr(tempo*[1,2,4,8],0,Dseq([60,60,63,65,72].scramble,inf));
  var sig = SinOsc.ar((mod3+mod).midicps/0.25pi*mod2+[0,1],mul:0.5);
  sig = sig * (1-LFSaw.kr(1/tempo/[1,2,4,8]).exprange(0.001,1));
  Splay.ar(sig.flat,0.25,0.75);
};
~lkj.play;
);" ],
[ 832.763722101, 'me', "thisProcess.stop;" ],
[ 841.793024628, 'me', "thisProcess.stop;" ],
[ 864.455047538, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(432*[1,1.01]);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 879.991824478, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(432*[1,1.01]+SinOsc.ar(1/fib(21)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 884.215102034, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(432*[1,1.01],SinOsc.ar(1/fib(21)));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 894.571756484, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(432*[1,1.01],SinOsc.ar(1/fib(21)).range(-2pi,2pi),mul:0.2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 898.089215756, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(432*[1,1.01],SinOsc.ar(1/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 903.343655578, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(432*[1,1.01],SinOsc.ar(11/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 920.251919051, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/8pi,SinOsc.ar(11/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 934.030615809, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/[8,4,2,1]*pi,SinOsc.ar(11/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 938.99683004, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.ar(11/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 957.535640747, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.ar(11/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 975.716227327, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.ar(111/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 980.13722844, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.ar(111/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(4/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 993.296661922, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.ar(1/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(1/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1002.518051206, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.ar(4/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(1/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1005.635993381, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.ar(4/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(4/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1014.266860344, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.ar(4/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1016.473842879, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.ar(11/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1019.285564805, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.ar(111/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1024.696039752, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.ar(1111/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1038.725412283, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*2pi),SinOsc.ar(1111/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1044.281651864, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*4pi),SinOsc.ar(1111/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1067.566800617, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*4pi),SinOsc.ar(432/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(1/4/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1079.404640877, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*4pi),SinOsc.ar(432/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(1/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1090.940838258, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*4pi),SinOsc.ar(432/fib(21)).range(-2pi,2pi),mul:0.24);
  sig = sig * LFSaw.ar(43.2/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1106.37917719, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*4pi),SinOsc.ar(432/fib(21)).range(-pi,pi),mul:0.24);
  sig = sig * LFSaw.ar(43.2/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1116.341363488, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*4pi),SinOsc.ar(43.2/fib(21)).range(-pi,pi),mul:0.24);
  sig = sig * LFSaw.ar(43.2/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1126.425619661, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*4pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.24);
  sig = sig * LFSaw.ar(43.2/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1129.76593414, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*4pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.24);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1144.692701499, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.24);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1187.925154082, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.24);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.5);
};
~mono.play;
);" ],
[ 1192.834162876, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.24);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.75);
};
~mono.play;
);" ],
[ 1199.313882887, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.24);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1207.70778698, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.33);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1214.09566007, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1226.310293629, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*1.5pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1233.027079086, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*1.25pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1238.811357261, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*1.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1246.220562017, 'me', "(
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*1.25pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1247.620937311, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]*1.5pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1318.26228097, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/1.5pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1323.056606258, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1329.046419584, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.25pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1333.81308248, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,16000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1341.4208, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,14000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1349.089058358, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,8000/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1359.238386497, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21));
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1376.163259373, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21));
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1411.774801046, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21)) + (LFSaw.ar(4320*[1,2,3])*LFSaw.ar(1/4).exprange(0.001,0.1) );
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1416.710099402, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21)) + (LFSaw.ar(4320*[1,2,3])*LFSaw.ar(1/4).exprange(0.001,0.01) );
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1419.356369066, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21)) + (LFSaw.ar(4320*[1,2,3])*LFSaw.ar(1/4).exprange(0.00001,0.01) );
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1433.708277214, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21)) + (LFSaw.ar(4320*[1,2,3])*LFSaw.ar(1/4/fib(8)).exprange(0.00001,0.01) );
  sig = GVerb.ar(sig,10);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1446.342958693, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21)) + (LFSaw.ar(4320*[1,2,3])*LFSaw.ar(1/4/fib(8)).exprange(0.00001,0.01) );
  sig = GVerb.ar(sig,100);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1467.297822248, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21)) + (LFSaw.ar(4320*[1,2,3])*LFSaw.ar(1/4/fib(8)).exprange(0.00001,0.01) );
  sig = CombN.ar(sig,0.25,4,4);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1480.633880405, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21)) + (LFSaw.ar(4320*[1,2,3])*LFSaw.ar(1/4/fib(8)).exprange(0.00001,0.01) );
  sig = CombN.ar(sig,0.25,2,4);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1486.493426283, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = SinOsc.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21)) + (LFSaw.ar(4320*[1,2,3])*LFSaw.ar(1/4/fib(8)).exprange(0.00001,0.01) );
  sig = CombN.ar(sig,0.025,2,4);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1503.341448133, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = LFSaw.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21)) + (LFSaw.ar(4320*[1,2,3])*LFSaw.ar(1/4/fib(8)).exprange(0.00001,0.01) );
  sig = CombN.ar(sig,0.025,2,4);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1526.260951109, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = LFSaw.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21)) + (LFSaw.ar(4320*[1,2,3])*LFSaw.ar(1/4/fib(8)).exprange(0.00001,0.01) );
  sig = CombN.ar(sig,0.25,1,4);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1546.666970922, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = LFSaw.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1) * Pulse.ar([1,2,3,4]);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21)) + (LFSaw.ar(4320*[1,2,3])*LFSaw.ar(1/4/fib(8)).exprange(0.00001,0.01) );
  sig = CombN.ar(sig,0.25,1,4);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1559.949705828, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = LFSaw.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.001,1) * Pulse.ar([1,2,3,4]);
  sig = BPF.ar(sig,4320/(1..21),mul:LFDNoise1.ar(1!21)) + (LFSaw.ar(4320*[1,2,3])*LFSaw.ar(1/4/fib(8)).exprange(0.00001,0.01) );
  sig = CombN.ar(sig,0.25,1,2);
  Splay.ar(sig.flat,0.25,0.95);
};
~mono.play;
);" ],
[ 1568.535408871, 'me', "(
~mono.quant=2;
~mono.fadeTime=5;
~mono={
  var sig = LFSaw.ar(4320/([8,4,2,1]/0.125pi),SinOsc.kr(43.2/fib(21)).range(-pi,pi),mul:0.5);
  sig = sig * LFSaw.kr(43.2/fib(21)).exprange(0.0