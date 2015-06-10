// History, as it was on Wed Jun 10 13:26:53 2015.

[
[ 0, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = Impulse.ar(1);
  sig = Greyhole.ar(sig,2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 26.313056224, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)/4));
  sig = Greyhole.ar(sig,2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 33.604405603, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)/4));
  sig = Greyhole.ar(sig,2);
  Splay.ar(sig.flat,0.25);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 48.1291562, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)/4));
  sig = Greyhole.ar(sig,2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 54.019086305, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)/4));
  sig = Greyhole.ar(sig,0.1);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 66.930973019, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)/4));
  sig = Greyhole.ar(sig,0.1,0.01);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 69.663803724, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)/4));
  sig = Greyhole.ar(sig,0.1,0.01,4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 81.565457493, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)/4));
  sig = Greyhole.ar(sig,0.1,0.01,16)/8 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 89.158466524, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)/4));
  sig = Greyhole.ar(sig,0.1,0.01,16)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 103.634643415, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4));
  sig = Greyhole.ar(sig,0.1,0.01,16)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 111.164172643, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,0.1,0.01,16)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 117.803071139, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,1,0.01,16)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 122.825807255, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,2,0.01,16)/4 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 126.449442385, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,2,0.01,16)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 135.894622432, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,2,0.01,4)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 141.204631726, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,2,0.01,4,0.1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 147.05954607, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,2,0.01,4,0.4)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 151.787666051, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,2,0.01,4,0.133)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 154.848688016, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,2,0.01,4,0.25)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 165.227597776, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50!2) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,2,0.01,8,0.25)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 172.881732589, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50*[1,1.5,2,4]) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,2,0.01,8,0.25)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 376.632301383, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(500*[1,1.5,2,4,8]) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,2,0.01,8,0.25)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 385.127199957, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(500*[1,1.5,2,4,8]) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,1/2,0.01,8,0.25)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 387.76241366, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(500*[1,1.5,2,4,8]) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,1/20,0.01,8,0.25)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 394.621644897, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(500*[1,1.5,2,4,8]) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,1/20,0.0,8,0.25)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 396.927795371, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(500*[1,1.5,2,4,8]) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,1/20,0.0,1,0.25)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 399.708409809, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(500*[1,1.5,2,4,8]) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,1/20,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 406.109918586, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(500*[1,1.5,2,4,8]) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.1);
  sig = Greyhole.ar(sig,1/200,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 413.746443669, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(500*[1,1.5,2,4,8]) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.25);
  sig = Greyhole.ar(sig,1/200,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 423.930689132, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(500*[1,1.5,2,4,8].scramble) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.25);
  sig = Greyhole.ar(sig,1/200,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 434.337737416, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble) * Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.25);
  sig = Greyhole.ar(sig,1/200,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 471.116337646, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.25);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**2*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,1/200,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 476.198151499, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.25);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**4*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,1/200,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 481.129951743, 'me', "thisProcess.stop;" ],
[ 481.562260571, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.25);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,1/200,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 490.768156075, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.15);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,1/200,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 495.114599444, 'me', "thisProcess.stop;" ],
[ 495.750244834, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,1/200,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 502.120886493, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,1/200,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 504.958074859, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,1/2,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 508.542603394, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,2,0.0,1)/2 + sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 513.497025452, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,2,0.0,8)/2 + sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 521.110915798, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,2,0.0,8) + sig;
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 537.535152821, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,2,0.0,8) + sig;
  sig = Resonz.ar(sig,[50,100,150,200]);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 546.454572004, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,2,0.0,8) + sig;
  sig = Resonz.ar(sig,[50,100,150,200]*2);
  Splay.ar(sig.flat,0.25,0.25);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 547.941240472, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,2,0.0,8) + sig;
  sig = Resonz.ar(sig,[50,100,150,200]*2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 556.004065791, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,2,0.0,2) + sig;
  sig = Resonz.ar(sig,[50,100,150,200]*2);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 571.865888239, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,2,0.0,2) + sig;
  sig = Resonz.ar(sig,[50,100,150,200]*4);
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 585.11603774, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Greyhole.ar(sig,2,0.0,2) + sig;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(1/4).exprange(0.001,10));
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 594.73797744, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(1/4).exprange(0.001,10));
  sig = Greyhole.ar(sig,2,0.0,2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 610.329879522, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),0.25);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(1/4).exprange(0.001,10));
  sig = Greyhole.ar(sig,2,0.0,2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 643.953360647, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(2,(0..3)++0.5/4),0.25);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(1/4).exprange(0.001,10));
  sig = Greyhole.ar(sig,2,0.0,2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 663.19898078, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(2,(0..3)++0.5/4),0.25);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(1/4).exprange(0.001,10));
  sig = Greyhole.ar(sig,1/200,0.0,2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 686.770384269, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(2,(0..3)++0.5/4),0.25);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*400));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(1/4).exprange(0.001,100));
  sig = Greyhole.ar(sig,1/200,0.0,2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 696.513355154, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(2,(0..3)++0.5/4),0.25);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*40));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(1/4).exprange(0.001,100));
  sig = Greyhole.ar(sig,1/200,0.0,2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 704.116600352, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(2,(0..3)++0.5/4),0.25);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*14000));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(1/4).exprange(0.001,100));
  sig = Greyhole.ar(sig,1/200,0.0,2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 716.265090528, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),1.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*14000));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(1/4).exprange(0.001,100));
  sig = Greyhole.ar(sig,1/200,0.0,2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 727.19890936, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),1.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*14000));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(4).exprange(0.001,100));
  sig = Greyhole.ar(sig,1/200,0.0,2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 732.217183279, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),1.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*14000));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(4).exprange(0.001,10));
  sig = Greyhole.ar(sig,1/200,0.0,2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 736.807275469, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),1.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*14000));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(4).exprange(0.001,10));
  sig = Greyhole.ar(sig,1/2000,0.0,2) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 744.923055848, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),1.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*14000));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(4).exprange(0.001,10));
  sig = Greyhole.ar(sig,1/2000,0.01,8) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 750.950265445, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),1.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*14000));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(4).exprange(0.001,10));
  sig = Greyhole.ar(sig,1/2,0.01,8) + sig;
  Splay.ar(sig.flat,0.25,0.5);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 759.179261678, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),1.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*14000));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(4).exprange(0.001,10));
  sig = Greyhole.ar(sig,1/2,0.01,8) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 765.138822982, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1/2,(0..3)++0.5/4),1.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*14000));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(4).exprange(0.001,10));
  sig = Greyhole.ar(sig,1/4,0.01,8) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 769.923683027, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var imp = Decay.ar(Impulse.ar(1,(0..3)++0.5/4),1.5);
  var sig = LFSaw.ar(50*[1,1.5,2,4,8].scramble+(imp**3*14000));
  sig = sig * imp;
  sig = Resonz.ar(sig,[50,100,150,200]*LFSaw.ar(4).exprange(0.001,10));
  sig = Greyhole.ar(sig,1/4,0.01,8) + sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~deep,postVol:true);
~deep.play;
);" ],
[ 775.783026839, 'me', "(
~deep.quant=2;
~deep.fadeTime=2;
~deep=