// History, as it was on Sun Jun 14 15:57:24 2015.

[
[ 0, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(4*m.kr(0.1)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 12.650388718, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(4*m.kr(0,1)).exprange(0.001,1);
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 61.876433749, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4/[1,2]).exprange(0.001,1);
  sig = BPF.ar(sig,m.kr(0,1)*20000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 97.904761861, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4/[1,2]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 131.601189246, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar(50!2);
  sig = sig * LFSaw.ar(1/4/[1,2]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 176.225385751, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([50,60,55,45]);
  sig = sig * LFSaw.ar(1/4/[1,2]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 185.701200428, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([50,60,55,45]);
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 211.253579665, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,67].midicps/8pi);
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 216.52704776, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,67].midicps/4pi);
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 221.239731903, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,67].midicps/2pi);
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 235.697675155, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/2pi);
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 236.988198231, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/pi);
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 244.012263441, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/1.5pi);
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 252.092999338, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/1.25pi);
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 271.97748945, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/([1.25,1,1.5,2]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/4+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 292.631488932, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/([1.25,1,1.5,2]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 301.000749775, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/([1.25,1,1.5,2]*pi));
  sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 308.148086094, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/([1.25,1,1.5,2]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 312.190820677, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/([1.25,1,1.5,2]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 352.813686719, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/([1.25,1,1.5,2]*0.25pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 354.011997558, 'me', "(
~voce.quant=2;
~voce.fadeTime=2;
~voce={
  var sig = LFSaw.ar([60,63,65,72].midicps/([1.25,1,1.5,2]*2pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~voce.play;
);" ],
[ 374.488841975, 'me', "(
~voce.quant=2;
~voce.fadeTime=2;
~voce={
  var sig = LFSaw.ar([60,63,65,72].midicps.scramble/([1.25,1,1.5,2]*2pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~voce.play;
);" ],
[ 385.910994922, 'me', "(
~voce.quant=2;
~voce.fadeTime=2;
~voce={
  var sig = LFSaw.ar([60,63,65,72].midicps.scramble/([1.25,1,1.5,2]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~voce.play;
);" ],
[ 391.710955743, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/([1.25,1,1.5,2]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 413.483950429, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/([1.25,1,1.5,2]*0.5pi));
  sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 418.023995099, 'me', "(
~voce.quant=2;
~voce.fadeTime=2;
~voce={
  var sig = LFSaw.ar([60,63,65,72].midicps.scramble/([1.25,1,1.5,2]*pi));
  sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~voce.play;
);" ],
[ 433.984152787, 'me', "thisProcess.stop;" ],
[ 574.389558538, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/([1.25,1,1.5,2]*0.5pi));
  sig = sig * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 684.736407925, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,63,65,72].midicps/([1.25,1,1.5,2]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 691.299251099, 'me', "(
~voce.quant=2;
~voce.fadeTime=2;
~voce={
  var sig = LFSaw.ar([60,63,65,72].midicps.scramble/([1.25,1,1.5,2]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~voce.play;
);" ],
[ 736.070628326, 'me', "(
~abc.quant=2;
~abc.fadeTime=2;
~abc={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[2,4,8,12]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~abc.play;
);" ],
[ 795.724955977, 'me', "(
~voce.quant=2;
~voce.fadeTime=2;
~voce={
  var sig = LFSaw.ar([60,63,64,72].midicps.scramble/([1.25,1,1.5,2]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~voce.play;
);" ],
[ 801.601483861, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,64,65,72].midicps/([1.25,1,1.5,2]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 810.073691935, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,64,65,72].midicps/([1.5,1,1.5,2]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 821.409228217, 'me', "(
~voce.quant=2;
~voce.fadeTime=2;
~voce={
  var sig = LFSaw.ar([60,63,65,72].midicps.scramble/([1.25,1,1.5,2]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~voce.play;
);" ],
[ 827.396580952, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,69,65,72].midicps/([1.5,1,1.5,2]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 833.98907976, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,69,65,72].midicps/([1.5,1.25,1.5,2]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 835.978898486, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,69,65,72].midicps/([1.5,1.25,1.25,2]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 838.13650032, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,69,65,72].midicps/([1.5,1.25,1.25,3]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 840.567070202, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,69,65,72].midicps/([1.25,1.25,1.25,3]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 845.440009806, 'me', "(
~voce.quant=2;
~voce.fadeTime=2;
~voce={
  var sig = LFSaw.ar([60,63,65,72].midicps.scramble/([1.25,1,1,2]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~voce.play;
);" ],
[ 848.457867257, 'me', "(
~voce.quant=2;
~voce.fadeTime=2;
~voce={
  var sig = LFSaw.ar([60,63,65,72].midicps.scramble/([1,4,1,2]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~voce.play;
);" ],
[ 863.428994827, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,69,65,72].midicps/([1.25,1.25,1.25,1.125]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~alal.play;
);" ],
[ 906.338916916, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~hiss.play;
);" ],
[ 920.809634294, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25]/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
~hiss.play;
);" ],
[ 929.069625953, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = WhiteNoise.ar(0.1!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25]/4),0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
~hiss.play;
);" ],
[ 937.741171035, 'me', "(
~abc.quant=2;
~abc.fadeTime=2;
~abc={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[2,4,8,12]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~abc.play;
);" ],
[ 953.936235231, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = WhiteNoise.ar(0.5!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25]/4),0.2);
  Splay.ar(sig.flat,0.25,0.5);
};
~hiss.play;
);" ],
[ 1062.834514062, 'me', "(
~abc.quant=2;
~abc.fadeTime=2;
~abc={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[2,4,8,12]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.002);
};
~abc.play;
);" ],
[ 1071.871872256, 'me', "(
~abc.quant=2;
~abc.fadeTime=2;
~abc={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[2,4,8,12]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.02);
};
~abc.play;
);" ],
[ 1084.578293517, 'me', "(
~alal.quant=2;
~alal.fadeTime=2;
~alal={
  var sig = LFSaw.ar([60,69,65,72].midicps/([1.25,1.25,1.25,1.125]*0.5pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.005);
};
~alal.play;
);" ],
[ 1088.905405523, 'me', "(
~voce.quant=2;
~voce.fadeTime=2;
~voce={
  var sig = LFSaw.ar([60,63,65,72].midicps.scramble/([1,4,1,2]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.005);
};
~voce.play;
);" ],
[ 1094.815844951, 'me', "(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = WhiteNoise.ar(0.5!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25]/4),0.2);
  Splay.ar(sig.flat,0.25,0.0005);
};
~hiss.play;
);" ],
[ 1099.41548915, 'me', "(
~voce.quant=2;
~voce.fadeTime=2;
~voce={
  var sig = LFSaw.ar([60,63,65,72].midicps.scramble/([1,4,1,2]*pi));
  sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
  sig = Resonz.ar(sig,m.kr(0,1)*20000+40) + LPF.ar(sig,m.kr(0,2)*20000+40);
  sig = GVerb.ar(sig)/2+sig;
  Splay.ar(sig.flat,0.25,0.5);
};
~voce.play;
);" ],
[ 1121.078561378, 'me', "(
~abc.quant=2;
~abc.fadeTime=2;
~abc={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,[2,4,8,12]);
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/3,1/2);
  sig = (high+mid+low).flat;
  Splay.ar(sig,0.25,0.2);
};
~abc.play;
);" ],
[ 1140.364809095, 'me', "thisProcess.stop;" ],
];