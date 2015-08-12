

(
  p=ProxySpace.push(s.reboot);
//  e=ProxySubmix.new(\filter);
);


// zeman synth ///////////////////////////////////////

(
~weirdo.quant=1;
~weirdo.fadeTime=0.02;
~weirdo={
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3]),imp);
  var sig = AudioIn.ar([0,1]);
  sig = Normalizer.ar(sig);
  sig = PitchShift.ar(sig,0.25,LFNoise2.kr(1/4!8).range(0.75,1.25)) * LFNoise2.kr(1/4!8);
  sig = GVerb.ar(HPF.ar(sig,400),50,spread:90) + LPF.ar(sig,400);
  sig = CompanderD.ar(sig,3/4,1/4,1/2);
  Splay.ar(sig.flat,0.75,1);
};
//      e.addMix(~zeman,postVol:true);
~weirdo.play;
);
~weirdo.stop(7);
~weirdo.clear;

