

// alal synth ///////////////////////////////////////

(
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
);
~alal.stop(7);



// voce synth ///////////////////////////////////////

(
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
);
~voce.stop(7);


// hiss synth ///////////////////////////////////////

(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = WhiteNoise.ar(0.5!2);
  sig = sig * Decay.ar(Impulse.ar(1/2,(0..3)++[0.5,0.25]/4),0.2);
  Splay.ar(sig.flat,0.25,0.0005);
};
~hiss.play;
);
~hiss.stop(7);


// kick synth ///////////////////////////////////////

(
~kick.quant=2;
~kick.fadeTime=2;
~kick={
  var imp = EnvGen.ar(Env([0,1,0],[0.02,1],[3,-3]),Impulse.ar(1/2,(0..3)/4));
  var sig = SinOsc.ar((50..60));
  sig = sig * imp;
  Splay.ar(sig.flat,0.25,0.5);
};
~kick.play;
);
~kick.stop(7);

// abc filter ///////////////////////////////////////

(
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
);
~abc.stop(7);


History.end
