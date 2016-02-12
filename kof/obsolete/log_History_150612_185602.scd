// History, as it was on Fri Jun 12 18:56:02 2015.

[
[ 0, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2 + m.kr(0,1));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 34.266647696, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * Decay.ar(Impulse.ar(m.kr(0,1)/64.0,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 59.266721397, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * Decay.kr(Impulse.kr(m.kr(0,1)/64.0,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 69.063777593, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * Decay.kr(Impulse.kr(m.kr(0,1),(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 77.904258242, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * Decay.kr(Impulse.kr(m.kr(0,1)*4,(0..3)/4),1);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 246.535868712, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)/4),1);
  sig = Greyhole.ar(sig,m.kr(0,1),m.kr(0,2),m.kr(0,3));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 262.901326465, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2);
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = Greyhole.ar(sig,m.kr(0,1),m.kr(0,2),m.kr(0,3));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 294.851303182, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2 + (m.kr(0,5)*5000));
  sig = sig * Decay.ar(Impulse.ar(1,(0..3)/4),1);
  sig = Greyhole.ar(sig,m.kr(0,1),m.kr(0,2),m.kr(0,3));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 344.526162127, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2 + (m.kr(0,5)*5000));
  sig = sig * Decay.ar(Impulse.ar(2,(0..3)/4),1);
  sig = Greyhole.ar(sig,m.kr(0,1),m.kr(0,2),m.kr(0,3));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 460.051558564, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2 + (m.kr(0,5)*5000));
  sig = sig * Decay.ar(Impulse.ar(m.kr(0,7),(0..3)/4),1);
  sig = Greyhole.ar(sig,m.kr(0,1),m.kr(0,2),m.kr(0,3));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 463.85604526, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2 + (m.kr(0,5)*5000));
  sig = sig * Decay.ar(Impulse.ar(m.kr(0,7)*4,(0..3)/4),1);
  sig = Greyhole.ar(sig,m.kr(0,1),m.kr(0,2),m.kr(0,3));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 628.088585777, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2 + (m.kr(0,5)*5000));
  sig = sig * Decay.ar(Impulse.ar(m.kr(0,7)*4,(0..3)/4),1);
  sig = CombN.ar(sig,1,m.kr(0,5),m.kr(0,6)*16);
  sig = Greyhole.ar(sig,m.kr(0,1),m.kr(0,2),m.kr(0,3));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 669.669233228, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2 + (m.kr(0,5)*5000));
  sig = sig * Decay.ar(Impulse.ar(m.kr(0,7)*4,(0..3)++[0.5,0.25]/4),1);
  sig = CombN.ar(sig,1,m.kr(0,5),m.kr(0,6)*16);
  sig = Greyhole.ar(sig,m.kr(0,1),m.kr(0,2),m.kr(0,3));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.play;
);" ],
[ 672.904247433, 'me', "(
~test.quant=2;
~test.fadeTime=2;
~test={
  var sig = LFSaw.ar(50!2 + (m.kr(0,5)*5000));
  sig = sig * Decay.ar(Impulse.ar(m.kr(0,7)*4,(0..3)++[0.5,0.25]/4),0.25);
  sig = CombN.ar(sig,1,m.kr(0,5),m.kr(0,6)*16);
  sig = Greyhole.ar(sig,m.kr(0,1),m.kr(0,2),m.kr(0,3));
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~test,postVol:true);
~test.pla