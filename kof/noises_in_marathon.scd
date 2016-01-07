

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

// iii synth ///////////////////////////////////////

(
~iii.ar(2);
~iii.quant=2;
~iii.fadeTime=4;
~iii={
  var mod = Duty.kr(1/4,0,Dseq([1,2,1.5,1.25],inf)).lag(1/4);
  var mod2 = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)).lag(1/4);
  var mod3 = Duty.kr(16,0,Dseq([1,2,1.5,1.25],inf)).lag(1/4);
  var sig = AudioIn.ar([0,1]) ;
  sig = Resonz.ar(sig,2320/[1,1.5,1.25,1.333333,4,1,2,4]/mod/mod2/mod3,0.009,mul:LFNoise2.kr(4!8));
  sig = Normalizer.ar(sig);
  sig = sig * LFSaw.ar(8/(1..8)).exprange(0.001,1) ;
  sig = CombN.ar(sig,1/4,1/2*mod*mod2*mod3,16);
  sig = BPF.ar(sig,16000/16*(1..16),0.2,mul:LFNoise2.kr(1/4!16));
  sig = Normalizer.ar(sig);
  sig = GVerb.ar(sig,100,10) ;
  Splay.ar(sig,0.95,1,SinOsc.kr(2)*4);
};
~iii.play;
);
~iii.stop(4);
~iii.clear;
~iii.pause;
~iii.resume;


s.scope;
