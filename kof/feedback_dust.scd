




// feedback synth ///////////////////////////////////////

(
~feedback.ar(2);
~feedback.quant=2;
~feedback.fadeTime=4;
~feedback={
  var sig = LocalIn.ar(2);
  sig = Normalizer.ar(sig) + Dust.ar(4!2);
  sig = DelayN.ar(sig,LFNoise2.kr(1!2),LFNoise2.kr(1/4!2).round(1/10));
  sig = PitchShift.ar(sig,0.2,1.5);
  sig = LeakDC.ar(sig);
  sig = Normalizer.ar(sig);
  sig = GVerb.ar(sig,100,10);
  sig = CompanderD.ar(sig,1/2,1/2,1/2);
  LocalOut.ar(sig);
  Splay.ar(sig,0.5,0.25);
};
~feedback.play;
);
~feedback.stop(4);
~feedback.clear;
~feedback.pause;
~feedback.resume;
