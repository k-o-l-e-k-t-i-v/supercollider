(
  p=ProxySpace.push(s.reboot);
  m=ProxySubmix.new(\filter);
);



(
~test.quant=2;
~test.fadeTime=2;
~test={
  var env = EnvGen.ar(Env([0,1,0],[0.02,0.51],[3,-3]),Impulse.ar(1,(0..3)++0.5/4));
  var sig = SinOsc.ar(72+(env*10)) * env;
  sig = sig;
  Splay.ar(sig.flat,0.25,0.75);
};
m.addMix(~test,postVol:true);
~test.play;
);
~test.stop(7);


(
~hiss.quant=2;
~hiss.fadeTime=2;
~hiss={
  var sig = LPF.ar(WhiteNoise.ar(0.3!2),LFSaw.ar(44).exprange(444.001,14000));
  sig = sig * LFSaw.ar(1/32).exprange(0.000001,1);
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~hiss,postVol:true);
~hiss.play;
);
~hiss.stop(7);


(
~pink.quant=2;
~pink.fadeTime=2;
~pink={
  var sig = Blip.ar(4320,10) * EnvGen.ar(Env([0,1,0],[0.02,4],[3,-3]),Impulse.ar(1/32,(0..3)/4));
  sig = sig;
  Splay.ar(sig.flat,0.25,0.15);
};
m.addMix(~pink,postVol:true);
~pink.play;
);
~pink.stop(7);


(
~saw.quant=2;
~saw.fadeTime=2;
~saw={
  var sig = LFSaw.ar(50*[1,1.5]);
  sig = sig * LFSaw.ar(1/[8,16]).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.045);
};
m.addMix(~saw,postVol:true);
~saw.play;
);
~saw.stop(7);


(
~reverb.quant=2;
~reverb.fadeTime=2;
~reverb={
  var sig = m.ar;
  sig = GVerb.ar(sig,10);
  sig = CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.7);
};
~reverb.play;
);
~reverb.stop(7);



History.end


/// recording, not perfect but now it has history, code & file is rendering into sound

History.play;
s.prepareForRecord("/tmp/recording.aiff");
s.record;
// wait
s.endRecording;


